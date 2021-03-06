#!/bin/sh

die() {
  local message=$1
  echo "$message"
  exit 1
}

chmod +x init.sh
chmod +x create_mml.pl
chmod +x run-mutation-testing1.sh
chmod +x run-mutation-testing2.sh
chmod +x run-mutation-testing3.sh
chmod +x run-mutation-testing4.sh
chmod +x setup.sh

git clone https://bitbucket.org/rjust/fault-localization-data.git
cd fault-localization-data

cp ../setup-for-Mockito.sh setup.sh || die "there is an error copying setup file for fault-localization data"
cp ../util-for-Mockito.sh killmap/scripts/utils.sh
./setup.sh || die "there is an error in fault-localization-data setup"

# copy other files to their locations
cp ../template.mml defects4j/major/mml/template.mml
cp ../create_mml.pl defects4j/framework/util/create_mml.pl

echo 'export PATH="$PATH:/local_home/duyloc1503/tosem19/fault-localization-data/killmap/scripts/"' >> ~/.bashrc

