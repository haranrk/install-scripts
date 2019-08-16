sudo apt update
sudo apt install -y git automake build-essential pkg-config libevent-dev libncurses5-dev byacc

git clone https://github.com/tmux/tmux.git temp-tmux

cd temp-tmux

git checkout tags/2.9a

sh autogen.sh

./configure && make

sudo make install

cd -

rm -fr temp-tmux
