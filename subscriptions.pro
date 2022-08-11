QT       += core gui network widgets mqtt

TARGET = mqttsubscriptions

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0


SOURCES += main.cpp\
    MqttSignTool/aliyunmqttpasswordgenerator.cpp \
    MqttSignTool/hash-library/crc32.cpp \
    MqttSignTool/hash-library/keccak.cpp \
    MqttSignTool/hash-library/md5.cpp \
    MqttSignTool/hash-library/sha1.cpp \
    MqttSignTool/hash-library/sha256.cpp \
    MqttSignTool/hash-library/sha3.cpp \
    hash-library/crc32.cpp \
    hash-library/keccak.cpp \
    hash-library/md5.cpp \
    hash-library/sha1.cpp \
    hash-library/sha256.cpp \
    hash-library/sha3.cpp \
        mainwindow.cpp \
    subscriptionwindow.cpp

HEADERS  += mainwindow.h \
    MqttSignTool/aliyunmqttpasswordgenerator.h \
    MqttSignTool/hash-library/crc32.h \
    MqttSignTool/hash-library/hash.h \
    MqttSignTool/hash-library/hmac.h \
    MqttSignTool/hash-library/keccak.h \
    MqttSignTool/hash-library/md5.h \
    MqttSignTool/hash-library/sha1.h \
    MqttSignTool/hash-library/sha256.h \
    MqttSignTool/hash-library/sha3.h \
    hash-library/crc32.h \
    hash-library/hash.h \
    hash-library/hmac.h \
    hash-library/keccak.h \
    hash-library/md5.h \
    hash-library/sha1.h \
    hash-library/sha256.h \
    hash-library/sha3.h \
    subscriptionwindow.h
FORMS    += mainwindow.ui \
    subscriptionwindow.ui

target.path = $$[QT_INSTALL_EXAMPLES]/mqtt/subscriptions
INSTALLS += target

DISTFILES += \
    MqttSignTool/hash-library/LICENSE \
    MqttSignTool/hash-library/readme.md \
    hash-library/LICENSE \
    hash-library/readme.md \
    password_generate.py
