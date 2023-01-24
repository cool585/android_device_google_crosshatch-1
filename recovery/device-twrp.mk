# Inherit from common AOSP config
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)

# Enable project quotas and casefolding for emulated storage without sdcardfs
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Qcom Decryption
PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe

# CS40L20 Haptics Waveform & Firmware
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/vibrator/cs40l20/cs40l20.wmfw:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/firmware/cs40l20.wmfw \
    $(DEVICE_PATH)/vibrator/cs40l20/cs40l20.bin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/firmware/cs40l20.bin

# Vibrator Service & Manifest
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/recovery/vibrator/vibrator.crosshatch-service.rc:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/etc/init/vibrator.crosshatch-service.rc \
    $(DEVICE_PATH)/recovery/vibrator/vibrator.crosshatch-service.xml:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/etc/vintf/manifest/vibrator.crosshatch-service.xml

# ueventd
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/ueventd.hardware.rc:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/ueventd.rc

# OEM otacerts
PRODUCT_EXTRA_RECOVERY_KEYS += \
    $(DEVICE_PATH)/recovery/security/$(BOARD_VENDOR)1 \
    $(DEVICE_PATH)/recovery/security/$(BOARD_VENDOR)2
