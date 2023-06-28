/bin/bash --login
flutter pub get
cd ios
gem install bundler
bundle install
bundle exec fastlane rebuild_ios_archive
