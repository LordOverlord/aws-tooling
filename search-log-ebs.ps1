$currentdate = Get-Date -Format FileDateTime
$filters = 'Name=status,Values=available'
$loggin = aws ec2 describe-volumes --filters $filters --profile prod_roadnet --query "Volumes[*].{ID:VolumeId,Size:Size,Snapshot:SnapshotId}" --output text
$loggin | Out-File -FilePath .\RNA-leftovers-$currentdate.csv

$EBSsizes = aws ec2 describe-volumes --filters $filters --profile prod_roadnet --query "Volumes[*].{Size:Size}" --output text
$totalebssize = $EBSsizes | Measure-object -Sum
$totalebscount = $totalebssize.Count
$totalebssum = $totalebssize.Sum
$totalcost = $totalebssize.Sum * .1


Write-Warning "There's a total of: $totalebscount unused EBS volumes with a total of $totalebssum GB "
Write-Warning "The total monthly cost is $ $totalcost USD"

Start-Sleep -Seconds 10