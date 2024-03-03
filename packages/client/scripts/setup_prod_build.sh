#!/bin/zsh
cd ios/Runner
# CFBundleURLName & Scheme
sed -i '' -e 's/com.nokhte.staging/com.nokhte.nokhte/' info.plist  
# CFBundleDisplayName
sed -i '' -e 's/Nokhte Staging/Nokhte/' info.plist  
echo "$(<info.plist )"
# fastlane configs
cd ../fastlane
sed -i '' -e 's/staging_match_certificates/match_certificates/' Matchfile 
echo "$(<Matchfile )"
sed -i '' -e 's/com.staging.nokhte/com.nokhte.nokhte/' Appfile
echo "$(<Appfile )"
# bundle id
cd ../Runner.xcodeproj
sed -i '' -e 's/PRODUCT_BUNDLE_IDENTIFIER = com.staging.nokhte/PRODUCT_BUNDLE_IDENTIFIER = com.nokhte.nokhte/' project.pbxproj  
sed -i '' -e 's/INFOPLIST_KEY_CFBundleDisplayName = "Nokhte Staging";/INFOPLIST_KEY_CFBundleDisplayName = Nokhte;/' project.pbxproj  
