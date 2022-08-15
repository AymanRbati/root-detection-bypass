#!/usr/bin/env bash

apktool d  input.apk 

cd input/smali
grep -rli "userdebug" . | xargs sed -i 's/userdebug/uferfebug/g'
grep -rli "test-keys" . | xargs sed -i 's/test-keys/ded-beys/g'
grep -rli "bin/su" . | xargs sed -i 's/bin\/su/sin\/du/g'
grep -rli "local/su" . | xargs sed -i 's/local\/su/local\/du/g'
grep -rli "Superuser" . | xargs sed -i 's/Superuser/superhero/g' 
grep -rli "Supersu" . | xargs sed -i 's/Supersu/cupercu/g' 
grep -rli "magisk" . | xargs sed -i 's/magisk/masisk/g' 
grep -rli "ramdroid" . | xargs sed -i 's/ramdroid/ramlloid/g' 
grep -rli "busybox" . | xargs sed -i 's/busybox/busibox/g' 

cd /app 
apktool b -f -d input -o new.apk    
zipalign 4 new.apk generated.apk
echo "448906" | apksigner sign --ks custom.keystore generated.apk
mv generated.apk output/
   
