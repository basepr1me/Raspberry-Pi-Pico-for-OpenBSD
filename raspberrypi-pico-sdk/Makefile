COMMENT =	software development kit for the Raspberry Pi Pico

GH_ACCOUNT =	raspberrypi
GH_PROJECT =	pico-sdk
GH_TAGNAME =	1.5.1
PKGNAME =	${GH_ACCOUNT}-${GH_PROJECT}-${GH_TAGNAME}

CATEGORIES =	devel

MAINTAINER =	Tracey Emery <tracey@openbsd.org>

# BSD-3
PERMIT_PACKAGE = Yes

MODULES =	lang/python

RUN_DEPENDS +=	devel/arm-none-eabi/binutils,arm \
		devel/arm-none-eabi/gcc,arm \
		devel/arm-none-eabi/newlib,arm \
		devel/cmake

SITES.a = https://github.com/georgerobotics/cyw43-driver/archive/
SITES.b = https://github.com/lwip-tcpip/lwip/archive/
SITES.c = https://github.com/hathach/tinyusb/archive/
SITES.d = https://github.com/bluekitchen/btstack/archive/
SITES.e = https://github.com/Mbed-TLS/mbedtls/archive/
SITES.f = https://github.com/raspberrypi/pico-examples/archive/

CYW43_V =	8ef38a6d32c54f850bff8f189bdca19ded33792a
LWIP_V =	239918ccc173cb2c2a62f41a40fd893f57faf1d6
TUSB_V =	86c416d4c0fb38432460b3e11b08b9de76941bf5
BTSTACK_V =	72ef1732c954d938091467961e41f4aa9b976b34
MBEDTLS_V =	a77287f8fa6b76f74984121fdafc8563147435c8
EX_V =		eca13acf57916a0bd5961028314006983894fc84

DISTFILES =	${GH_PROJECT}-${GH_TAGNAME}.tar.gz
DISTFILES.a +=	cyw43-${CYW43_V:C/(........).*/\1/}{${CYW43_V}}.tar.gz
DISTFILES.b +=	lwip-${LWIP_V:C/(........).*/\1/}{${LWIP_V}}.tar.gz
DISTFILES.c +=	tinyusb-${TUSB_V:C/(........).*/\1/}{${TUSB_V}}.tar.gz
DISTFILES.d +=	btstack-${BTSTACK_V:C/(........).*/\1/}{${BTSTACK_V}}.tar.gz
DISTFILES.e +=	mbedtls-${MBEDTLS_V:C/(........).*/\1/}{${MBEDTLS_V}}.tar.gz
DISTFILES.f +=	pico-examples-${EX_V:C/(........).*/\1/}{${EX_V}}.tar.gz
INSTALLDIR =	${PREFIX}/raspberrypi-pico-sdk

NO_TEST =	Yes
NO_BUILD =	Yes

post-extract:
	rmdir ${WRKSRC}/lib/cyw43-driver
	mv ${WRKDIR}/cyw43* ${WRKSRC}/lib/cyw43-driver
	rmdir ${WRKSRC}/lib/lwip
	mv ${WRKDIR}/lwip* ${WRKSRC}/lib/lwip
	rmdir ${WRKSRC}/lib/tinyusb
	mv ${WRKDIR}/tinyusb* ${WRKSRC}/lib/tinyusb
	rmdir ${WRKSRC}/lib/btstack
	mv ${WRKDIR}/btstack* ${WRKSRC}/lib/btstack
	rmdir ${WRKSRC}/lib/mbedtls
	mv ${WRKDIR}/mbedtls* ${WRKSRC}/lib/mbedtls
	mv ${WRKDIR}/pico-examples* ${WRKSRC}/pico-examples

do-install:
	@mkdir -p ${INSTALLDIR}
	@cp -r ${WRKSRC}/* ${INSTALLDIR}

# post-install:
# 	${MODPY_BIN} ${MODPY_LIBDIR}/compileall.py \
# 	    ${PREFIX}/raspberrypi-pico-sdk

.include <bsd.port.mk>
