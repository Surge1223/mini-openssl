LOCAL_PATH := $(call my-dir)

ssl_src_files := \
  ssl/bio_ssl.c \
  ssl/d1_both.c \
  ssl/d1_clnt.c \
  ssl/d1_enc.c \
  ssl/d1_lib.c \
  ssl/d1_pkt.c \
  ssl/d1_srtp.c \
  ssl/d1_srvr.c \
  ssl/kssl.c \
  ssl/s23_clnt.c \
  ssl/s23_lib.c \
  ssl/s23_meth.c \
  ssl/s23_pkt.c \
  ssl/s23_srvr.c \
  ssl/s2_clnt.c \
  ssl/s2_enc.c \
  ssl/s2_lib.c \
  ssl/s2_meth.c \
  ssl/s2_pkt.c \
  ssl/s2_srvr.c \
  ssl/s3_both.c \
  ssl/s3_cbc.c \
  ssl/s3_clnt.c \
  ssl/s3_enc.c \
  ssl/s3_lib.c \
  ssl/s3_meth.c \
  ssl/s3_pkt.c \
  ssl/s3_srvr.c \
  ssl/ssl_algs.c \
  ssl/ssl_asn1.c \
  ssl/ssl_cert.c \
  ssl/ssl_ciph.c \
  ssl/ssl_err.c \
  ssl/ssl_err2.c \
  ssl/ssl_lib.c \
  ssl/ssl_rsa.c \
  ssl/ssl_sess.c \
  ssl/ssl_stat.c \
  ssl/ssl_txt.c \
  ssl/t1_clnt.c \
  ssl/t1_enc.c \
  ssl/t1_lib.c \
  ssl/t1_meth.c \
  ssl/t1_reneg.c \
  ssl/t1_srvr.c \
  ssl/tls_srp.c

openssl_src_files := \
  apps/app_rand.c \
  apps/apps.c \
  apps/asn1pars.c \
  apps/ca.c \
  apps/ciphers.c \
  apps/crl.c \
  apps/crl2p7.c \
  apps/dgst.c \
  apps/dh.c \
  apps/dhparam.c \
  apps/dsa.c \
  apps/dsaparam.c \
  apps/ecparam.c \
  apps/ec.c \
  apps/enc.c \
  apps/engine.c \
  apps/errstr.c \
  apps/gendh.c \
  apps/gendsa.c \
  apps/genpkey.c \
  apps/genrsa.c \
  apps/nseq.c \
  apps/ocsp.c \
  apps/openssl.c \
  apps/passwd.c \
  apps/pkcs12.c \
  apps/pkcs7.c \
  apps/pkcs8.c \
  apps/pkey.c \
  apps/pkeyparam.c \
  apps/pkeyutl.c \
  apps/prime.c \
  apps/rand.c \
  apps/req.c \
  apps/rsa.c \
  apps/rsautl.c \
  apps/s_cb.c \
  apps/s_client.c \
  apps/s_server.c \
  apps/s_socket.c \
  apps/s_time.c \
  apps/sess_id.c \
  apps/smime.c \
  apps/speed.c \
  apps/spkac.c \
  apps/verify.c \
  apps/version.c \
  apps/x509.c


local_c_includes := \
$(LOCAL_PATH) \
$(LOCAL_PATH)/../ \
$(LOCAL_PATH)/include \
$(LOCAL_PATH)/../crypto \
$(LOCAL_PATH)/../include \
$(LOCAL_PATH)/asn1 \
$(LOCAL_PATH)/evp \
$(LOCAL_PATH)/include \
$(LOCAL_PATH)/crypto \
$(LOCAL_PATH) \
$(LOCAL_PATH)/crypto/include \
$(LOCAL_PATH)/include/openssl




include $(CLEAR_VARS)
include $(LOCAL_PATH)/android-config.mk
LOCAL_SRC_FILES:= ssl/ssltest.c
LOCAL_C_INCLUDES += $(local_c_includes)
LOCAL_STATIC_LIBRARIES := libssl libcrypto
LOCAL_LDLIBS += -lc -lz
LOCAL_MODULE:= ssltest
LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS += -fPIC
LOCAL_FORCE_STATIC_EXECUTABLE := true
include $(BUILD_EXECUTABLE)


#include $(CLEAR_VARS)
#include $(LOCAL_PATH)/android-config.mk
#LOCAL_SRC_FILES:= encrypt.c
#LOCAL_C_INCLUDES += $(local_c_includes)
#LOCAL_WHOLE_STATIC_LIBRARIES := libssl libcrypto
#LOCAL_LDLIBS += -lc -lz
#LOCAL_MODULE:= encrypt
#LOCAL_MODULE_TAGS := optional
#LOCAL_CFLAGS += -fPIC
#LOCAL_FORCE_STATIC_EXECUTABLE := true
#include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
include $(LOCAL_PATH)/android-config.mk
LOCAL_LDLIBS += -lc -lz
LOCAL_CFLAGS := -DMONOLITH

LOCAL_C_INCLUDES := \
	$(NDK_PROJECT_PATH) \
	$(NDK_PROJECT_PATH)/include \
	$(LOCAL_PATH) \
	$(LOCAL_PATH)/../ \
	$(LOCAL_PATH)/include \
	$(LOCAL_PATH)/../crypto \
	$(LOCAL_PATH)/../include \
	$(LOCAL_PATH)/asn1 \
	$(LOCAL_PATH)/evp \
	$(LOCAL_PATH)/include \
	$(LOCAL_PATH)/crypto \
	$(LOCAL_PATH) \
	$(LOCAL_PATH)/crypto/include \
	$(LOCAL_PATH)/include/openssl

LOCAL_CFLAGS := -DMONOLITH

include $(LOCAL_PATH)/android-config.mk
# These flags omit whole features from the commandline "openssl".
# However, portions of these features are actually turned on.
LOCAL_CFLAGS += -DOPENSSL_NO_DTLS1
LOCAL_SRC_FILES:= $(openssl_src_files)

LOCAL_MODULE:= openssl
LOCAL_STATIC_LIBRARIES := libssl libcrypto
LOCAL_CFLAGS += -fPIC
LOCAL_FORCE_STATIC_EXECUTABLE := true
include $(BUILD_EXECUTABLE)


$(call import-add-path, $(LOCAL_PATH))
$(call import-module, crypto)
$(call import-module, ssl)
$(call import-module, apps)
