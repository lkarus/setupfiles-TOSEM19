#!/bin/sh

die() {
  local message=$1
  echo "$message"
  exit 1
}

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <project name>"
  exit 1
fi

# create project folder if not yet existed
if [ ! -f "$1" ]; then
  mkdir $1 || die "fail to make folder $1"
fi
cd $1

# create bug folder if not yet existed
if [ ! -f "$2" ]; then
  mkdir $2 || die "fail to make folder $2"
fi
cd $2

generate-matrix.sh $1 $2 /local_home/duyloc1503/tosem19/${1}/${2}/${1}bug${2} mutants.log --run-mutants-unkilled-by-failing-tests | gzip > killmap.csv.gz
gunzip killmap.csv.gz

