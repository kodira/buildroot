################################################################################
#
# skolar-display
#
################################################################################

SKOLAR_DISPLAY_VERSION     = v1.5.6
SKOLAR_DISPLAY_SITE        = git@github.com:kodira/skolar-display.git
SKOLAR_DISPLAY_SITE_METHOD = git

define SKOLAR_DISPLAY_CONFIGURE_CMDS
    cd $(@D); \
    $(HOST_DIR)/usr/bin/qmake
endef

define SKOLAR_DISPLAY_BUILD_CMDS
     $(MAKE) -C $(@D)
endef

define SKOLAR_DISPLAY_INSTALL_TARGET_CMDS
    install -D -m 0755 $(@D)/skolardisplay $(TARGET_DIR)/usr/bin/skolardisplay
    install -D -m 0555 package/skolar-display/skolar-display-splash.png $(TARGET_DIR)/usr/share/pixmaps/skolar-display-splash.png
    install -D -m 0755 package/skolar-display/skolar-display-start.sh $(TARGET_DIR)/usr/bin/skolar-display-start.sh
endef

define SKOLAR_DISPLAY_INSTALL_INIT_SYSV
    install -D -m 0755 package/skolar-display/S00splash $(TARGET_DIR)/etc/init.d/S00splash
    install -D -m 0755 package/skolar-display/S90skolar-display $(TARGET_DIR)/etc/init.d/S90skolar-display
endef

define SKOLAR_DISPLAY_INSTALL_INIT_SYSTEMD
    install -D -m 644 package/skolar-display/skolar-display.service $(TARGET_DIR)/usr/lib/systemd/system/skolar-display.service
    mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
    ln -fs ../../../../usr/lib/systemd/system/skolar-display.service $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/skolar-display.service

    install -D -m 644 package/skolar-display/splash.service $(TARGET_DIR)/usr/lib/systemd/system/splash.service
    mkdir -p $(TARGET_DIR)/etc/systemd/system/sysinit.target.wants
    ln -fs ../../../../usr/lib/systemd/system/splash.service $(TARGET_DIR)/etc/systemd/system/sysinit.target.wants/splash.service

endef


$(eval $(generic-package))

