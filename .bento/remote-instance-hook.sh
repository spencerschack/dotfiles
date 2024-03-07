#!/bin/bash

cd ~/carrot/customers/customers-backend
sudo gem install rubocop-daemon --no-document

# https://github.com/fohte/rubocop-daemon/tree/master?tab=readme-ov-file#more-speed
curl https://raw.githubusercontent.com/fohte/rubocop-daemon/master/bin/rubocop-daemon-wrapper -o /tmp/rubocop-daemon-wrapper
sudo mkdir -p /usr/local/bin/rubocop-daemon-wrapper
sudo mv /tmp/rubocop-daemon-wrapper /usr/local/bin/rubocop-daemon-wrapper/rubocop
sudo chmod +x /usr/local/bin/rubocop-daemon-wrapper/rubocop
