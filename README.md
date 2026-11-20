# smart-tv-privacy

Privacy hardening for a Fire TV Stick 4K (2018, model AFTMM, Fire OS 6.7.1.1 / Android 7.1.2).
Packages get disabled over ADB, so reversible

## What's in here

| Path | What it is |
|---|---|
| `debloat/packages.txt` | Ads, telemetry and preloaded junk packages that were disabled |
| `debloat/keep.txt` | Packages to leave ON, they broke things when disabled |
| `debloat/debloat.sh` | Disables `packages.txt` minus `keep.txt` over ADB (bash) |
| `debloat/rollback.bat` | Re-enables everything in `packages.txt` (Windows) |
| `hub-app/` | Small "Websites" launcher tile, plain Java, no Gradle or AndroidX |

## Developer Settings

Turn on ADB debugging on the stick (Settings > My Fire TV > Developer Options), then:

```sh
TV_IP="Input TV IP here from advanced network settings" ./debloat/debloat.sh
```

Under the hood it's just:

```sh
adb shell pm disable-user --user 0 <package>
```

Undo (Windows):

```bat
set TV_IP="TV IP"
debloat\rollback.bat
```

Last resort is Settings > My Fire TV > Reset to Factory Defaults, make sure you have an extra control access to the TV like a remote/app as often the network gets reset like on Fire TV's

### The debugging process I had 

- Some packages can't be disabled without root: `client.metrics`, `device.metrics`, `crashmanager`,
  `logmanager`, `ftvads.deeplinking`, `tv.csapp`, `fireos.usagestats.proxy`. They're in
  `packages.txt` but the command just fails on them, which is fine.
- The packages in `keep.txt` have to stay on. With them off the phone Fire TV app couldn't find the
  stick (WhisperLink never opened its ports), and the shared `dp.logger` / `metrics.api` libraries
  are loaded by the phone remote app and Prime Video.
- Don't disable `com.amazon.tigris` (Appstore screens) or `com.amazon.logan` (VoiceView). Some
  lists mislabel them as bloat.
- After `pm enable`, wait about 15 seconds before rebooting or Android may not save it.
- Fire OS and Appstore updates can turn packages back on. Check with `adb shell pm list packages -d`.
- If you switch the stick to a different DNS (like AdGuard) and the Wi-Fi gets forgotten, you need
  a physical remote, HDMI-CEC from the TV remote, or a USB keyboard on a powered OTG cable to get
  back in. Have one ready first.

### Screensaver

Swapped Amazon's ad screensaver for the plain Android one:

```sh
adb shell settings put secure screensaver_components com.android.dreams.basic/.Colors
```

## Hub app

A tile for the home screen that opens a big-button grid of sites and apps. The list lives in
`hub-app/res/values/sites.xml`, one per line:

```
Name|https://example.com        opens in the Silk browser
Name|app:com.some.package       opens an installed app
```

# SDK
Build and install from Git Bash. You need JDK 11 and the Android SDK with build-tools 30.0.3 and
platform 22:

```sh
export ANDROID_SDK=/c/path/to/android-sdk
cd hub-app
./build.sh
adb install -r Websites.apk
```

`build.sh` makes its own local signing key the first time (`websites.keystore`, git-ignored). The
banner art comes from `tools/MakeArt.java`.

## Credits

Package lists cross-checked against Fire-Tools, FireFrame `debloat.txt`,
[noted.lol](https://noted.lol), and [Gathin23/cleanyourtv](https://github.com/Gathin23/cleanyourtv).
Only packages backed by at least one of those got disabled.

Tested on Fire stick 1st generation, 2nd generation (may also work on other android based TV's)

## License

MIT, see [LICENSE](LICENSE).
