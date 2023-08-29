set -eux

curl -L "$URL" -o src.tar.xz
tar -xvf src.tar.xz \
  "./lib" \
  "./usr/include" \
  "./usr/lib/gcc" \
  "./usr/lib/$LIB_ARCH-linux-gnu" \
  &>/dev/null

# Cleanup some includes Chrome uses.
# TODO(zbarsky): It would be cleaner to start from a clean state and build a more minimal sysroot.

rm -rf "usr/include/EGL"
rm -rf "usr/include/FLAC"
rm -rf "usr/include/GL"
rm -rf "usr/include/GLES"
rm -rf "usr/include/GLES2"
rm -rf "usr/include/GLES3"
rm -rf "usr/include/X11"
rm -rf "usr/include/alsa"
rm -rf "usr/include/at-spi-2.0"
rm -rf "usr/include/atk-1.0"
rm -rf "usr/include/bluetooth"
rm -rf "usr/include/cairo"
rm -rf "usr/include/dbus-1.0"
rm -rf "usr/include/epoxy"
rm -rf "usr/include/freetype2"
rm -rf "usr/include/fribidi"
rm -rf "usr/include/gdk-pixbuf-2.0"
rm -rf "usr/include/glib-2.0"
rm -rf "usr/include/gio-unix-2.0"
rm -rf "usr/include/gnutls"
rm -rf "usr/include/graphene-1.0"
rm -rf "usr/include/gtk-3.0"
rm -rf "usr/include/gtk-4.0"
rm -rf "usr/include/harfbuzz"
rm -rf "usr/include/libevdev-1.0"
rm -rf "usr/include/libxml2"
rm -rf "usr/include/jsoncpp"
rm -rf "usr/include/krb5"
rm -rf "usr/include/libdbusmenu-glib-0.4"
rm -rf "usr/include/libdrm"
rm -rf "usr/include/libpng"*
rm -rf "usr/include/libxslt"
rm -rf "usr/include/linux"
rm -rf "usr/include/mit-krb5"
rm -rf "usr/include/nspr"
rm -rf "usr/include/nss"
rm -rf "usr/include/openssl"
rm -rf "usr/include/opus"
rm -rf "usr/include/pango-1.0"
rm -rf "usr/include/pipewire-0.3"
rm -rf "usr/include/pulse"
rm -rf "usr/include/spa-0.2"
rm -rf "usr/include/sound"
rm -rf "usr/include/systemd"
rm -rf "usr/include/xcb"
rm -rf "usr/include/xkbcommon"
rm -rf "usr/include/valgrind"
rm -rf "usr/include/vulkan"
rm -rf "usr/include/webp"
rm -rf "usr/include/zlib.h"
rm -rf "usr/include/$LIB_ARCH-linux-gnu/qt5"
rm -rf "usr/include/$LIB_ARCH-linux-gnu/qt6"

mv "./usr/lib/$LIB_ARCH-linux-gnu" "./usr/lib/$LIB_ARCH-linux-gnu-backup"
mkdir "./usr/lib/$LIB_ARCH-linux-gnu"

mv "./usr/lib/$LIB_ARCH-linux-gnu-backup"/{*.o,libc*,libm*,libpthread*,librt*} "./usr/lib/$LIB_ARCH-linux-gnu"
mv "./usr/lib/$LIB_ARCH-linux-gnu-backup"/*.o "./usr/lib/$LIB_ARCH-linux-gnu"
rm -rf "./usr/lib/$LIB_ARCH-linux-gnu-backup"

tar -cJf "$NAME.tar.xz" lib/ usr/

ls -lh "$NAME.tar.xz"
