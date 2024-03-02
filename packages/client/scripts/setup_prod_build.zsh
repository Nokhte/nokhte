#!/bin/zsh
cd ios/Runner
# CFBundleURLName & Scheme
sed -i '' -e 's/com.staging.nokhte/com.nokhte.nokhte/' info.plist  

sed -i '' -e 's/staging_match_certificates/match_certificates/' Matchfile 

# bundle id
cd ../Runner.xcodeproj
sed -i '' -e 's/PRODUCT_BUNDLE_IDENTIFIER = com.staging.nokhte/PRODUCT_BUNDLE_IDENTIFIER = com.nokhte.nokhte/' project.pbxproj  
