QT += core xml gui network widgets sql charts

TARGET = dana
TEMPLATE = app

##macx: CONFIG-=app_bundle

include(./../3rdparty/qtsingleapplication/src/qtsingleapplication.pri)
include(./../3rdparty/qtspeech/QtSpeech.pri)
include(dana.pri)



win32 {
   RC_FILE = dana.rc
}

unix {

    isEmpty(PREFIX) {
        PREFIX = /usr
    }

    target.path = $$PREFIX/bin

    shortcutfiles.files = dana.desktop
    shortcutfiles.path = $$PREFIX/share/applications/
    pixmap.files = ./images/dana_96.png
    pixmap.path = $$PREFIX/share/pixmaps/
    zlib.files = ./../3rdparty/zlib/linux/minigzip ./../3rdparty/zlib/linux/miniunz ./../3rdparty/zlib/linux/minizip
    zlib.path = $$PREFIX/share/zlib/

    INSTALLS += shortcutfiles
    INSTALLS += pixmap
    INSTALLS += zlib
}

INSTALLS += target

DISTFILES += \
    dana.desktop \
    ./images/dana_96.png \
    ./../3rdparty/zlib/linux/minigzip \
    ./../3rdparty/zlib/linux/miniunz \
    ./../3rdparty/zlib/linux/minizip
