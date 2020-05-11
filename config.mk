# Copyright (C) 2017 The Pure Nexus Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := vendor/pixelstyle

# Prebuilt Packages
PRODUCT_PACKAGES += \
    NexusLauncherRelease \
    NexusWallpapersStubPrebuilt2019Static \
    PixelThemesStub2019 \
    SafetyHubPrebuilt \
    SettingsIntelligenceGooglePrebuilt \
    GooglePermissionControllerOverlay \
    PixelDocumentsUIGoogleOverlay

ifeq ($(TARGET_GAPPS_ARCH),arm64)
PRODUCT_PACKAGES += \
    MatchmakerPrebuiltPixel4
endif

# build.prop entrys
PRODUCT_PROPERTY_OVERRIDES += \
    ro.wallpapers_loc_request_suw=true

# Bootanimation
ifeq ($(TARGET_BOOT_ANIMATION_RES),1080)
     PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/bootanimation_1080.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
     PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/bootanimation-dark_1080.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation-dark.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),1440)
     PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/bootanimation_1440.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
     PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/bootanimation-dark_1440.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation-dark.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),720)
     PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/bootanimation_720.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
     PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/bootanimation-dark_720.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation-dark.zip
else
    ifeq ($(TARGET_BOOT_ANIMATION_RES),)
        $(warning "PixelStyle: TARGET_BOOT_ANIMATION_RES is undefined, assuming 1080p")
    else
        $(warning "PixelStyle: Current bootanimation res is not supported, forcing 1080p")
    endif
    PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/bootanimation_1080.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
    PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/bootanimation-dark_1080.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation-dark.zip
endif

# Files
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH)/etc,$(TARGET_COPY_OUT_PRODUCT)/etc)
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH)/fonts,$(TARGET_COPY_OUT_PRODUCT)/fonts)
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH)/media,$(TARGET_COPY_OUT_PRODUCT)/media)

# SetupWizard
PRODUCT_PRODUCT_PROPERTIES += \
    setupwizard.enable_assist_gesture_training=true \
    setupwizard.feature.baseline_setupwizard_enabled=true \
    setupwizard.feature.show_pixel_tos=true \
    setupwizard.feature.show_support_link_in_deferred_setup=false \
    setupwizard.theme=glif_v3_light

# Gestures
PRODUCT_PROPERTY_OVERRIDES += \
    ro.boot.vendor.overlay.theme=com.android.internal.systemui.navbar.gestural

# Sounds
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=The_big_adventure.ogg \
    ro.config.notification_sound=Popcorn.ogg \
    ro.config.alarm_alert=Bright_morning.ogg

# IME
PRODUCT_PRODUCT_PROPERTIES += \
    ro.com.google.ime.bs_theme=true \
    ro.com.google.ime.system_lm_dir=/system/product/usr/share/ime/google/d3_lms \
    ro.com.google.ime.theme_id=5

#Fonts
PRODUCT_COPY_FILES += \
    vendor/pixelstyle/fonts/Aclonica.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Aclonica.ttf \
    vendor/pixelstyle/fonts/Amarante.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Amarante.ttf \
    vendor/pixelstyle/fonts/Bariol-Regular.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Bariol-Regular.ttf \
    vendor/pixelstyle/fonts/Cagliostro-Regular.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Cagliostro-Regular.ttf \
    vendor/pixelstyle/fonts/Coolstory-Regular.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Coolstory-Regular.ttf \
    vendor/pixelstyle/fonts/LGSmartGothic.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/LGSmartGothic.ttf \
    vendor/pixelstyle/fonts/Comic_Sans.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Comic_Sans.ttf \
    vendor/pixelstyle/fonts/Rosemary-Regular.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Rosemary-Regular.ttf \
    vendor/pixelstyle/fonts/SonySketch.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/SonySketch.ttf \
    vendor/pixelstyle/fonts/Surfer.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Surfer.ttf \
    vendor/pixelstyle/fonts/GoogleSans-BoldItalic.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/GoogleSans-BoldItalic.ttf \
    vendor/pixelstyle/fonts/GearTinkerbell.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/GearTinkerbell.ttf \
    vendor/pixelstyle/fonts/Anaheim-Regular.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Anaheim-Regular.ttf \
    vendor/pixelstyle/fonts/fontage/BigNoodleTilting-Italic.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/BigNoodleTilting-Italic.ttf \
    vendor/pixelstyle/fonts/fontage/BigNoodleTilting-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/BigNoodleTilting-Regular.ttf \
    vendor/pixelstyle/fonts/fontage/din1451alt.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/din1451alt.ttf \
    vendor/pixelstyle/fonts/fontage/Hanken-Light.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Hanken-Light.ttf \
    vendor/pixelstyle/fonts/fontage/ReemKufi-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/ReemKufi-Regular.ttf \
    vendor/pixelstyle/fonts/fontage/ComicNeue-Bold.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/ComicNeue-Bold.ttf \
    vendor/pixelstyle/fonts/fontage/ComicNeue-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/ComicNeue-Regular.ttf \
    vendor/pixelstyle/fonts/fontage/Exo2-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Exo2-Regular.ttf \
    vendor/pixelstyle/fonts/fontage/Exo2-SemiBold.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Exo2-SemiBold.ttf \
    vendor/pixelstyle/fonts/fontage/Finlandica-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Finlandica-Regular.ttf \
    vendor/pixelstyle/fonts/fontage/Goodlight.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Goodlight.ttf \
    vendor/pixelstyle/fonts/fontage/Gravity-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Gravity-Regular.ttf \
    vendor/pixelstyle/fonts/fontage/Inter-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Inter-Regular.ttf \
    vendor/pixelstyle/fonts/fontage/Inter-MediumItalic.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Inter-MediumItalic.ttf \
    vendor/pixelstyle/fonts/fontage/LeagueMono-RegularNarrow.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/LeagueMono-RegularNarrow.ttf \
    vendor/pixelstyle/fonts/fontage/LeagueMono-MediumNarrow.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/LeagueMono-MediumNarrow.ttf \
    vendor/pixelstyle/fonts/fontage/LeagueMono-BoldNarrow.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/LeagueMono-BoldNarrow.ttf \
    vendor/pixelstyle/fonts/fontage/LeagueMono-SemiBoldNarrow.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/LeagueMono-SemiBoldNarrow.ttf \
    vendor/pixelstyle/fonts/fontage/LeonSans-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/LeonSans-Regular.ttf \
    vendor/pixelstyle/fonts/fontage/mescla_regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/mescla_regular.ttf \
    vendor/pixelstyle/fonts/fontage/OdibeeSans-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/OdibeeSans-Regular.ttf \
    vendor/pixelstyle/fonts/fontage/Panamericana-Display.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Panamericana-Display.ttf \
    vendor/pixelstyle/fonts/fontage/PTSans-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/PTSans-Regular.ttf \
    vendor/pixelstyle/fonts/fontage/PTMono-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/PTMono-Regular.ttf \
    vendor/pixelstyle/fonts/fontage/routed-gothic-narrow.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/routed-gothic-narrow.ttf \
    vendor/pixelstyle/fonts/fontage/routed-gothic-narrow-half-italic.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/routed-gothic-narrow-half-italic.ttf \
    vendor/pixelstyle/fonts/fontage/SofiaSans-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/SofiaSans-Regular.ttf \
    vendor/pixelstyle/fonts/fontage/SofiaSans-Medium.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/SofiaSans-Medium.ttf \
    vendor/pixelstyle/fonts/fontage/SofiaSansSemiCond-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/SofiaSansSemiCond-Regular.ttf \
    vendor/pixelstyle/fonts/fontage/SofiaSansSemiCond-Medium.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/SofiaSansSemiCond-Medium.ttf

# Include package overlays
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += $(LOCAL_PATH)/overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay/common/
