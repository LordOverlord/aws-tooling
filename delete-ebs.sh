#!bin/zsh
AWS_PROFILE='okta'
dryrun=$1
if [ -z "$dryrun" ]
then
dryrun='--dry-run'
fi

while read line
do
    echo "Deleting EBS: $line"
    aws ec2 delete-volume --volume-id $line $dryrun
done < ebs.csv
echo $dryrun