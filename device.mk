LOCAL_PATH := device/lenovo/cube

# A/B
AB_OTA_PARTITIONS += \
    boot \
    system \
    vendor

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service \
    bootctrl.avb

PRODUCT_STATIC_BOOT_CONTROL_HAL := \
    bootctrl.avb \
    libgptutils \
    libz \
    libcutils

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    $(LOCAL_PATH)/recovery/root/sbin/update_engine_sideload
    
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/init.recovery.mt8167.rc:root/init.recovery.mt8167.rc \
    $(LOCAL_PATH)/recovery/root/init.recovery.service.rc:root/init.recovery.service.rc \
    $(LOCAL_PATH)/recovery/root/ueventd.rc:root/ueventd.rc \
    $(LOCAL_PATH)/recovery/root/ueventd.mt8167.rc:root/ueventd.mt8167.rc

$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
