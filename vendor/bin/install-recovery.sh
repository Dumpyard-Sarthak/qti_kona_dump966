#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:134217728:9e9c3a2d94fbdc4fa92c68a700f79e57e68e72b6; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:cbdce1476057d3237b6e8075d1c16d279b07cedc \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:134217728:9e9c3a2d94fbdc4fa92c68a700f79e57e68e72b6 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.boot.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.boot.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.boot.recovery.updated true
fi
