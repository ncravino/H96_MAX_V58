# Cleaning up bloatware

**DISCLAIMER**: You may brick/damage your box, do only if you know what you're doing and at your own risk

Only tested for H96 Max v58 (Rockchip RK3588).

The process here is the same as with most Android devices with adb, so I'll just list the commands for each task.

The box come with a lot of packages you might find annoying.

Note: don't remove system packages or packages that you don't know what they are.

## Get a list of packages

```adb shell pm list packages```

You can use grep to filter for the package you want.

## Uninstall packages

```adb uninstall $package_name```

## "Root" uninstall

Some packages won't be uninstalled by the method above. Note that this method can and will remove some critical packages if you try.

```adb uninstall --user 0 $package_name```

## Notes

    - Package com.example.a doesn't seem to be doing anything useful.

