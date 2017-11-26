#!/bin/bash

#gitkraken
echo "Installing gitkraken..."
wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
dpkg -i gitkraken-amd64.deb

#filezilla
echo "Installing filezilla..."
sudo sh -c 'echo "deb http://archive.getdeb.net/ubuntu xenial-getdeb apps" >> /etc/apt/sources.list.d/getdeb.list'
wget -q -O - http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -
sudo apt update
sudo apt install filezilla

#mongodb
echo "Installing mongodb server..."
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org

#Franz
echo "Installing franz all in one messaging...."
sudo rm -fr /opt/franz
sudo rm -fr /usr/share/applications/franz.desktop

sudo mkdir -p /opt/franz

wget -qO- https://github.com/meetfranz/franz-app/releases/download/4.0.4/Franz-linux-x64-4.0.4.tgz | sudo tar xvz -C /opt/franz/

sudo wget "https://cdn-images-1.medium.com/max/360/1*v86tTomtFZIdqzMNpvwIZw.png" -O /opt/franz/franz-icon.png

sudo bash -c "cat <<EOF > /usr/share/applications/franz.desktop                                                                 
[Desktop Entry]
Name=Franz
Comment=
Exec=/opt/franz/Franz
Icon=/opt/franz/franz-icon.png
Terminal=false
Type=Application
Categories=Messaging,Internet
EOF"

#studio3t - download only
echo "Downloading studio3t..."
wget https://download.studio3t.com/studio-3t/linux/5.6.4/studio-3t-linux-x64.tar.gz?_ga=2.124002186.1837910421.1511707260-1346475885.1511707260

#slack - download only
echo "Downloading slack..."
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-2.9.0-amd64.deb

#spotify 
echo "Installing spotify..."
sudo apt-add-repository -y "deb http://repository.spotify.com stable non-free" &&
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D2C19886 &&
sudo apt-get update -qq &&
sudo apt-get install spotify-client

#jetbrains toolbox - download only
echo "Downloading jetbrains toolbox..."
wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.6.2914.tar.gz

#ammps - download only
echo "Downloading Ampps local development helper... "
wget http://s4.softaculous.com/a/ampps/files/Ampps-3.8-x86_64.run

#shutter screenshot tool
echo "Installing shutter screenshot tool..."
sudo add-apt-repository -y ppa:shutter/ppa
sudo apt-get update
sudo apt-get install shutter

#setting up PycharmProjects
echo "Setting up all python projects from shoppingmings bitbucket..."
mkdir ~/PycharmProjects
cd PycharmProjects
git clone https://thijsgelton@bitbucket.org/shoppingminds/leonardo.git
git clone https://thijsgelton@bitbucket.org/shoppingminds/ubf.git
git clone https://thijsgelton@bitbucket.org/shoppingminds/uda.git
git clone https://thijsgelton@bitbucket.org/shoppingminds/configtool_backend.git
git clone https://thijsgelton@bitbucket.org/shoppingminds/loompa.git
git clone https://thijsgelton@bitbucket.org/shoppingminds/configtool_flask.git
git clone https://thijsgelton@bitbucket.org/shoppingminds/kassa_2.git

#etcher image writer
echo "Installing etcher image writer..."
echo "deb https://dl.bintray.com/resin-io/debian stable etcher" | sudo tee /etc/apt/sources.list.d/additional-repositories.list
sudo apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 379CE192D401AB61
sudo apt update && sudo apt install etcher-electron

#docker
echo "Installing docker..."
curl -fsSL get.docker.com -o get-docker.sh
sh get-docker.sh

#gcloud
echo "Installing gcloud sdk..."
curl https://sdk.cloud.google.com | bash
exec -l $SHELL
gcloud init

#virtualbox
echo "Installing virtualbox..."
apt-get install virtualbox

#k8s
echo "Installing k8s..."
gcloud components install kubectl

#minikube
echo "Installing minikube..."
curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.15.0/minikube-linux-amd64
chmod +x minikube
sudo mv minikube /usr/local/bin/

