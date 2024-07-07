. "$PSScriptRoot\common.ps1"
$MSBuild = Find-MSBuild
Write-Output "MSBuild = $MSBuild"
$JavaBin = Find-Java
Write-Output "JavaBin = $JavaBin"

& $MSBuild /nologo /property:Configuration=Release /property:Platform=x64 $PSScriptRoot\testdll.vcxproj
. "${JavaBin}\javac.exe" -d bin testjava.java

