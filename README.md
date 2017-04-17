# Microsoft Report Viewer 2015 Runtime

## Description

The Microsoft Report Viewer 2015 Runtime redistributable package, includes controls for viewing reports designed using Microsoft reporting technology.

## Supported Operating System

Windows 7, Windows 8, Windows 8.1, Windows Server 2003 Service Pack 2, Windows Server 2008 R2 SP1, Windows Server 2012, Windows Vista Service Pack 2

## Pre-requisites

* Microsoft SQL Server 2008 Reporting Services or higher for server processing mode.
* NET Framework 3.5 SP1 or .NET Framework 4.0.
* Check C:\Windows\Microsoft.NET\Framework64
* NET Framework 3.5 is there if we see a folder named v3.5. Further, use the registry to see whether SP1 for v3.5 is there [http://support.microsoft.com/kb/318785](http://support.microsoft.com/kb/318785)
* HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\NET Framework Setup\NDP\v3.5 needs to have DWORD named Install with value 1
* If SP1 is not installed, it can be installed from the Microsoft .NET Framework 3.5 Service Pack 1
* NET Framework 4.0 is there if we see a folder named v4.0
* Microsoft SQL Server System CLR Types package
* It is available in the Install Instructions section of the Microsoft® SQL Server® 2014 Feature Pack page.
* Microsoft® System CLR Types for Microsoft® SQL Server® 2014
* Ensure this order of setup
* Ensure we have the required .NET Framework version per step 1a.
* Run the SQL Server System CLR Types setup from step 1b.
* Run the Report Viewer 2015 runtime setup

## Features

* Install and uninstall via Chocolatey
* Requires source path to MyGet
* Supports only 32-bit version

## Changelog

### 2017-04-15 Build 12.0.2402.15

* initial build
* version 12.0.2402.15
* Virus Total Link - [https://www.virustotal.com/pl/file/85adfc54e0ede6a847d3cbfd8026330114a78923ef969cd0b4cb99cd28b0fec7/analysis/](https://www.virustotal.com/pl/file/85adfc54e0ede6a847d3cbfd8026330114a78923ef969cd0b4cb99cd28b0fec7/analysis/)

## Usage

### Direct

```cmd

choco install ms-reportviewer2015

```

### YAML (Foreman)

```yaml

ms-reportviewer2015:
  ensure: latest
  uninstall_options: "--force --all-versions"
  provider: chocolatey

```

or

```yaml

ms-reportviewer2015:
  ensure: latest

```