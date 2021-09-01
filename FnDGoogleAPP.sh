#google csomagok torlese adb shell segitsegevel
#keszitette szekeres abel

#szukseges Android Debug Bridge
#Linux
#sudo apt update && apt upgrade && apt install adb
#Windows
#https://developer.android.com/studio/releases/platform-tools

#Felhasznaloi Utmutato => Parancsok
#adb push FnDGoogleAPP.sh /data/local/tmp
#adb shell
#cd /data/local/tmp
#./FnDGoogleAPP.sh

#elvezd a bloatware mentes eletet
#Google Play Stores nem mukodik
#Ha torli a Gboard -ot akkor a Beallitasok: Language & input sem fog mukodni
#Tested on LenovoPad TB3-710F/Debian 11

pm list packages | grep -oE 'com.google.android.{0,}'>csomagok.tmp

input="csomagok.tmp"
while IFS= read -r line
do
    if [ $line == 'com.google.android.inputmethod.latin' ]
    then
        echo 'com.google.android.inputmethod.latin nem torlodik'
    else
        echo $line
        pm uninstall -k --user 0 $line
    fi
done < "$input"

#Google Play Store torlese (GMS nelkul amugy sem mukodik)
pm uninstall -k --user 0 com.android.vending

#Chrome törlése
#pm uninstall -k -user 0 com.android.chrome

#Alternative APK
#https://www.opera.com/download#opera
#https://download.opera.com/download/get/?partner=www&nothanks=yes&product=Android
#adb install csomag.apk

#samsung, lenovo, oneplus, xiami bloatware 
pm list packages | grep -oE 'com.lenovo.{0,}'>csomagok.tmp

input="csomagok.tmp"
while IFS= read -r line
do
  echo $line
  pm uninstall -k --user 0 $line
done < "$input"

#torli az temp listat
rm csomagok.tmp

