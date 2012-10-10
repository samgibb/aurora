<?php
class Dxcore_Controller_Plugin_License extends Zend_Controller_Plugin_Abstract
{
	public $path;
	private $remoteKey;
	protected $localKey;

    public function preDispatch (Zend_Controller_Request_Abstract $request)
    {
    	if($this->_request->module !== 'admin' && $this->_request->module !== 'user')
    	{
    		self::license();
    	}
	}
	function license() {
		// Each key is unique please request from Joey Or Michael R
		$settings = new Admin_Model_AppSettings();
		$key = $settings->fetchVar('remoteLicenseKey');
		$this->remoteKey = $key->value;
		$localkey = $this->getlocalKey();

		$results = $this->check_license($this->remoteKey,$localkey);
		//Zend_Debug::dump($results);

		if ($results["status"]=="Active") {
			# Allow Script to Run
			if ($results["localkey"]) {
				# Save Updated Local Key to DB or File
				$this->writeLocalKey($results["localkey"]);
			}
		}
		elseif ($results["status"]=="Invalid") {
			die('License is invalid');
		}
		elseif ($results["status"]=="Expired")
		{
			die('License is expired');
		}
		elseif ($results["status"]=="Suspended") {
			die('License is suspended');
		}
	}
	function getlocalKey() {

		$file = APPLICATION_PATH . '/data/license.txt';

		if(!file_exists($file)) {

			if(!is_readable($file)) {
				die('file not readable');
			}
			$key = file_get_contents($file);
			return $key;
		}
	}
	function writeLocalKey($localkey) {
		$file = APPLICATION_PATH . '/data/license.txt';
		if(! file_exists($file)) {
			die('no license file found');
		}
		if(!is_writable($file)) {
			die('license file not writable');
		}
		$fhandle = @fopen($file, 'r+');
		$length = @fwrite($fhandle, $localkey);
		@fclose($fhandle);
	}
	private function check_license($licensekey,$localkey="") {
		$whmcsurl = "http://clients.dirextion.com/";
		$licensing_secret_key = "InertiaCMSsd"; # Unique value, should match what is set in the product configuration for MD5 Hash Verification

		$check_token = time().md5(mt_rand(1000000000,9999999999).$licensekey);
		$checkdate = date("Ymd"); # Current date
		$usersip = isset($_SERVER['SERVER_ADDR']) ? $_SERVER['SERVER_ADDR'] : $_SERVER['LOCAL_ADDR'];
		$localkeydays = 5; # How long the local key is valid for in between remote checks
		$allowcheckfaildays = 1; # How many days to allow after local key expiry before blocking access if connection cannot be made
		$localkeyvalid = false;
		if ($localkey) {
			$localkey = str_replace("\n",'',$localkey); # Remove the line breaks
			$localdata = substr($localkey,0,strlen($localkey)-32); # Extract License Data
			$md5hash = substr($localkey,strlen($localkey)-32); # Extract MD5 Hash
			if ($md5hash==md5($localdata.$licensing_secret_key)) {
				$localdata = strrev($localdata); # Reverse the string
				$md5hash = substr($localdata,0,32); # Extract MD5 Hash
				$localdata = substr($localdata,32); # Extract License Data
				$localdata = base64_decode($localdata);
				$localkeyresults = unserialize($localdata);
				$originalcheckdate = $localkeyresults["checkdate"];
				if ($md5hash==md5($originalcheckdate.$licensing_secret_key)) {
					$localexpiry = date("Ymd",mktime(0,0,0,date("m"),date("d")-$localkeydays,date("Y")));
					if ($originalcheckdate>$localexpiry) {
						$localkeyvalid = true;
						$results = $localkeyresults;
						$validdomains = explode(",",$results["validdomain"]);
						if (!in_array($_SERVER['SERVER_NAME'], $validdomains)) {
							$localkeyvalid = false;
							$localkeyresults["status"] = "Invalid";
							$results = array();
						}
						$validips = explode(",",$results["validip"]);
						if (!in_array($usersip, $validips)) {
							$localkeyvalid = false;
							$localkeyresults["status"] = "Invalid";
							$results = array();
						}
						if ($results["validdirectory"]!=dirname(__FILE__)) {
							$localkeyvalid = false;
							$localkeyresults["status"] = "Invalid";
							$results = array();
						}
					}
				}
			}
		}
		if (!$localkeyvalid) {
			$postfields["licensekey"] = $licensekey;
			$postfields["domain"] = $_SERVER['SERVER_NAME'];
			$postfields["ip"] = $usersip;
			$postfields["dir"] = dirname(__FILE__);
			if ($check_token) $postfields["check_token"] = $check_token;
			if (function_exists("curl_exec")) {
				$ch = curl_init();
				curl_setopt($ch, CURLOPT_URL, $whmcsurl."modules/servers/licensing/verify.php");
				curl_setopt($ch, CURLOPT_POST, 1);
				curl_setopt($ch, CURLOPT_POSTFIELDS, $postfields);
				curl_setopt($ch, CURLOPT_TIMEOUT, 30);
				curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
				$data = curl_exec($ch);
				curl_close($ch);
			} else {
				$fp = fsockopen($whmcsurl, 80, $errno, $errstr, 5);
				if ($fp) {
					$querystring = "";
					foreach ($postfields AS $k=>$v) {
						$querystring .= "$k=".urlencode($v)."&";
					}
					$header="POST ".$whmcsurl."modules/servers/licensing/verify.php HTTP/1.0\r\n";
					$header.="Host: ".$whmcsurl."\r\n";
					$header.="Content-type: application/x-www-form-urlencoded\r\n";
					$header.="Content-length: ".@strlen($querystring)."\r\n";
					$header.="Connection: close\r\n\r\n";
					$header.=$querystring;
					$data="";
					@stream_set_timeout($fp, 20);
					@fputs($fp, $header);
					$status = @socket_get_status($fp);
					while (!@feof($fp)&&$status) {
						$data .= @fgets($fp, 1024);
						$status = @socket_get_status($fp);
					}
					@fclose ($fp);
				}
			}
			if (!$data) {
				$localexpiry = date("Ymd",mktime(0,0,0,date("m"),date("d")-($localkeydays+$allowcheckfaildays),date("Y")));
				if ($originalcheckdate>$localexpiry) {
					$results = $localkeyresults;
				} else {
					$results["status"] = "Invalid";
					$results["description"] = "Remote Check Failed";
					return $results;
				}
			} else {
				preg_match_all('/<(.*?)>([^<]+)<\/\\1>/i', $data, $matches);
				$results = array();
				foreach ($matches[1] AS $k=>$v) {
					$results[$v] = $matches[2][$k];
				}
			}

			if ($results["md5hash"]) {
				if ($results["md5hash"]!=md5($licensing_secret_key.$check_token)) {
					$results["status"] = "Invalid";
					$results["description"] = "MD5 Checksum Verification Failed";
					return $results;
				}
			}
			if ($results["status"]=="Active") {
				$results["checkdate"] = $checkdate;
				$data_encoded = serialize($results);
				$data_encoded = base64_encode($data_encoded);
				$data_encoded = md5($checkdate.$licensing_secret_key).$data_encoded;
				$data_encoded = strrev($data_encoded);
				$data_encoded = $data_encoded.md5($data_encoded.$licensing_secret_key);
				$data_encoded = wordwrap($data_encoded,80,"\n",true);
				$results["localkey"] = $data_encoded;
			}
			$results["remotecheck"] = true;
		}
		unset($postfields,$data,$matches,$whmcsurl,$licensing_secret_key,$checkdate,$usersip,$localkeydays,$allowcheckfaildays,$md5hash);
		return $results;
	}
}