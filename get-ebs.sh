
#some AWS Variables
export AWS_SAHRED_CREDENTIAL_FILE="~/.aws/credential"
export AWS_REGION="us-east-1"
export AWS_PROFILE="905467511563-bu-torq-poweruser"
#some variables to compose the query
export aprofile = "905467511563-bu-torq-poweruser"
export filters = 'Name=status,Values=available'
export aregion = "us-east-1"
#getting the info in text format
loggin=($(aws ec2 describe-volumes --filters $filters --profile $aprofile --region $aregion --query "Volumes[*].{ID:VolumeId,Size:Size}" --output text))
#exporting the data to csv
echo $loggin > 
