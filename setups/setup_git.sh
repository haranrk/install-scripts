echo "Setting up git"
git config --global color.ui true
echo "Enter your GitHub username: "
read github_username
git config --global user.name $github_username
echo "Enter your GitHub email: "
read github_email
git config --global user.email github_email

ssh-keygen -t rsa -b 4096 -C "haranrajkumar97@gmail.com"
cat ~/.ssh/id_rsa.pub
echo "Copy the above ssh key and paste it at https://github.com/settings/keys"
