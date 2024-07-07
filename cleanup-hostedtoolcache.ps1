# Cleanup hostedtoolcache.
Get-ChildItem -Path "C:\hostedtoolcache\windows" -File -Include msvcp*.dll,concrt*.dll,vccorlib*.dll,vcruntime*.dll -Recurse |
    Remove-Item -Force -Verbose
