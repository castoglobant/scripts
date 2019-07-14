#!/bin/zsh

echo "========================================="
echo "GIT REPO UPDATE USER INFO"
echo "========================================="

usage="$(basename "$0") [-h|u] oldemail newemail 'Old Name' 'New Name' -- script for replace old user for new on git local repo

where:
    -h  show this help text
    -u  show this help text"

while getopts ':hu' option; do
  case "$option" in
    h) echo "$usage"
       exit
       ;;
    u) echo "$usage"
       exit
       ;;
#
  esac
done
shift $((OPTIND - 1))

cusername=$(git config --get user.name)
cuseremail=$(git config --get user.email)

if [ $# -eq 0 ] || [ -z "$1" ]  || [ -z "$2" ] ; then
    echo "No arguments supplied or incompleted"
    echo
    echo -n "Enter your oldemail > "
    read olduseremail
    echo -n "Enter your newemail > "
    read newuseremail
    echo -n "Enter your oldname > "
    read oldusername
    echo -n "Enter your newname > "
    read newusername
    echo
else
    olduseremail=${1:-$cuseremail}
    newuseremail=${2:-$cuseremail}
    oldusername=${3:-$cusername}
    newusername=${4:-$cusername}
fi

export olduseremail newuseremail oldusername newusername

git config --local --unset-all user.name
git config --local --unset-all user.email
git config --local --replace-all user.name "$newusername"
git config --local --replace-all user.email "$newuseremail"

#git log -10

git filter-branch -f --env-filter '
    
    [ -n "$olduseremail" ] && [ -n "$newuseremail" ] && [ "$GIT_AUTHOR_EMAIL" = "$olduseremail" ] && \
    GIT_AUTHOR_EMAIL=$newuseremail; export GIT_AUTHOR_EMAIL;

    [ -n "$olduseremail" ] && [ -n "$newuseremail" ] && [ "$GIT_COMMITTER_EMAIL" = "$olduseremail" ] && \
    GIT_COMMITTER_EMAIL=$newuseremail; export GIT_COMMITTER_EMAIL;
    
    [ -n "$oldname" ] && [ -n "$newusername" ] && [ "$GIT_AUTHOR_NAME" = "$oldname" ] && \
    GIT_AUTHOR_NAME=$newusername; export GIT_AUTHOR_NAME;
    
    [ -n "$oldname" ] && [ -n "$newusername" ] && [ "$GIT_COMMITTER_NAME" = "$oldname" ] && \
    GIT_COMMITTER_NAME=$newusername; export GIT_COMMITTER_NAME;

    
' HEAD

echo "============================================= "
git log -5