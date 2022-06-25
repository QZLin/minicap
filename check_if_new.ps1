Push-Location DeviceFarmer_minicap
$json = (ConvertFrom-Json $env:last_release)

$current_commit = git log -1 --format=%h
Write-Output "::echo::on"
Write-Output "$current_commit - $($json.tag_name)"
if (-not $json.tag_name -eq $current_commit) {
    Write-Output "::save-state name=new_commit::true"
}
else {
    Write-Output "::save-state name=new_commit::false"
}
Pop-Location