Push-Location DeviceFarmer_minicap
$json = (ConvertFrom-Json $env:last_release)
# $json.name; $json.tag_name

$current_commit = git log -1 --format=%h
$current_commit_msg = git log -1 --format=%s
Write-Output "::echo::on"
Write-Output "current:$current_commit - last:$($json.tag_name)"
if (-not ($json.tag_name -eq $current_commit)) {
    $Env:new_commit = "true"
}
else {
    $Env:new_commit = "false"
}
Write-Output "new_commit=$($Env:new_commit)" >> $Env:GITHUB_ENV
Write-Output "new_commit=$($Env:new_commit)"
Write-Output "current_commit_msg=$($Env:current_commit_msg)" >> $Env:GITHUB_ENV
Write-Output "current_commit_msg=$($Env:current_commit_msg)"
Pop-Location