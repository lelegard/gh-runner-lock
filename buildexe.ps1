. "$PSScriptRoot\common.ps1"
$MSBuild = Find-MSBuild
Write-Output "MSBuild = $MSBuild"

& $MSBuild /nologo /property:Configuration=Release /property:Platform=x64 $PSScriptRoot\testexe.vcxproj
