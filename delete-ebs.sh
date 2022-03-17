#!bin/zsh
dryrun=$1
if [ -z "$dryrun"]
then
dryrun='--dry-run'
fi

echo $dryrun