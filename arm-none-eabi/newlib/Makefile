COMMENT=	newlib for ${CONFIG} cross-development

DISTNAME=	newlib-3.3.0
VERSION=	3.3.0
PKGNAME=	${CONFIG}-newlib-${VERSION}

FLAVORS=	aarch64 arm
FLAVOR?=	arm

.if "${FLAVOR}" == "aarch64"
CONFIG=		aarch64-none-elf
.elif "${FLAVOR}" == "arm"
CONFIG=		arm-none-eabi
.else
ERRORS+=	"either aarch64 or arm FLAVOR should be set"
.endif

MAKE_ENV+=	${CONFIGURE_ENV}

HOMEPAGE=	http://sourceware.org/newlib/

SITES=		ftp://sourceware.org/pub/newlib/
#MASTER_SITES=	ftp://sources.redhat.com/pub/newlib/

EXTRACT_SUFX=	.tar.gz

.if ${FLAVOR:Maarch64}
BUILD_DEPENDS+=	devel/arm-none-eabi/binutils,aarch64 \
		devel/arm-none-eabi/gcc-bootstrap,aarch64
RUN_DEPENDS+=	devel/arm-none-eabi/binutils,aarch64
.elif ${FLAVOR:Marm}
BUILD_DEPENDS+=	devel/arm-none-eabi/binutils,arm \
		devel/arm-none-eabi/gcc-bootstrap,arm
RUN_DEPENDS+=	devel/arm-none-eabi/binutils,arm
.else
ERRORS+=	"either aarch64 or arm FLAVOR should be set"
.endif

CONFIGURE_ENV=	CC_FOR_TARGET="${INSTALLDIR}/bootstrap/bin/${CONFIG}-gcc" \
		AR_FOR_TARGET="${INSTALLDIR}/bin/${CONFIG}-ar" \
		RANLIB_FOR_TARGET="${INSTALLDIR}/bin/${CONFIG}-ranlib"
CONFIGURE_ARGS+=--enable-interwork \
		--with-as="${INSTALLDIR}/bin/${CONFIG}-as" \
		--with-ld="${INSTALLDIR}/bin/${CONFIG}-ld" \
		--enable-multilib

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/${CONFIG}/share/doc/${CONFIG}/newlib
	${INSTALL_DATA} ${WRKDIST}/COPYING.NEWLIB \
		${PREFIX}/${CONFIG}/share/doc/${CONFIG}/newlib

.include <bsd.port.mk>
