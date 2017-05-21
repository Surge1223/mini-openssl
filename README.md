Build with:

$NDK/ndk-build NDK_PROJECT_PATH=. APPLICATION_BUILD_SCRIPT=Application.mk

output:

libs/arm64-v8a
libs/arm64-v8a/openssl
libs/arm64-v8a/ssltest

libs/armeabi
libs/armeabi/openssl
libs/armeabi/ssltest

libs/armeabi-v7a
libs/armeabi-v7a/openssl
libs/armeabi-v7a/ssltest

libs/x86
libs/x86/openssl
libs/x86/ssltest

obj/local/arm64-v8a/libcrypto.a
obj/local/arm64-v8a/libssl.a
obj/local/armeabi/libcrypto.a
obj/local/armeabi/libssl.a
obj/local/armeabi-v7a/libcrypto.a
obj/local/armeabi-v7a/libssl.a
obj/local/x86/libcrypto.a
obj/local/x86/libssl.a
