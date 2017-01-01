# Copyright 2014 The Android Open Source Project
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

KERNEL_TOOLCHAIN := /run/media/haozeke/Storage/AndBuild/Tools/Toolchains/Uber/aarch64-linux-android-6.0-kernel/bin/
KERNEL_TOOLCHAIN_PREFIX := aarch64-linux-android-
TARGET_KERNEL_SOURCE := kernel/sony/msm

ifeq ($(strip $(TARGET_PRODUCT)), aosp_e6653)
TARGET_KERNEL_CONFIG := pixN_sumire_defconfig
else
TARGET_KERNEL_CONFIG := pixN_sumire_dsds_defconfig
endif

# Inherit from those products. Most specific first.
$(call inherit-product, device/sony/sumire/device.mk)
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, vendor/google/products/gms.mk)
$(call inherit-product, vendor/addons/config.mk)

# Include custom telephony configuration
include vendor/pixN/configs/custom_phone.mk

PRODUCT_NAME := aosp_e6653
PRODUCT_DEVICE := sumire
PRODUCT_MODEL := Xperia Z5 (AOSP)
PRODUCT_BRAND := Sony
PRODUCT_MANUFACTURER := Sony


# Additional apps
PRODUCT_PACKAGES += \
    masquerade \
    AOSPLinks \
    VanillaMusic \
    KernelAdiutor \
    OmniGears \
    Busybox 

# DU Utils Library
PRODUCT_BOOT_JARS += \
    org.dirtyunicorns.utils

# DU Utils Library
PRODUCT_PACKAGES += \
org.dirtyunicorns.utils

# Google Inclusions
GAPPS_INCLUDED_PACKAGES += \
    Keep \
    NewsWidget

# Google Exclusions
GAPPS_EXCLUDED_PACKAGES += \
    Hangouts \
    YouTube \
    Photos  \
    Music

# AICP packages
#PRODUCT_PACKAGES += \
AicpExtras 

ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.adb.secure=0 \
    ro.secure=0 \
    ro.debuggable=1

# TWRP Recovery
DEVICE_RESOLUTION := 1440x814
TW_THEME := portrait_hdpi
TW_IGNORE_ABS_MT_TRACKING_ID := true

# F2FS Support
PRODUCT_PACKAGES += \
    mkfs.f2fs \
    fsck.f2fs \
    fibmap.f2fs

# QCOM Flag
QCOM_HARDWARE := true

# From Cardinal-AOSP


# by default, do not update the recovery with system updates
#PRODUCT_PROPERTY_OVERRIDES += persist.sys.recovery_update=false

# DU Utils Library
#PRODUCT_BOOT_JARS += \
    org.dirtyunicorns.utils
#PRODUCT_PACKAGES += \
org.dirtyunicorns.utils


# SD Clang
#SDCLANG := true

#SDCLANG_PATH := prebuilts/clang/linux-x86/host/sdclang-3.8/bin

#SDCLANG_LTO_DEFS := device/qcom/common/sdllvm-lto-defs.mk

# DEXPREOPT
WITH_DEXPREOPT := true

