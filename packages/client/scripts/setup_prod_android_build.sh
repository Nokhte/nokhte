cd android/app/src/main
sed -i '' -e 's/android:name="io.branch.sdk.TestMode" android:value="true"/android:name="io.branch.sdk.TestMode" android:value="false"/' AndroidManifest.xml