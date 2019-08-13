for f in /Volumes/poseidon/HDD/smail-drive/DCIM/2018/201805-japan/*; do
    echo $f
    ./adb-sync $f /sdcard/Storage/201805-japan
done
#./adb-sync /Volumes/poseidon/HDD/smail-drive/DCIM/2018/201805-japan/20180516-01 /sdcard/Storage/201805-japan
