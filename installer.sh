#!/bin/sh
set -e
echo "Making dir for build"
mkdir mvc
cd mvc
echo "Cloning mvc_core"
git clone https://github.com/Mivio-Linux/mvc-core.git
mv mvc-core mvc_core
echo "Cloning mvc_cli"
git clone https://github.com/Mivio-Linux/mvc-cli.git
cd mvc-cli
echo "Building"
cargo build -r
echo "Success"
echo "Choose where to install:"
echo "1. /bin"
echo "2. /sbin"
echo "3. $HOME/.cargo/bin"

# read -p "Enter number: " num
while true; do
read -p "Enter number: " num
if [ "$num" -eq 1 ]; then
	sudo cp target/release/mvc /usr/local/bin/
	break
elif  [ "$num" -eq 2 ]; then
	sudo cp target/release/mvc /usr/local/sbin/
	break
elif [ "$num" -eq 3 ]; then
	cp target/release/mvc $HOME/.cargo/bin/
	break
else
	echo "failed to recognize"
fi
done
