#!/bin/sh

cd  $(dirname $0)

for i in $(find . -type d -name .git -prune -o \! \( -name init.sh -o -name README.md \))
do
  name=${i#\./}
  if [ -f ${name} ]; then 
    ln -s ~/dotfiles/${name} ~/${name}
  fi
done
