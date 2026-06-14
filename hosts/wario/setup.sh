sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --reload

# for wfview
sudo usermod -aG dialout $USER
