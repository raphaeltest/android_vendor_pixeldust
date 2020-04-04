# Copyright (C) 2019 The PixelDust Project
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
#  limitations under the License.

# Bootanimation
BOOTANIMATION := 1080

# Release name
PRODUCT_RELEASE_NAME := Redmi K20 Pro
export TARGET_DEVICE := raphael

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)



# Use the sepolicies which are being shipped with our device
TARGET_EXCLUDE_QCOM_VENDOR_SEPOLICY := true

# Inherit from raphael device
$(call inherit-product, device/xiaomi/raphael/msmnile.mk)

# Include common PixelDust stuff
include vendor/pixeldust/configs/pixeldust_phone.mk

# Include optional stuff (e.g. prebuilt apps)
include vendor/pixeldust/configs/system_optional.mk

# Google Apps
include vendor/pixelgapps/pixel-gapps.mk

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := pixeldust_raphael
PRODUCT_DEVICE := raphael
PRODUCT_BRAND := xiaomi
PRODUCT_MODEL := Redmi K20 Pro
PRODUCT_MANUFACTURER := xiaomi
TARGET_SUPPORTS_64_BIT_APPS := true 



PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="Xiaomi/raphael/raphael:10/QKQ1.190825.002/V11.0.2.0.QFKMIXM:user/release-keys"

BUILD_FINGERPRINT := "Xiaomi/raphael/raphael:10/QKQ1.190825.002/V11.0.2.0.QFKMIXM:user/release-keys"

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.pixeldust.maintainer="raphaeltest" \
    ro.pixeldust.device="raphael"

# Copy device specific prebuilt files.
PRODUCT_COPY_FILES += \
    vendor/pixeldust/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml