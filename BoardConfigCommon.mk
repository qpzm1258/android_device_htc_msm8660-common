# Copyright (C) 2012 The CyanogenMod Project
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

#USE_CAMERA_STUB := true

BOARD_VENDOR := htc

TARGET_SPECIFIC_HEADER_PATH := device/htc/msm8660-common/include

# Bootloader
TARGET_NO_BOOTLOADER := true

# Kernel
TARGET_KERNEL_SOURCE := kernel/htc/shooteru
TARGET_KERNEL_CUSTOM_TOOLCHAIN := linaro-4.7.3_cortex-a8

# Platform
TARGET_BOARD_PLATFORM := msm8660
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

# Architecture
TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_ARMV7A := true
TARGET_CPU_VARIANT := scorpion

# Flags
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE

# FB legacy
BOARD_EGL_NEEDS_LEGACY_FB := true
#BOARD_EGL_NEEDS_FNW := true

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_LEGACY_QCOM := true
BOARD_USES_QCOM_LEGACY_CAM_PARAMS := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
TARGET_DOESNT_USE_FENCE_SYNC := true
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true

#Power
TARGET_PROVIDES_POWERHAL := true

# Audio
TARGET_QCOM_AUDIO_VARIANT := caf
BOARD_USES_LEGACY_ALSA_AUDIO := true
BOARD_QCOM_VOIP_ENABLED := true
BOARD_QCOM_TUNNEL_LPA_ENABLED := false
COMMON_GLOBAL_CFLAGS += -DHTC_ACOUSTIC_AUDIO -DLEGACY_QCOM_VOICE

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUEDROID_VENDOR_CONF := device/htc/msm8660-common/bluetooth/vnd_msm8660.txt

# Camera
COMMON_GLOBAL_CFLAGS += -DICS_CAMERA_BLOB -DNO_UPDATE_PREVIEW
BOARD_HAVE_HTC_FFC := true
BOARD_NEEDS_MEMORYHEAPPMEM := true
BOARD_CAMERA_USE_MM_HEAP := true
TARGET_DISABLE_ARM_PIE := true
USE_DEVICE_SPECIFIC_CAMERA := true
BOARD_USES_PMEM_ADSP := true
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS

# QCOM enhanced A/V
TARGET_ENABLE_AV_ENHANCEMENTS := true

# Camera wrapper
COMMON_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK

# Filesystem
BOARD_VOLD_MAX_PARTITIONS := 36

# GPS
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

# Graphics
TARGET_QCOM_DISPLAY_VARIANT := legacy
BOARD_USES_LEGACY_MEDIA := true
TARGET_QCOM_MEDIA_VARIANT := legacy
COMMON_GLOBAL_CFLAGS += -DQCOM_NO_SECURE_PLAYBACK -DREFRESH_RATE=60 -DHTC_RGBA_8888_OFFSET
USE_OPENGL_RENDERER := true
TARGET_NO_HW_VSYNC := true
TARGET_USES_POST_PROCESSING := true
TARGET_USES_C2D_COMPOSITION := true
BOARD_EGL_CFG := device/htc/msm8660-common/configs/egl.cfg
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# Bootanimation
TARGET_BOOTANIMATION_PRELOAD := true

# Lights
TARGET_PROVIDES_LIBLIGHT := true

#Legacy recovery
SKIP_SET_METADATA := true

# Hardware tunables
BOARD_HARDWARE_CLASS := device/htc/msm8660-common/cmhw/

#F2FS
TARGET_USERIMAGES_USE_F2FS := true

# SELinux
BOARD_SEPOLICY_DIRS += \
    device/htc/msm8660-common/sepolicy

BOARD_SEPOLICY_UNION += \
    app.te \
    bluetooth.te \
    device.te \
    domain.te \
    drmserver.te \
    file_contexts \
    files \
    file.te \
    hci_init.te \
    healthd.te \
    init.te \
    init_shell.te \
    keystore.te \
    kickstart.te \
    mediaserver.te \
    rild.te \
    surfaceflinger.te \
    system.te \
    ueventd.te \
    untrusted_app.te \
    vold.te \
    wpa.te \
    wpa_socket.te

TARGET_EXTRA_CFLAGS += $(call cc-option,-mtune=cortex-a9,$(call cc-option,-mtune=cortex-a8)) $(call cc-option,-mcpu=cortex-a9,$(call cc-option,-mcpu=cortex-a8))
