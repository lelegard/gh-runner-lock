# List all MSVC runtime files in Path.
foreach ($d in ($env:Path -split ';')) {
    if (-not -not $d) {
        if (Test-Path -PathType Container $d) {
            Write-Output "$d"
            Get-ChildItem "$d\*" -Include @("vcruntime*.dll", "msvc*.dll") |
                ForEach-Object { (Get-Command $_).FileVersionInfo } |
                ForEach-Object { Write-Output "    $($_.FileName) => $($_.FileVersion)" }
        }
        else {
            Write-Output "$d (non existent directory)"
        }
    }
}
