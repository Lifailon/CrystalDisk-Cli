function ConvertFrom-Ini {
    param (
        [Parameter(Mandatory,ValueFromPipeline)]$ini
    )
    $PSObject = New-Object PSObject
    foreach ($string in $ini) {
        if ($string -match "^\[(.+)\]$") {
            # Если находим имя диска, помещаем в родительский объект пустой дочерний объект с именем диска
            $Parent = $Matches[1]
            $CustomObjectChildren = New-Object PSObject
            $PSObject | Add-Member -MemberType NoteProperty `
            -Name $Parent `
            -Value $CustomObjectChildren
        }
        else {
            # Удаляем ковычки из строки и забираем ключ-значение
            $Child = $string -replace '"' | ConvertFrom-StringData
            # Помещяем в последний дочерний объект ключ-значения
            $PSObject.$Parent | Add-Member -MemberType NoteProperty `
            -Name $Child.Keys `
            -Value $Child.Values -Force
        }
    }
    $PSObject
}

function Get-DiskInfo {
    param (
        $Path = "C:\Program Files\CrystalDiskInfo",
        [switch]$Report
    )
    if ($Report) {
        # Запускаем отчет и проверяем его создание по дате изменения
        $DateTemp = Get-Date
        Start-Process -FilePath "$Path\DiskInfo64.exe" -ArgumentList "/CopyExit" -WindowStyle Hidden
        while ($true) {
            if ($(Get-ChildItem "$Path\DiskInfo.txt" -ErrorAction Ignore).LastWriteTime -gt $DateTemp) {
                break
            }
        }
    }
    $Smart_Path = "$Path\Smart"
    # Формируем массив из имен дисков вложенных директорий
    $Disk_Array = @($(Get-ChildItem $Smart_Path | Where-Object Attributes -eq "Directory").Name)
    $MainObject = New-Object PSObject
    foreach ($Disk in $Disk_Array) {
        # Читаем содержимое ini-файла
        $ini = Get-Content "$Smart_Path\$Disk\Smart.ini"
        # Конвертируем содержимое ini-файла в объект
        $ChildrenObject = ConvertFrom-Ini $ini
        # Заполняем родительский объект из имени диска и дочерним объектом
        $MainObject | Add-Member -MemberType NoteProperty `
        -Name $Disk `
        -Value $ChildrenObject
    }
    # $MainObject
    # Пересобираем объект с фильтрацией по дате и одним вложенным родительским объектом
    $Date = $(Get-Date).ToString("yyyy/MM/dd")
    $NewObject = New-Object PSObject
    foreach ($Disk in $Disk_Array) {
        $ChildrenArray = $($MainObject.$Disk | Get-Member -MemberType NoteProperty).Name
        foreach ($Children in $ChildrenArray) {
            $CheckDate = $MainObject.$Disk.$Children | Where-Object Date -match $Date
            if ($CheckDate) {
                $NewObject | Add-Member -MemberType NoteProperty `
                -Name $Disk `
                -Value $MainObject.$Disk.$Children
                break
            }
        }
    }
    $NewObject
}

# Get-CrystalDiskInfo
# Get-CrystalDiskInfo -Report
# Get-CrystalDiskInfo -Path "C:\Program Files\CrystalDiskInfo" -Report