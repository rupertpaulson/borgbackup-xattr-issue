#! /bin/sh

export BORG_PASSCOMMAND="echo 'verysecurepassword'"
mkdir borgrepo
echo "borg init"
borg init -e repokey-blake2 borgrepo

ls -l@h files-to-backup

echo "\nborg create"
borg create borgrepo::backup files-to-backup

echo "\nborg check"
borg check borgrepo

echo "\nborg extract"
mkdir extracted-files
cd extracted-files
borg extract ../borgrepo::backup

ls -l@h files-to-backup