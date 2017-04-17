$ErrorActionPreference = 'Stop';

$packageName        = 'ms-reportviewer2015'
$scriptPath         = $(Split-Path $MyInvocation.MyCommand.Path)
$url_local          = "https://download.microsoft.com/download/A/1/2/A129F694-233C-4C7C-860F-F73139CF2E01/ENU/x86/ReportViewer.msi"
$url_remote         = "https://download.microsoft.com/download/A/1/2/A129F694-233C-4C7C-860F-F73139CF2E01/ENU/x86/ReportViewer.msi"
$url_local64        = "https://download.microsoft.com/download/A/1/2/A129F694-233C-4C7C-860F-F73139CF2E01/ENU/x86/ReportViewer.msi"
$url_remote64       = "https://download.microsoft.com/download/A/1/2/A129F694-233C-4C7C-860F-F73139CF2E01/ENU/x86/ReportViewer.msi"
$url_local_trans    = ""
$url_remote_trans   = ""
$checksum           = "85adfc54e0ede6a847d3cbfd8026330114a78923ef969cd0b4cb99cd28b0fec7"
$checksum64         = "85adfc54e0ede6a847d3cbfd8026330114a78923ef969cd0b4cb99cd28b0fec7"
$logfile            = "$env:TEMP\chocolatey\$($packageName)\$($packageName).MsiInstall.log"
$logdir             = "$env:TEMP\chocolatey\$($packageName)"

# let's zero needed variables
$url                = ""
$url64              = ""
$url_trans          = ""
$killexec           = 0
$killexecprocess    = ""

# Let's check if should we use local or remote install source
$statusCode = Test-Path $url_local
if ($statusCode) {
                    $url=$url_local
                    $url64=$url_local64
                    $url_trans=$url_local_trans
                }
    else {
        $url=$url_remote
        $url64=$url_remote64
        $url_trans=$url_remote_trans
    }

# Someone has won ;)

#Let's check your TEMP derectory

$statusCode = Test-Path $logdir
if ($statusCode) {

                }
    else {
        $logfile="$env:WINDIR\TEMP\chocolatey\$($packageName).MsiInstall.log"

    }

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'msi'
  silentArgs    = "/qn /norestart"
  validExitCodes= @(0, 3010, 1603, 1641)
  url           = $url
  url64bit      = $url64
  checksumType  = 'sha256'
  checksumType64= 'sha256'
  checksum      = $checksum
  checksum64    = $checksum64
}

# Should we kill some exec ?
if ($killexec) {
  Stop-Process -processname $killexecprocess -force
}

# wait and install package
Start-Sleep -s 5
Install-ChocolateyPackage @packageArgs
