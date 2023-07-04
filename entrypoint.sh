#!/bin/bash


rm -r /app/input
apktool d -r /home/input.apk

cd input/smali

grep -rli "userdebug" . | xargs sed -i 's/userdebug/uferfebug/gI'
grep -rli "test-keys" . | xargs sed -i 's/test-keys/ded-beys/gI'
grep -rli "dev-keys" . | xargs sed -i 's/dev-keys/ded-beys/gI'
grep -rli "bin/su" . | xargs sed -i 's/bin\/su/sin\/du/gI'
grep -rli "local/su" . | xargs sed -i 's/local\/su/local\/du/gI'
grep -rli "Superuser" . | xargs sed -i 's/Superuser/superhero/gI'
grep -rli "Supersu" . | xargs sed -i 's/Supersu/cupercu/gI'
grep -rli "magisk" . | xargs sed -i 's/magisk/masisk/gI'
grep -rli "ramdroid" . | xargs sed -i 's/ramdroid/ramlloid/gI'
grep -rli "busybox" . | xargs sed -i 's/busybox/busibox/gI'
grep -rli "whereis" . | xargs sed -i 's/whereis/wheeeis/gI'
grep -rli "which" . | xargs sed -i 's/which/wiicc/gI'
grep -rli "xbin/su" . | xargs sed -i 's/xbin\/su/xbin\/du/gI'
grep -rli "failsafe/su" . | xargs sed -i 's/failsafe\/su/failsafe\/du/gI'
grep -rli "local/su" . | xargs sed -i 's/local\/su/local\/du/gI'
grep -rlZ 'which", "su' . | xargs -0 sed -i 's/which", "su/which", "dddu/gI'


echo "end"
cd /app
apktool b -f -d input -o new.apk
wget https://github.com/patrickfav/uber-apk-signer/releases/download/v1.3.0/uber-apk-signer-1.3.0.jar
java -jar uber-apk-signer-1.3.0.jar --apks new.apk 
mv new-aligned-debugSigned.apk output/generated.apk

