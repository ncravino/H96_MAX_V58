# Booting into the various modes

**DISCLAIMER**: You may brick/damage your box, do only if you know what you're doing and at your own risk

Only tested for H96 Max v58 (Rockchip RK3588).

Special thanks to @colemickens for https://github.com/colemickens/h96-max-v58-investigation.

## Drivers and RKDevTool

You need to install the drivers for RK3588 on Windows:

- for instance [RK3588_Update_Firmware.md](https://github.com/industrialtablet/RK3588-Development-Board/blob/main/RK3588_Update_Firmware.md)

The RKDevTool is also needed to send the stock firmware via loader mode.

## Rockchip Loader Mode

    0. disconnect power and usbs
    1. press and hold reset (small hole between antennas)
    2. using USB A connected to computer:
        - connect to black port on box
    3. connect power
    4. hold reset for 3 secs (at most)
    5. box should be on but without image or lights (the optical on the back will have light)
    6. a rockchip device should be visible on usb devices (lsusb or device manager)
    7. RKDevTool will show a device with loader active

## Fastboot

    0. disconnect power and usbs
    1. press and hold reset (small hole between antennas)
    2. connect power
    3. hold reset until image appears
    4. select reboot to fastboot
    5. device should be visible
        - on windows you may need to force the driver for adb boot
            - update driver
            - select from my computer
            - select from a list
            - all devices
            - android boot device
    6. "fastboot devices" should show a device (check drivers if not)
