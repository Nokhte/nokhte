#!/bin/zsh
cd ios/Runner
# CFBundleURLName & Scheme
sed -i '' -e 's/com.staging.nokhte/com.nokhte.nokhte/' info.plist  
# branch keys
sed -i '' -e 's/key_live_hqdu5OWr8Tsdo7keyaCk1egjDykdkeRi/key_live_oFdaQmf0vYYD43VtksjHYlfmyzjlnKnL/' info.plist  
sed -i '' -e 's/key_test_kDgs4IXrYGvog6bgvesgWlooABmmjkLq/key_test_ayadRkn9EZ9xY7IFlqmQHnipzxiihPjD/' info.plist  
# branch domains
sed -i '' -e 's/59q6i.app.link/app.nokhte.com/' info.plist
sed -i '' -e 's/59q6i-alternate.app.link/2cf02-alternate.app.link/' info.plist
sed -i '' -e 's/59q6i.test-app.link/2cf02.test-app.link/' info.plist
sed -i '' -e 's/59q6i-alternate.test-app.link/2cf02-alternate.test-app.link/' info.plist
# bundle id
cd ../Runner.xcodeproj
sed -i '' -e 's/PRODUCT_BUNDLE_IDENTIFIER = com.staging.nokhte/PRODUCT_BUNDLE_IDENTIFIER = com.nokhte.nokhte/' project.pbxproj  
