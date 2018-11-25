#!/bin/bash

# For instance with feature/add_new_feature_HEYT-653
# $ git commit -m"Fixed bug"
# will result with commit "[HEYT-653] Fixed bug"


# Customize which branches should be skipped when prepending commit message. 
if [ -z "$BRANCHES_TO_SKIP" ]; then
  BRANCHES_TO_SKIP=(master develop test)
fi

BRANCH_NAME=$(git symbolic-ref --short HEAD | grep -o '[A-Z]\+-[0-9]\+')
BRANCH_NAME="${BRANCH_NAME##*/}"

BRANCH_EXCLUDED=$(printf "%s\n" "${BRANCHES_TO_SKIP[@]}" | grep -c "^$BRANCH_NAME$")
BRANCH_IN_COMMIT=$(grep -c "\[$BRANCH_NAME\]" $1)

if [ -n "$BRANCH_NAME" ] && ! [[ $BRANCH_EXCLUDED -eq 1 ]] && ! [[ $BRANCH_IN_COMMIT -ge 1 ]]; then 
  sed -i.bak -e "1s/^/$BRANCH_NAME /" $1
fi

# Rename .git/hooks/prepare-commit-msg.sample to prepare-commit-msg, paste the script and make the file executable.
# Or run this: curl https://gist.githubusercontent.com/jonnyparris/0a10cc63af281de23a4fd34116fed3e6/raw/c65dec15a5470e8b68353b7e3f9a2a6f81ece562/prepare-commit-msg.sh > .git/hooks/prepare-commit-msg && chmod u+x .git/hooks/prepare-commit-msg

