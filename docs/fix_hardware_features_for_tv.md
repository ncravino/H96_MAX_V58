# Fixing Hardware Features for TV

**DISCLAIMER**: You may brick/damage your box, do only if you know what you're doing and at your own risk

Only tested for H96 Max v58 (Rockchip RK3588).

By default the device has hardware features wrong that will make some apps (like Plex) thing it is a mobile phone and enter a layout change loop. Since this is a tv box I needed to change one of the feature xml file and change it so it does not happen.

## Features needed

Android TV devices usually implement a set of features. These are checked by the apps to understand what layout should they use, and restrict devices that are not the type they want.
The ones that I found that may be missing are the following:
```
<feature name="android.hardware.screen.landscape" />
<feature name="android.hardware.type.television" />
<feature name="android.software.leanback" />
<feature name="android.software.leanback_only" />
<feature name="android.software.live_tv" />
```

In the case of my H96 Max V58 box the only one missing was:
```
<feature name="android.software.leanback_only" />
```
It was commented out and this was making Plex enter a loop asking to change layout between mobile and tv.

## Editing tv_core_hardware.xml

We need adb, so check [Activating OTG](./activating_otg.md) to get adb working.

### Get the file

```
adb pull /system/etc/permissions/tv_core_hardware.xml ./tv_core_hardware.xml
```

### Add ```android.software.leanback_only``` feature

Open the file in an editor and search android.software.leanback_only and uncomment it (remove the ```<!--``` and ```--!>``` around it).
If it's not there just add it. Should look like this:
```

<feature name="android.software.leanback_only" />

```

### Write the file back

#### Activate root mode 
```adb root```

#### Remount partitions
```adb remount```

#### Push the file back

```adb push ./tv_core_hardware.xml /system/etc/permissions/tv_core_hardware.xml```

#### Reboot

```adb reboot```

Everything should work as a tv box now.

