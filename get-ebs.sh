#Some coment
#AWS_PROFILE = okta
export filters = 'Name=status,Values=available'
loggin =($(aws ec2 describe-volumes --filters $filters --profile okta --query "Volumes[*].{ID:VolumeId,Size:Size}" --output text))

echo $loggin
