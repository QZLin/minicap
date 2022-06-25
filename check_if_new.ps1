Push-Location DeviceFarmer_minicap
$json = (ConvertFrom-Json $env:last_release)

$current_commit = git log -1 --format=%h

if (-not $json.tag_name -eq $current_commit) {
    $env:new_commit = "TRUE"
}
Get-ChildItem Env:
Pop-Location