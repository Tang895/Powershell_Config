
#PowerShell 配置文件
#author: ianTang
#github.com/Tang895
Set-Alias getlist ls
Set-Alias cl 'clear'
Set-Alias py python
Set-Alias ncpa ncpa.cpl
Set-PSReadLineOption -PredictionSource History
$mypath="E://ianhome-pc/mypath"
function nnmap([string]$parm){

	echo $parm
	nmap $parm -O -sS
}
#MD5
function md5sum([string]$file){
	echo "MD5计算ing"
	Get-FileHash $file -Algorithm MD5
}
#SHA256
function sha256sum([string]$file){
	echo "SHA256计算ing"
	Get-FileHash $file -Algorithm SHA256 | Format-List
}
#SHA1
function sha1sum([sttng]$file){
	echo "sha1计算ing"
	Get-FileHash $file -Algorithm SHA1
}
#虚拟显示器
function vson(){
	echo "激活虚拟显示器";
	echo "vson表示激活，vsoff表示取消激活";
	deviceinstaller64 enableidd 1;
}
function vsoff(){
	echo "取消激活虚拟显示器";
	echo "vson表示激活，vsoff表示取消激活";
	deviceinstaller64 enableidd 0;
}
function ppip([string]$mod,[string]$r){
		echo $parm
		echo "pip 临时换源安装ing"
		$command=""
		if($r){
			echo "read TXT mode"
			$command="pip install -i http://pypi.doubanio.com/simple/ --trusted-host pypi.doubanio.com -r "+$r
			pip install -i http://pypi.doubanio.com/simple/ --trusted-host pypi.doubanio.com -r $r
		}
		elseif($mod){
			echo "Common Mode"
			$command="pip install -i http://pypi.doubanio.com/simple/ --trusted-host pypi.doubanio.com "+$mod
			pip install -i http://pypi.doubanio.com/simple/ --trusted-host pypi.doubanio.com $mod
		}
		else{
			echo "Error No input module"
			echo "Use : ppip xxx OR ppip -r requirements.txt"	
		}
		echo "Used Command: "+$command
		return
}
function pr(){
	set t "powershell终端全局代理"
	echo $t
	$Env:http_proxy="http://127.0.0.1:11223"
	$Env:https_proxy="http://127.0.0.1:11223"
	$t="代理地址"
	echo $t
	echo $Env:http_proxy
	echo $Env:https_proxy
}
function nopr(){
	echo "取消全局代理"
	$Env:http_proxy=""
	$Env:https_proxy=""
}

function test([string]$r){
	#useage: test -r xxx
	#ans: xxx
	echo $r
}

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
#$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
#if (Test-Path($ChocolateyProfile)) {
#  Import-Module "$ChocolateyProfile"
#}

