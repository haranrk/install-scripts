echo "Setting up git"
git config --global color.ui true
git config --global user.name "haranrk"
git config --global user.email "haranrajkumar97@gmail.com"

ssh-keygen -t rsa -b 4096 -C "haranrajkumar97@gmail.com"
cat ~/.ssh/id_rsa.pub
echo "Copy the above ssh key and paste it at https://github.com/settings/keys"
