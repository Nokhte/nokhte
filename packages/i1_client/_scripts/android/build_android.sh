/bin/bash --login
flutter pub get
cd android
gem install bundler
bundle install
curl -s https://gitlab.com/gitlab-org/incubation-engineering/mobile-devops/download-secure-files/-/raw/main/installer | bash
cp -r .secure_files/* .
ls
bundle exec fastlane build
