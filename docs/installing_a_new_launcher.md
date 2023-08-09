# Installing a new launcher

**DISCLAIMER**: You may brick/damage your box, do only if you know what you're doing and at your own risk

Only tested for H96 Max v58 (Rockchip RK3588).

If like me you don't like the new launcher you can install a new one.
I've chosen the Leanback on Fire from @tsynik that is similar to the old Google Android TV Launcher (Leanback).
It seems to work ok at the current time.
I've used adb to install it

## How to install a new launcher

### Get the apk

 I have used [Leanback on fire](https://github.com/tsynik/LeanbackLauncher), others may work. APKs from the original Google Launcher didn't work.

### Install the apk with adb

```adb install .\LeanbackOnFire_v1.55-release.apk```

### Choose it as the default launcher

Go under settings and select the default launcher.

