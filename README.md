# CrystalDisk-cli

Command line interface using PowerShell module for sofrtware [CrystalDiskInfo](https://github.com/hiyohiyo/CrystalDiskInfo).

When the program CrystalDiskInfo scans for information about the state of physical disks using, it saves its data in an ini file. This module reads only current and relevant data for provides information in the format of a PowerShell object.

### Install

You can install the module from the repository [nuget](https://www.nuget.org/packages/CrystalDisk-Cli/):

```PowerShell
Install-Module CrystalDisk-Cli -Repository NuGet
```

Main function: `Get-DiskInfo`

Parameters: \
`$path` - Set your own path to the installed program (default: `C:\Program Files\CrystalDiskInfo`) \
`Report` - Generate report right now (the program is started for the time of report generation, you must **use the console with administrator rights**). Without this option the last received data are generated, if the program is running constantly, the refresh rate can be changed in the interface settings or in the file: `DiskInfo.ini (Settings - AutoRefresh)`.

## Examples:

```PowerShell
PS C:\Windows\System32> Import-Module CrystalDisk-Cli
PS C:\Windows\System32> $(Get-Command -Module CrystalDisk-Cli).Name

ConvertFrom-Ini
Get-DiskInfo

PS C:\Windows\System32> Get-DiskInfo -Report | Format-List

MSI M390 250GB511220510128001162      : @{Date=System.Collections.Hashtable+ValueCollection; HealthStatus=System.Collections.Hashtable+ValueCollection; Temperature
                                        =System.Collections.Hashtable+ValueCollection; PowerOnHours=System.Collections.Hashtable+ValueCollection; PowerOnCount=Syst
                                        em.Collections.Hashtable+ValueCollection; Life=System.Collections.Hashtable+ValueCollection; HostWrites=System.Collections.
                                        Hashtable+ValueCollection; HostReads=System.Collections.Hashtable+ValueCollection; 01=System.Collections.Hashtable+ValueCol
                                        lection; 02=System.Collections.Hashtable+ValueCollection; 03=System.Collections.Hashtable+ValueCollection; 04=System.Collec
                                        tions.Hashtable+ValueCollection; 05=System.Collections.Hashtable+ValueCollection; ReallocatedSectorsCount=System.Collection
                                        s.Hashtable+ValueCollection; 06=System.Collections.Hashtable+ValueCollection; 07=System.Collections.Hashtable+ValueCollecti
                                        on; 08=System.Collections.Hashtable+ValueCollection; 09=System.Collections.Hashtable+ValueCollection; 0A=System.Collections
                                        .Hashtable+ValueCollection; 0B=System.Collections.Hashtable+ValueCollection; 0C=System.Collections.Hashtable+ValueCollectio
                                        n; 0D=System.Collections.Hashtable+ValueCollection; 0E=System.Collections.Hashtable+ValueCollection; 0F=System.Collections.
                                        Hashtable+ValueCollection}
ST1000DM003-1CH162Z1DD33DT            : @{Date=System.Collections.Hashtable+ValueCollection; HealthStatus=System.Collections.Hashtable+ValueCollection; Temperature
                                        =System.Collections.Hashtable+ValueCollection; PowerOnCount=System.Collections.Hashtable+ValueCollection; 01=System.Collect
                                        ions.Hashtable+ValueCollection; 03=System.Collections.Hashtable+ValueCollection; 04=System.Collections.Hashtable+ValueColle
                                        ction; 05=System.Collections.Hashtable+ValueCollection; ReallocatedSectorsCount=System.Collections.Hashtable+ValueCollectio
                                        n; 07=System.Collections.Hashtable+ValueCollection; 09=System.Collections.Hashtable+ValueCollection; 0A=System.Collections.
                                        Hashtable+ValueCollection; 0C=System.Collections.Hashtable+ValueCollection; B7=System.Collections.Hashtable+ValueCollection
                                        ; B8=System.Collections.Hashtable+ValueCollection; BB=System.Collections.Hashtable+ValueCollection; BC=System.Collections.H
                                        ashtable+ValueCollection; BD=System.Collections.Hashtable+ValueCollection; BE=System.Collections.Hashtable+ValueCollection;
                                         BF=System.Collections.Hashtable+ValueCollection; C0=System.Collections.Hashtable+ValueCollection; C1=System.Collections.Ha
                                        shtable+ValueCollection; C2=System.Collections.Hashtable+ValueCollection; C5=System.Collections.Hashtable+ValueCollection;
                                        CurrentPendingSectorCount=System.Collections.Hashtable+ValueCollection; C6=System.Collections.Hashtable+ValueCollection; Un
                                        correctableSectorCount=System.Collections.Hashtable+ValueCollection; C7=System.Collections.Hashtable+ValueCollection; F0=Sy
                                        stem.Collections.Hashtable+ValueCollection; F1=System.Collections.Hashtable+ValueCollection; F2=System.Collections.Hashtabl
                                        e+ValueCollection; PowerOnHours=System.Collections.Hashtable+ValueCollection}
WDC WD2005FBYZ-01YCBB2WD-WMC6N0L3JK47 : @{Date=System.Collections.Hashtable+ValueCollection; HealthStatus=System.Collections.Hashtable+ValueCollection; Temperature
                                        =System.Collections.Hashtable+ValueCollection; PowerOnCount=System.Collections.Hashtable+ValueCollection; 01=System.Collect
                                        ions.Hashtable+ValueCollection; 03=System.Collections.Hashtable+ValueCollection; 04=System.Collections.Hashtable+ValueColle
                                        ction; 05=System.Collections.Hashtable+ValueCollection; ReallocatedSectorsCount=System.Collections.Hashtable+ValueCollectio
                                        n; 07=System.Collections.Hashtable+ValueCollection; 09=System.Collections.Hashtable+ValueCollection; 0A=System.Collections.
                                        Hashtable+ValueCollection; 0B=System.Collections.Hashtable+ValueCollection; 0C=System.Collections.Hashtable+ValueCollection
                                        ; 10=System.Collections.Hashtable+ValueCollection; B7=System.Collections.Hashtable+ValueCollection; C0=System.Collections.H
                                        ashtable+ValueCollection; C1=System.Collections.Hashtable+ValueCollection; C2=System.Collections.Hashtable+ValueCollection;
                                         C4=System.Collections.Hashtable+ValueCollection; ReallocationEventCount=System.Collections.Hashtable+ValueCollection; C5=S
                                        ystem.Collections.Hashtable+ValueCollection; CurrentPendingSectorCount=System.Collections.Hashtable+ValueCollection; C6=Sys
                                        tem.Collections.Hashtable+ValueCollection; UncorrectableSectorCount=System.Collections.Hashtable+ValueCollection; C7=System
                                        .Collections.Hashtable+ValueCollection; C8=System.Collections.Hashtable+ValueCollection; PowerOnHours=System.Collections.Ha
                                        shtable+ValueCollection}

PS C:\Windows\System32> $(Get-DiskInfo | Get-Member -MemberType NoteProperty).Name

MSI M390 250GB511220510128001162
ST1000DM003-1CH162Z1DD33DT
WDC WD2005FBYZ-01YCBB2WD-WMC6N0L3JK47

PS C:\Windows\System32> $(Get-DiskInfo -Report)."MSI M390 250GB511220510128001162"

Date                    : {2024/01/28 20:49:12}
HealthStatus            : {1}
Temperature             : {39}
PowerOnHours            : {8313}
PowerOnCount            : {92}
Life                    : {64}
HostWrites              : {31706}
HostReads               : {5670}
01                      : {0}
02                      : {0}
03                      : {0}
04                      : {0}
05                      : {0}
ReallocatedSectorsCount : {36}
06                      : {0}
07                      : {0}
08                      : {0}
09                      : {0}
0A                      : {0}
0B                      : {0}
0C                      : {0}
0D                      : {0}
0E                      : {0}
0F                      : {0}

PS C:\Windows\System32> $(Get-DiskInfo -Report)."MSI M390 250GB511220510128001162".Temperature
39
```