#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PACKAGE_OVERLAYS += device/malata/smba_common/overlay

$(call inherit-product, frameworks/native/build/tablet-dalvik-heap.mk)

# uses mdpi artwork where available
PRODUCT_AAPT_CONFIG := normal mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi
PRODUCT_LOCALES += mdpi

LOCAL_ACP_UNAVAILABLE := false

PRODUCT_CHARACTERISTICS := tablet

# HAL
#  temp remove libmbm-ril
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.primary.harmony \
    audio.usb.default \
    libaudioutils \
    gps.tegra \
    lights.tegra \
    camera.tegra \
    sensors.tegra

# Filesystem management tools
PRODUCT_PACKAGES += \
        librs_jni \
	setup_fs \
        make_ext4fs \
        l2ping \
        hcitool \
        bttest

# These are the hardware-specific feature permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml 

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PACKAGES += \
  com.android.future.usb.accessory \
  libnetcmdiface 
  

# Media
PRODUCT_COPY_FILES += \
    device/malata/smba_common/prebuilt/media_profiles.xml:system/etc/media_profiles.xml \
    device/malata/smba_common/prebuilt/media_codecs.xml:system/etc/media_codecs.xml \
    device/malata/smba_common/prebuilt/audio_policy.conf:system/etc/audio_policy.conf

# Harmony Configs
PRODUCT_COPY_FILES += \
    device/malata/smba_common/prebuilt/ramdisk/init.rc:root/init.rc \    
    device/malata/smba_common/prebuilt/ramdisk/init.harmony.usb.rc:root/init.harmony.usb.rc \
    device/malata/smba_common/prebuilt/ueventd.harmony.rc:root/ueventd.harmony.rc \
    device/malata/smba_common/prebuilt/bcmdhd.cal:system/etc/wifi/bcmdhd.cal \
    device/malata/smba_common/prebuilt/compcache:system/bin/compcache \
    device/malata/smba_common/prebuilt/nvram.txt:system/etc/wifi/nvram.txt \
     


PRODUCT_COPY_FILES += \
   device/malata/smba_common/prebuilt/make_ext4fs:system/bin/make_ext4fs

# Bluetooth
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.nonsmartphone.conf:system/etc/bluetooth/main.conf \
    device/malata/smba_common/prebuilt/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf \
   
# Touchscreen
PRODUCT_COPY_FILES += \
    device/malata/smba_common/prebuilt/at168_touch.idc:system/usr/idc/at168_touch.idc

PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_UTC_DATE=0 \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=180

WIFI_BAND := 802_11_ABG
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4329/device-bcm.mk)
