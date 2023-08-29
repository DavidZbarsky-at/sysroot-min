set -eux

curl -L "$URL" -o src.tar.xz
tar -xvf src.tar.xz \
  "$NAME/lib" \
  "$NAME/usr/include" \
  "$NAME/usr/lib/gcc" \
  "$NAME/usr/lib/$LIB_ARCH"

# Cleanup some includes Chrome uses.
# TODO(zbarsky): It would be cleaner to start from a clean state and build a more minimal sysroot.

rm -rf "usr/include/X11/**"
rm -rf "usr/include/at-spi-2.0/**"
rm -rf "usr/include/atk-1.0/**"
rm -rf "usr/include/cairo/**"
rm -rf "usr/include/dbus-1.0/**"
rm -rf "usr/include/freetype2/**"
rm -rf "usr/include/fribidi/**"
rm -rf "usr/include/gdk-pixbuf-2.0/**"
rm -rf "usr/include/glib-2.0/**"
rm -rf "usr/include/gio-unix-2.0/**"
rm -rf "usr/include/gnutls/**"
rm -rf "usr/include/graphene-1.0/**"
rm -rf "usr/include/gtk-3.0/**"
rm -rf "usr/include/gtk-4.0/**"
rm -rf "usr/include/harfbuzz/**"
rm -rf "usr/include/libxml2/**"
rm -rf "usr/include/jsoncpp/**"
rm -rf "usr/include/krb5/**"
rm -rf "usr/include/libdbusmenu-glib-0.4/**"
rm -rf "usr/include/libdrm/**"
rm -rf "usr/include/libpng*/**"
rm -rf "usr/include/libxslt/**"
rm -rf "usr/include/nspr/**"
rm -rf "usr/include/nss/**"
rm -rf "usr/include/openssl/**"
rm -rf "usr/include/pango-1.0/**"
rm -rf "usr/include/pipewire-0.3/**"
rm -rf "usr/include/pulse/**"
rm -rf "usr/include/spa-0.2/**"
rm -rf "usr/include/systemd/**"
rm -rf "usr/include/valgrind/**"
rm -rf "usr/include/vulkan/**"
rm -rf "usr/include/zlib.h"
rm -rf "usr/include/aarch64-linux-gnu/qt5/**"
rm -rf "usr/include/aarch64-linux-gnu/qt6/**"

tar -cJf "$NAME.tar.xz" lib/ usr/
