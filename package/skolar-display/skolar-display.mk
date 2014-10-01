################################################################################
#
# skolar-display
#
################################################################################

SKOLAR_DISPLAY_VERSION     = master
SKOLAR_DISPLAY_SITE        = git@github.com:kodira/skolar-display.git
SKOLAR_DISPLAY_SITE_METHOD = git

define SKOLAR_DISPLAY_CONFIGURE_CMDS
    cd $(@D); \
    $(HOST_DIR)/usr/bin/qmake
endef

define SKOLAR_DISPLAY_BUILD_CMDS
     $(MAKE) -C $(@D)
endef

# TODO: Rename smartdisplay to skolar-display (binary and here)
define SKOLAR_DISPLAY_INSTALL_TARGET_CMDS
    install -D -m 0755 $(@D)/smartdisplay $(TARGET_DIR)/usr/bin/skolar-display
    install -D -m 0755 package/skolar-display/S90skolar-display $(TARGET_DIR)/etc/init.d/S90skolar-display
    install -D -m 0755 package/skolar-display/S00splash $(TARGET_DIR)/etc/init.d/S00splash
    install -D -m 0555 package/skolar-display/skolar-display-splash.png $(TARGET_DIR)/usr/share/pixmaps/skolar-display-splash.png
    install -D -m 0755 package/skolar-display/skolar-display-start.sh $(TARGET_DIR)/usr/bin/skolar-display-start.sh
endef

$(eval $(generic-package))

