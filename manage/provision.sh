#!/bin/bash
set -o nounset
set -o errexit
shopt -s expand_aliases
#######################################
# Source helper utilities
source manage/utils.sh
log "Updating OS packages"
pkgupdate
log "Setting GB locale"
setlocales
#######################################
log "Installing SOAPlib Commandline Wrapper dependencies"
pkginstall python-pip
pkginstall python-dev python-lxml
pkginstall octave
sudo pip install -r $REPO_DIR/manage/requirements.txt
#######################################
log "Configure SOAPLib to autostart"
sudo cat $REPO_DIR/manage/initd.vphop_nmsloads > /etc/init.d/vphop_nmsloads
sudo chmod +x /etc/init.d/vphop_nmsloads
sudo update-rc.d vphop_nmsloads defaults
#######################################
log "Starting application"
sudo service vphop_nmsloads start
#######################################
log "Deconfigure Github Deployinator to autostart"
sudo update-rc.d githubdeploy disable
sudo rm /etc/init.d/githubdeploy
#######################################
log "Cleaning up..."
pkgclean
pkgautoremove
history -c
#######################################
