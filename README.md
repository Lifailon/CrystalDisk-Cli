# CrystalDisk-Cli

[![GitHub Release](https://img.shields.io/github/v/release/Lifailon/CrystalDisk-Cli?display_name=release&logo=GitHub&label=GitHub&link=https%3A%2F%2Fgithub.com%2FLifailon%2FCrystalDisk-Cli%2F)](https://github.com/Lifailon/CrystalDisk-Cli)
[![NuGet Version](https://img.shields.io/nuget/v/CrystalDisk-Cli?logo=NuGet&label=NuGet&link=https%3A%2F%2Fwww.nuget.org%2Fpackages%2FCrystalDisk-Cli)](https://www.nuget.org/packages/CrystalDisk-Cli)
[![GitHub top language](https://img.shields.io/github/languages/top/Lifailon/CrystalDisk-Cli?logo=PowerShell&link=https%3A%2F%2Fgithub.com%2FPowerShell%2FPowerShell)](https://github.com/PowerShell/PowerShell)
[![GitHub License](https://img.shields.io/github/license/Lifailon/CrystalDisk-Cli?link=https%3A%2F%2Fgithub.com%2FLifailon%2FCrystalDisk-Cli%2Fblob%2Frsa%2FLICENSE)](https://github.com/Lifailon/CrystalDisk-Cli/blob/rsa/LICENSE)

Command line interface using PowerShell module for software [CrystalDiskInfo](https://github.com/hiyohiyo/CrystalDiskInfo).

When the program CrystalDiskInfo scans for information about the state of physical disks using, it saves its data in an ini files. This module reads current and relevant data for provides information in the format of a PowerShell Object/Collection.

## 🚀 Install

💡 **Dependencies**. You must already have the [CrystalDiskInfo](https://crystalmark.info/en/software/crystaldiskinfo) software installed and running.

PowerShell 5.1 and Core versions are supported.

You can install the module from the repository [nuget](https://www.nuget.org/packages/CrystalDisk-Cli):

```PowerShell
Install-Module CrystalDisk-Cli -Repository NuGet
```

💡 You must have a NuGet repository registered:

```PowerShell
Register-PSRepository -Name "NuGet" -SourceLocation "https://www.nuget.org/api/v2" -InstallationPolicy Trusted
```

Get list of available commands:

```PowerShell
Import-Module CrystalDisk-Cli
Get-Command -Module CrystalDisk-Cli

CommandType     Name                    Version    Source
-----------     ----                    -------    ------
Function        ConvertFrom-Ini         0.2        CrystalDisk-Cli
Function        Get-DiskInfo            0.2        CrystalDisk-Cli
Function        Get-DiskInfoSettings    0.2        CrystalDisk-Cli
```

## 📑 Data

Get an up-to-date report (starts the scanning and waits for the results to be finalized):

```PowerShell
> Get-Date

16 февраля 2024 г. 13:43:30

> Get-DiskInfo -Report | Select-Object Name,Date,HealthStatus,Temperature

Name                                  Date                HealthStatus Temperature
----                                  ----                ------------ -----------
MSI M390 250GB511220510128001162      2024/02/16 13:43:32 1            40
ST1000DM003-1CH162Z1DD33DT            2024/02/16 13:43:32 1            34
WDC WD2005FBYZ-01YCBB2WD-WMC6N0L3JK47 2024/02/16 13:43:32 1            36
```

Displays only the disk list:

```PowerShell
> Get-DiskInfo -List
MSI M390 250GB511220510128001162
ST1000DM003-1CH162Z1DD33DT
WDC WD2005FBYZ-01YCBB2WD-WMC6N0L3JK47
```

Get all data (reads the last scan data by default):

```PowerShell
> Get-DiskInfo

Name                    : MSI M390 250GB511220510128001162
Date                    : 2024/02/16 13:43:32
HealthStatus            : 1
Temperature             : 40
PowerOnHours            : 8752
PowerOnCount            : 92
Life                    : 62
HostWrites              : 32030
HostReads               : 5870
01                      : 0
02                      : 0
03                      : 0
04                      : 0
05                      : 0
ReallocatedSectorsCount : 38
06                      : 0
07                      : 0
08                      : 0
09                      : 0
0A                      : 0
0B                      : 0
0C                      : 0
0D                      : 0
0E                      : 0
0F                      : 0

Name                      : ST1000DM003-1CH162Z1DD33DT
Date                      : 2024/02/16 13:43:32
HealthStatus              : 1
Temperature               : 34
PowerOnCount              : 44
01                        : 116
03                        : 98
04                        : 100
05                        : 100
ReallocatedSectorsCount   : 0
07                        : 87
09                        : 64
0A                        : 100
0C                        : 100
B7                        : 100
B8                        : 100
BB                        : 100
BC                        : 100
BD                        : 99
BE                        : 66
BF                        : 100
C0                        : 100
C1                        : 76
C2                        : 34
C5                        : 100
CurrentPendingSectorCount : 0
C6                        : 100
UncorrectableSectorCount  : 0
C7                        : 200
F0                        : 100
F1                        : 100
F2                        : 100
PowerOnHours              : 31934

Name                      : WDC WD2005FBYZ-01YCBB2WD-WMC6N0L3JK47
Date                      : 2024/02/16 13:43:32
HealthStatus              : 1
Temperature               : 36
PowerOnCount              : 113
01                        : 200
03                        : 197
04                        : 100
05                        : 200
ReallocatedSectorsCount   : 0
07                        : 200
09                        : 82
0A                        : 100
0B                        : 100
0C                        : 100
10                        : 1
B7                        : 100
C0                        : 200
C1                        : 198
C2                        : 111
C4                        : 200
ReallocationEventCount    : 0
C5                        : 200
CurrentPendingSectorCount : 0
C6                        : 100
UncorrectableSectorCount  : 0
C7                        : 200
C8                        : 100
PowerOnHours              : 13318
```

Example on a laptop and PowerShell 5.1:

```PowerShell
PS C:\Users\lifailon> Get-DiskInfo

Name                    : WD PC SN740 SDDPNQD-1T00-10272243A5454811
Date                    : 2024/02/16 13:50:45
HealthStatus            : 1
Temperature             : 49
PowerOnHours            : 1003
PowerOnCount            : 444
Life                    : 100
HostWrites              : 10264
HostReads               : 10050
01                      : 0
02                      : 0
03                      : 0
04                      : 0
05                      : 0
ReallocatedSectorsCount : 0
06                      : 0
07                      : 0
08                      : 0
09                      : 0
0A                      : 0
0B                      : 0
0C                      : 0
0D                      : 0
0E                      : 0
0F                      : 0
```

## 🔧 Settings

If you run the `Get-DiskInfoSettings` command without parameters, it will return all current settings.



```PowerShell
> Get-DiskInfoSettings

DebugMode               : 0
AutoRefresh             : 10
StartupWaitTime         : 30
Temperature             : 0
ResidentMinimize        : 0
MegaRAID                : 1
StartupFixed            : 1
Language                : Russian
Startup                 : 0
X                       : 869
Y                       : 360
Resident                : 1
HideSerialNumber        : 0
GraphHeight             : 480
GraphWidth              : 640
Height                  : 651
ShowTemperatureIconOnly : 1
SelectedAttributeId     : 300
Theme                   : Default
SmartEnglish            : 0
```

♻️ To change the frequency of automatic scanning, use the `AutoRefresh` parameter (all parameters contain a prepared list).

```PowerShell
> Get-DiskInfoSettings -AutoRefresh 5

DebugMode               : 0
AutoRefresh             : 5
StartupWaitTime         : 30
Temperature             : 0
ResidentMinimize        : 0
MegaRAID                : 1
StartupFixed            : 1
Language                : Russian
Startup                 : 0
X                       : 869
Y                       : 360
Resident                : 1
HideSerialNumber        : 0
GraphHeight             : 480
GraphWidth              : 640
Height                  : 651
ShowTemperatureIconOnly : 1
SelectedAttributeId     : 300
Theme                   : Default
SmartEnglish            : 0
```

Use the `Startup` parameter to enable or disable an application to run in autoload mode. To enable or disable an application in agent mode, use the `Resident` parameter.