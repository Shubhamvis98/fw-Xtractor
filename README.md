# fw-Xtractor
```
   __             __  ___                  _
  / _|_      __   \ \/ / |_ _ __ __ _  ___| |_ ___  _ __
 | |_\ \ /\ / /____\  /| __| '__/ _` |/ __| __/ _ \| '__|
 |  _|\ V  V /_____/  \| |_| | | (_| | (__| || (_) | |
 |_|   \_/\_/     /_/\_\\__|_|  \__,_|\___|\__\___/|_|
         by @shubhamvis98 | https://fossfrog.in
```
fw-Xtractor is a tool to extract and squash firmware files from the vendor partition in Android. It serves as an alternative to droid-juicer, which may not work on some devices using dynamic partitions.

## 🚀 HOW TO USE:
1. Clone this repository using Termux or download it as a ZIP file in any terminal app of your choice.
2. Extract the ZIP and cd into the repository directory.
3. Download or create a droid-juicer-compatible .toml file for your device.
4. Run the script with root access: `./fw-Xtractor <vendor,codename-variant>.toml`
5. The script will extract and squash the MDT files, then copy them into an output/ directory.
6. You can copy all contents from the output/ directory to your Linux rootfs at: /lib/firmware/updates/
7. Alternatively, you can place the firmware files in the Linux ramdisk, or boot into your Linux distro and regenerate the ramdisk with: `update-initramfs -u`

## 🛠️ TESTED ON DEVICES:
- Poco F1 (beryllium)
- Xiaomi 11T Pro (vili)

## 📜 THIRD-PARTY TOOLS:

This project bundles the following binaries:

- `jq` – Creative Commons CC BY 3.0 [SOURCE](https://github.com/jqlang/jq)
- `pil-squasher` – BSD 3-Clause License [SOURCE](https://github.com/linux-msm/pil-squasher)

See the LICENSES folder for full license texts.

