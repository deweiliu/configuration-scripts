cd ~

# Download GCloud SDK
curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-284.0.0-darwin-x86_64.tar.gz

tar -xv -f ./google-cloud-sdk-284.0.0-darwin-x86_64.tar.gz

rm -f google-cloud-sdk-284.0.0-darwin-x86_64.tar.gz

./google-cloud-sdk/install.sh --usage-reporting false --path-update true --command-completion true --bash-completion true --quiet

