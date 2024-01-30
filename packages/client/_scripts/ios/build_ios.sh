/bin/bash --login
flutter pub get
cd ios
gem install bundler
bundle exec fastlane match appstore
bundle install
bundle exec fastlane rebuild_ios_archive
