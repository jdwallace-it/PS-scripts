# STIG: 
# Tite: The .NET CLR must be configured to use FIPS approved encryption modules
# ID: SV-225230r615940
# CCI: CCI-002450 (NIST SP 800-53 Rev 4: SC-13)


# Open file, put fix text after <runtime>,save file, repeat
## Find & replace value in .NET 4 


# Changed the .csv into an Array because CSVs suck to deal with
$configArray = @()
$GrabFile = Import-Csv 'C:\nt-d_system\ps\dotnetConfigs.csv'
$GrabFile | ForEach-Object {
    $configArray += $_.FilePath
}


 $configArray | ForEach-Object {
    Get-ChildItem -Path $_ -File *.config | 
        ForEach-Object {
        (Get-Content -Path $_) -replace "<runtime>", "<runtime> `n    <enforceFIPSPolicy enabled=`"true`" />" | Set-Content -Path (Split-Path -Path $_)
        }
 }
#(Get-Content $GrabFile).replace("<runtime>", "<runtime> `n    <enforceFIPSPolicy enabled=`"true`" />") | Set-Content $ConfigPath

# $GrabFile | ForEach-Object($_.replace("<runtime>", "<runtime> `n    <enforceFIPSPolicy enabled=`"true`" />")

# (Get-Content).replace(ye,ye) | Set-Content 
## I need to use the set-content command to put the edited file back in its home location.
## strip the beginning "C:" and somehow grab that and the everything up until the last slash before the config file itself
