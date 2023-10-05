#!/usr/bin/env bash
result=$(find $PWD -type f|fzf-tmux -p)

if [ "$result" = "" ]; then
    echo "No file selected"
    exit 1
else
  echo $result|xargs nvim
fi

