# Playing with the H96 MAX V58 (Rockchip RK3588)

I've got my box from Ali Express at around €150. It came with a non-stock modified firmware that seemingly did nothing more that the stock one did. OTG was also not active.

## Specs

It uses the new Rockchip RK3588 SoC, you can check the [datasheet](https://www.rock-chips.com/uploads/pdf/2022.8.26/191/RK3588%20Brief%20Datasheet.pdf).

- 2 processors
  - Quad Core Cortex-A76 @ 2.4 GHz
  - Quad Core Cortex-A55 @ 1.8 GHz
- 4GB or 8GB of LPDDR4
- 32/64/128GB of eMMC storage
- ARM Mali 610 MC4 CPU
- 1x USB2 port + 1x USB3 port
- 1x Gigabit RJ45
- 1x HDMI
- 1x SPDIF
- 2 wifi antennas
- Bluetooth 5.0
- 8K capabilities
  - Hardware Codecs Supported: Besides the usual it has AV1, H265, VP9, VC1 (not 8K)
- an NPU with max 6TOPS
  - supports tensorflow, pytorch, tflite, caffe, ONNX, etc
  - supports int4,int8,int16,fp16,bf16,tf32
- Android 12

It's quite a [powerful SoC](https://www.cpubenchmark.net/cpu.php?cpu=Rockchip+RK3588&id=4906) from Rockchip at a nice price. With proper Linux support (and probably additional cooling) it could easily be used as a desktop.

## Mainline Linux Support

This SoC is very new, but there's currently (2023-08) an [effort to integrate the RK3588 SoC into mainline](https://gitlab.collabora.com/hardware-enablement/rockchip-3588/notes-for-rockchip-3588/-/blob/main/mainline-status.md). This means it'll probably be easier to get things like LibreElec on this box to boot in the future.

## Playing with it

**DISCLAIMER**: You may brick/damage your box, do only if you know what you're doing and at your own risk

I've documented most of the experiments that I've done with the box. You can find about them in the links bellow.

Only tested for H96 Max v58 (Rockchip RK3588).

### How to disassemble

[Disassembling the H96 Max V58](./docs/box_disassembly.md)

### How to use the different Boot Modes

[Boot Modes](./docs/booting.md)

### How to install the Stock firmware

[Installing Stock](./docs/flashing_stock.md)

### Activate OTG so we can use adb

The device comes by default with all the ports in host mode.

[Activating OTG on the USB2.0 Port](./docs/activating_otg.md)

When debug mode is on the port cannot be used for peripherals like a keyboard.

### Install a new Launcher

I find the stock launcher unusable so I installed another one.

[Installing a new launcher](./docs/installing_a_new_launcher.md)

### Fixing Hardware Feature Flags for TV

There was an issue with Plex and this box where it was constantly changing layout due to a missing feature flag.

[Fixing Hardware Feature Flags for TV](./docs/fix_hardware_features_for_tv.md)

### Cleaning up the Stock Install

There was plenty of software there that I didn't want, instead of uninstalling one by one via interface I used adb.

[Cleaning up bloatware](./docs/cleaning_up_bloatware.md)

### Rooting

Should be doable with the usual magisk patch method, not tested yet.

### Installing Rockchip Linux for RK3588

WIP: Still reading on it to make sure I don't brick it :D

### Scripts

You can find helper scripts under [./scripts/](scripts).

