param([string]$dry = "--dry-run")
$filters = 'Name=status,Values=available'
$queryEBS = aws ec2 describe-volumes --filters $filters --profile prod_roadnet --query "Volumes[*].{ID:VolumeId}" --output text
foreach ($ebs in $queryEBS) {
    Write-Warning "Deleting the $ebs from AWS"
    aws ec2 delete-volume --volume-id $ebs --profile prod_roadnet $dry
}
$sanityEBS = aws ec2 describe-volumes --filters $filters --profile prod_roadnet --query "Volumes[*].{ID:VolumeId}" --output text
$aftermathcount = $sanityEBS.Count
Write-Output "Remaining Volumes =$aftermathcount, good job"
Start-Sleep -Seconds 10