Push-Location DeviceFarmer_minicap
$json = (ConvertFrom-Json $env:last_release)

$current_commit = git log -1 --format=%h
Write-Output "::echo::on"
if (-not $json.tag_name -eq $current_commit) {
    Write-Output "::set-output name=new_commit::true"
}
else {
    Write-Output "::set-output name=new_commit::false"
}
Pop-Location