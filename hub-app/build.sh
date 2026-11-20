#!/bin/sh
# builds Websites.apk with plain sdk tools, no gradle. run from git bash: ./build.sh
set -e
cd "$(dirname "$0")"
# point ANDROID_SDK at your sdk folder (needs build-tools 30.0.3 + platform 22)
SDK=${ANDROID_SDK:?set ANDROID_SDK to your android sdk folder}
BT=$SDK/build-tools/android-11
JAR=$SDK/platforms/android-5.1.1/android.jar

rm -rf out && mkdir -p out/flat out/gen out/classes
java tools/MakeArt.java

"$BT/aapt2.exe" compile --dir res -o out/flat
"$BT/aapt2.exe" link out/flat/*.flat -I "$JAR" --manifest AndroidManifest.xml \
  --min-sdk-version 22 --target-sdk-version 22 --java out/gen -o out/unsigned.apk

javac -source 8 -target 8 -bootclasspath "$JAR" -Xlint:-options -d out/classes \
  $(find src out/gen -name '*.java')
java -cp "$BT/lib/d8.jar" com.android.tools.r8.D8 --release --min-api 22 --lib "$JAR" --output out $(find out/classes -name '*.class')

(cd out && jar uf unsigned.apk classes.dex)
"$BT/zipalign.exe" -f 4 out/unsigned.apk out/aligned.apk

# local signing key, made once
[ -f websites.keystore ] || keytool -genkeypair -keystore websites.keystore -alias web \
  -storepass android -keypass android -keyalg RSA -keysize 2048 -validity 10000 -dname "CN=Websites"
java -jar "$BT/lib/apksigner.jar" sign --ks websites.keystore --ks-pass pass:android --key-pass pass:android \
  --out Websites.apk out/aligned.apk
java -jar "$BT/lib/apksigner.jar" verify Websites.apk && echo "built Websites.apk"
