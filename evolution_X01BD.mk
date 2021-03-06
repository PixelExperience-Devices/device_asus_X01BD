#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_o_mr1.mk)

# Inherit some common PixelExperience stuff
$(call inherit-product, vendor/evolution/config/common_full_phone.mk)

# PixelExperience Properties
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_GAPPS_ARCH := arm64

# Inherit from X01BD device
$(call inherit-product, $(LOCAL_PATH)/device.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := evolution_X01BD
PRODUCT_DEVICE := X01BD
PRODUCT_BRAND := asus
PRODUCT_MODEL := ASUS_X01BDA
PRODUCT_MANUFACTURER := asus

PRODUCT_GMS_CLIENTID_BASE := android-asus

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE=ASUS_X01BD_1 \
    PRODUCT_NAME=WW_X01BD \
    PRIVATE_BUILD_DESC="sdm660_64-user 10 QKQ1 73 release-keys"

# Build fingerprint
BUILD_FINGERPRINT := "asus/WW_X01BD/ASUS_X01BD_1:10/QKQ1/17.2018.2012.434-20201203:user/release-keys"

###########################################
# OmniSwitch
PRODUCT_PACKAGES += \
    com.android.phone.common \
    OmniSwitch \
    Snap \
    LatinIME \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/privapp-permissions-OmniSwitch.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-OmniSwitch.xml

# Solve miss-connection of Bluetooth
###########################################
# A2DP offload enabled for compilation
AUDIO_FEATURE_ENABLED_A2DP_OFFLOAD := true

# A2DP offload supported
PRODUCT_PROPERTY_OVERRIDES += \
ro.bluetooth.a2dp_offload.supported=true

# A2DP offload disabled (UI toggle property)
PRODUCT_PROPERTY_OVERRIDES += \
persist.bluetooth.a2dp_offload.disabled=false

# A2DP offload DSP supported encoder list
PRODUCT_PROPERTY_OVERRIDES += \
persist.bluetooth.a2dp_offload.cap=sbc-aac-aptx-aptxhd-
###########################################
