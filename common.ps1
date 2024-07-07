# Find MSBuild.
function Find-MSBuild()
{
    # Try fast path first.
    $MSBuild = Get-ChildItem "C:\Program Files\Microsoft Visual Studio\*\*\MSBuild\Current\Bin\MSBuild.exe" | Select-Object -Last 1
    if ($MSBuild -ne $null) {
        $MSBuild = $MSBuild.FullName
    }
    else {
        # Fallback: search everywhere
        $MSRoots = @("C:\Program Files*\MSBuild", "C:\Program Files*\Microsoft Visual Studio")
        $MSBuild = Get-ChildItem -Recurse -Path $MSRoots -Include MSBuild.exe -ErrorAction Ignore |
                   ForEach-Object { (Get-Command $_).FileVersionInfo } |
                   Sort-Object -Unique -Property FileVersion |
                   ForEach-Object { $_.FileName} |
                   Select-Object -Last 1
    }
    if (-not $MSBuild) {
        Write-Output "==== ERROR: MSBuild not found"
        exit 1
    }
    return $MSBuild
}

# Find Java.
function Find-Java()
{
    $jh = $env:JAVA_HOME
    if (-not -not $jh -and (Test-Path "$jh\bin\java.exe") -and (Test-Path "$jh\bin\javac.exe")) {
        return "$jh\bin"
    }
    else {
        Write-Output "==== ERROR: Java not found"
        exit 1
    }
}
