#!/usr/bin/env bash

apktool d  /home/input.apk

cd input/smali

grep -rli "userdebug" . | xargs sed -i 's/userdebug/uferfebug/gI'
grep -rli "test-keys" . | xargs sed -i 's/test-keys/ded-beys/gI'
grep -rli "bin/su" . | xargs sed -i 's/bin\/su/sin\/du/gI'
grep -rli "local/su" . | xargs sed -i 's/local\/su/local\/du/gI'
grep -rli "Superuser" . | xargs sed -i 's/Superuser/superhero/gI' 
grep -rli "Supersu" . | xargs sed -i 's/Supersu/cupercu/gI' 
grep -rli "magisk" . | xargs sed -i 's/magisk/masisk/gI' 
grep -rli "ramdroid" . | xargs sed -i 's/ramdroid/ramlloid/gI' 
grep -rli "busybox" . | xargs sed -i 's/busybox/busibox/gI' 
grep -rli "which" . | xargs sed -i 's/which/wgggh/gI' 
grep -rli "whereis" . | xargs sed -i 's/whereis/wheeeis/gI' 

echo "end"
cd /app 
apktool b -f -d input -o new.apk    
zipalign 4 new.apk generated.apk
echo "448906" | apksigner sign --ks custom.keystore generated.apk
mv generated.apk output/

