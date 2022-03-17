#!bin/zsh
AWS_PROFILE='okta'
export AWS_DEFAULT_REGION="us-east-1"
dryrun=$1
if [ -z "$dryrun" ]
then
dryrun='--dry-run'
fi

while read line
do
    echo "Deleting EBS: $line"
    aws ec2 delete-volume --volume-id $line $dryrun
done < ebs1.csv
echo $dryrun