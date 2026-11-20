@echo off
rem undoes debloat - re-enables everything in packages.txt
rem unhide/install-existing are just backups in case enable isnt enough
rem set TV_IP to your stick first, e.g.  set TV_IP=192.168.1.50
if "%TV_IP%"=="" (echo set TV_IP first & exit /b 1)
adb connect %TV_IP%:5555
echo restoring com.amazon.bueller.music
adb shell pm enable com.amazon.bueller.music
adb shell pm unhide com.amazon.bueller.music
adb shell cmd package install-existing com.amazon.bueller.music
echo restoring com.amazon.bueller.photos
adb shell pm enable com.amazon.bueller.photos
adb shell pm unhide com.amazon.bueller.photos
adb shell cmd package install-existing com.amazon.bueller.photos
echo restoring com.amazon.ceviche
adb shell pm enable com.amazon.ceviche
adb shell pm unhide com.amazon.ceviche
adb shell cmd package install-existing com.amazon.ceviche
echo restoring com.amazon.client.metrics
adb shell pm enable com.amazon.client.metrics
adb shell pm unhide com.amazon.client.metrics
adb shell cmd package install-existing com.amazon.client.metrics
echo restoring com.amazon.client.metrics.api
adb shell pm enable com.amazon.client.metrics.api
adb shell pm unhide com.amazon.client.metrics.api
adb shell cmd package install-existing com.amazon.client.metrics.api
echo restoring com.amazon.csm.htmlruntime
adb shell pm enable com.amazon.csm.htmlruntime
adb shell pm unhide com.amazon.csm.htmlruntime
adb shell cmd package install-existing com.amazon.csm.htmlruntime
echo restoring com.amazon.device.crashmanager
adb shell pm enable com.amazon.device.crashmanager
adb shell pm unhide com.amazon.device.crashmanager
adb shell cmd package install-existing com.amazon.device.crashmanager
echo restoring com.amazon.device.logmanager
adb shell pm enable com.amazon.device.logmanager
adb shell pm unhide com.amazon.device.logmanager
adb shell cmd package install-existing com.amazon.device.logmanager
echo restoring com.amazon.device.metrics
adb shell pm enable com.amazon.device.metrics
adb shell pm unhide com.amazon.device.metrics
adb shell cmd package install-existing com.amazon.device.metrics
echo restoring com.amazon.device.sale.service
adb shell pm enable com.amazon.device.sale.service
adb shell pm unhide com.amazon.device.sale.service
adb shell cmd package install-existing com.amazon.device.sale.service
echo restoring com.amazon.dp.logger
adb shell pm enable com.amazon.dp.logger
adb shell pm unhide com.amazon.dp.logger
adb shell cmd package install-existing com.amazon.dp.logger
echo restoring com.amazon.franktvinput
adb shell pm enable com.amazon.franktvinput
adb shell pm unhide com.amazon.franktvinput
adb shell cmd package install-existing com.amazon.franktvinput
echo restoring com.amazon.ftvads.deeplinking
adb shell pm enable com.amazon.ftvads.deeplinking
adb shell pm unhide com.amazon.ftvads.deeplinking
adb shell cmd package install-existing com.amazon.ftvads.deeplinking
echo restoring com.amazon.gamehub
adb shell pm enable com.amazon.gamehub
adb shell pm unhide com.amazon.gamehub
adb shell cmd package install-existing com.amazon.gamehub
echo restoring com.amazon.hedwig
adb shell pm enable com.amazon.hedwig
adb shell pm unhide com.amazon.hedwig
adb shell cmd package install-existing com.amazon.hedwig
echo restoring com.amazon.hybridadidservice
adb shell pm enable com.amazon.hybridadidservice
adb shell pm unhide com.amazon.hybridadidservice
adb shell cmd package install-existing com.amazon.hybridadidservice
echo restoring com.amazon.imdb.tv.android.app
adb shell pm enable com.amazon.imdb.tv.android.app
adb shell pm unhide com.amazon.imdb.tv.android.app
adb shell cmd package install-existing com.amazon.imdb.tv.android.app
echo restoring com.amazon.kso.blackbird
adb shell pm enable com.amazon.kso.blackbird
adb shell pm unhide com.amazon.kso.blackbird
adb shell cmd package install-existing com.amazon.kso.blackbird
echo restoring com.amazon.livedeviceservice
adb shell pm enable com.amazon.livedeviceservice
adb shell pm unhide com.amazon.livedeviceservice
adb shell cmd package install-existing com.amazon.livedeviceservice
echo restoring com.amazon.metrics.api
adb shell pm enable com.amazon.metrics.api
adb shell pm unhide com.amazon.metrics.api
adb shell cmd package install-existing com.amazon.metrics.api
echo restoring com.amazon.minitv.android.app
adb shell pm enable com.amazon.minitv.android.app
adb shell pm unhide com.amazon.minitv.android.app
adb shell cmd package install-existing com.amazon.minitv.android.app
echo restoring com.amazon.naatyam
adb shell pm enable com.amazon.naatyam
adb shell pm unhide com.amazon.naatyam
adb shell cmd package install-existing com.amazon.naatyam
echo restoring com.amazon.neodelegate
adb shell pm enable com.amazon.neodelegate
adb shell pm unhide com.amazon.neodelegate
adb shell cmd package install-existing com.amazon.neodelegate
echo restoring com.amazon.ods.kindleconnect
adb shell pm enable com.amazon.ods.kindleconnect
adb shell pm unhide com.amazon.ods.kindleconnect
adb shell cmd package install-existing com.amazon.ods.kindleconnect
echo restoring com.amazon.perfcollection
adb shell pm enable com.amazon.perfcollection
adb shell pm unhide com.amazon.perfcollection
adb shell cmd package install-existing com.amazon.perfcollection
echo restoring com.amazon.privacypassservice
adb shell pm enable com.amazon.privacypassservice
adb shell pm unhide com.amazon.privacypassservice
adb shell cmd package install-existing com.amazon.privacypassservice
echo restoring com.amazon.providers.contentsupport
adb shell pm enable com.amazon.providers.contentsupport
adb shell pm unhide com.amazon.providers.contentsupport
adb shell cmd package install-existing com.amazon.providers.contentsupport
echo restoring com.amazon.recess
adb shell pm enable com.amazon.recess
adb shell pm unhide com.amazon.recess
adb shell cmd package install-existing com.amazon.recess
echo restoring com.amazon.shoptv.client
adb shell pm enable com.amazon.shoptv.client
adb shell pm unhide com.amazon.shoptv.client
adb shell cmd package install-existing com.amazon.shoptv.client
echo restoring com.amazon.shoptv.firetv.client
adb shell pm enable com.amazon.shoptv.firetv.client
adb shell pm unhide com.amazon.shoptv.firetv.client
adb shell cmd package install-existing com.amazon.shoptv.firetv.client
echo restoring com.amazon.sneakpeek
adb shell pm enable com.amazon.sneakpeek
adb shell pm unhide com.amazon.sneakpeek
adb shell cmd package install-existing com.amazon.sneakpeek
echo restoring com.amazon.spotify.mediabrowserservice
adb shell pm enable com.amazon.spotify.mediabrowserservice
adb shell pm unhide com.amazon.spotify.mediabrowserservice
adb shell cmd package install-existing com.amazon.spotify.mediabrowserservice
echo restoring com.amazon.storm.lightning.tutorial
adb shell pm enable com.amazon.storm.lightning.tutorial
adb shell pm unhide com.amazon.storm.lightning.tutorial
adb shell cmd package install-existing com.amazon.storm.lightning.tutorial
echo restoring com.amazon.systemnotices
adb shell pm enable com.amazon.systemnotices
adb shell pm unhide com.amazon.systemnotices
adb shell cmd package install-existing com.amazon.systemnotices
echo restoring com.amazon.tahoe
adb shell pm enable com.amazon.tahoe
adb shell pm unhide com.amazon.tahoe
adb shell cmd package install-existing com.amazon.tahoe
echo restoring com.amazon.tmm.tutorial
adb shell pm enable com.amazon.tmm.tutorial
adb shell pm unhide com.amazon.tmm.tutorial
adb shell cmd package install-existing com.amazon.tmm.tutorial
echo restoring com.amazon.tv.csapp
adb shell pm enable com.amazon.tv.csapp
adb shell pm unhide com.amazon.tv.csapp
adb shell cmd package install-existing com.amazon.tv.csapp
echo restoring com.amazon.tv.developer.dataservice
adb shell pm enable com.amazon.tv.developer.dataservice
adb shell pm unhide com.amazon.tv.developer.dataservice
adb shell cmd package install-existing com.amazon.tv.developer.dataservice
echo restoring com.amazon.tv.easyupgrade
adb shell pm enable com.amazon.tv.easyupgrade
adb shell pm unhide com.amazon.tv.easyupgrade
adb shell cmd package install-existing com.amazon.tv.easyupgrade
echo restoring com.amazon.tv.fw.metrics
adb shell pm enable com.amazon.tv.fw.metrics
adb shell pm unhide com.amazon.tv.fw.metrics
adb shell cmd package install-existing com.amazon.tv.fw.metrics
echo restoring com.amazon.tv.livetv
adb shell pm enable com.amazon.tv.livetv
adb shell pm unhide com.amazon.tv.livetv
adb shell cmd package install-existing com.amazon.tv.livetv
echo restoring com.amazon.tv.releasenotes
adb shell pm enable com.amazon.tv.releasenotes
adb shell pm unhide com.amazon.tv.releasenotes
adb shell cmd package install-existing com.amazon.tv.releasenotes
echo restoring com.amazon.uxnotification
adb shell pm enable com.amazon.uxnotification
adb shell pm unhide com.amazon.uxnotification
adb shell cmd package install-existing com.amazon.uxnotification
echo restoring com.amazon.wha.mediabrowserservice
adb shell pm enable com.amazon.wha.mediabrowserservice
adb shell pm unhide com.amazon.wha.mediabrowserservice
adb shell cmd package install-existing com.amazon.wha.mediabrowserservice
echo restoring com.amazon.whad
adb shell pm enable com.amazon.whad
adb shell pm unhide com.amazon.whad
adb shell cmd package install-existing com.amazon.whad
echo restoring com.amazon.whasettings
adb shell pm enable com.amazon.whasettings
adb shell pm unhide com.amazon.whasettings
adb shell cmd package install-existing com.amazon.whasettings
echo restoring com.amazon.wifilocker
adb shell pm enable com.amazon.wifilocker
adb shell pm unhide com.amazon.wifilocker
adb shell cmd package install-existing com.amazon.wifilocker
echo restoring com.amazon.wirelessmetrics.service
adb shell pm enable com.amazon.wirelessmetrics.service
adb shell pm unhide com.amazon.wirelessmetrics.service
adb shell cmd package install-existing com.amazon.wirelessmetrics.service
echo restoring com.android.printspooler
adb shell pm enable com.android.printspooler
adb shell pm unhide com.android.printspooler
adb shell cmd package install-existing com.android.printspooler
echo restoring com.fireos.usagestats.proxy
adb shell pm enable com.fireos.usagestats.proxy
adb shell pm unhide com.fireos.usagestats.proxy
adb shell cmd package install-existing com.fireos.usagestats.proxy
echo restoring com.imdb.livingroom.firetv
adb shell pm enable com.imdb.livingroom.firetv
adb shell pm unhide com.imdb.livingroom.firetv
adb shell cmd package install-existing com.imdb.livingroom.firetv
rem put amazon screensaver back
adb shell settings put secure screensaver_components com.amazon.ftv.screensaver/.app.services.ScreensaverService
echo done - rebooting TV
adb reboot
pause
