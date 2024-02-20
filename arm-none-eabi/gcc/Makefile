COMMENT=	gcc for ${CONFIG} cross-development

VERSION=	12.2.0
DISTNAME=	gcc-${VERSION}
PKGNAME=	${CONFIG}-gcc-${VERSION}
REVISION=	1

USE_NOEXECONLY=	Yes

FLAVORS=	aarch64 arm
FLAVOR?=	arm

.if "${FLAVOR}" == "aarch64"
CONFIG=		aarch64-none-elf
.elif "${FLAVOR}" == "arm"
CONFIG=		arm-none-eabi
.else
ERRORS+=	"either aarch64 or arm FLAVOR should be set"
.endif

SUBST_VARS+=	VERSION CONFIG

WANTLIB=	c m ${COMPILER_LIBCXX} gmp mpfr mpc pthread
DIST_SUBDIR=	gcc

COMPILER =	base-clang ports-gcc base-gcc

SITES=		${SITE_GCC:=releases/gcc-$(VERSION)/}

.if ${MACHINE_ARCH} == "powerpc64"
PATCH_LIST =	patch-* vecstep-*
.endif

BUILD_DEPENDS+=	devel/autoconf/2.13	\
		devel/bison		\
		devel/metaauto		\
		${RUN_DEPENDS}
LIB_DEPENDS=	devel/mpfr devel/libmpc

.if ${FLAVOR:Maarch64}
BUILD_DEPENDS+=	devel/arm-none-eabi/binutils,aarch64
RUN_DEPENDS=	devel/arm-none-eabi/binutils,aarch64
.elif ${FLAVOR:Marm}
BUILD_DEPENDS+=	devel/arm-none-eabi/binutils,arm
RUN_DEPENDS=	devel/arm-none-eabi/binutils,arm
.else
ERRORS+=	"either aarch64 or arm FLAVOR should be set"
.endif

LANGS=		c,c++

CONFIGURE_ENV+=	AR_FOR_TARGET="${INSTALLDIR}/bin/${CONFIG}-ar" \
		RANLIB_FOR_TARGET="${INSTALLDIR}/bin/${CONFIG}-ranlib"
CONFIGURE_ARGS+=--enable-languages=${LANGS} \
		--with-as="${INSTALLDIR}/bin/${CONFIG}-as" \
		--with-ld="${INSTALLDIR}/bin/${CONFIG}-ld" \
		--with-sysroot="${INSTALLDIR}/${CONFIG}" \
		--enable-multilib \
		--enable-interwork \
		--with-gmp=${LOCALBASE} \
		--with-newlib \
		--disable-lto \
		--enable-cpp \
		--disable-plugin \
		--without-isl

# Avoid build failure when lang/gcc/8 is installed whose ansidecl.h misses these
CPPFLAGS +=	-DATTRIBUTE_NONSTRING= -DATTRIBUTE_RESULT_SIZE_1=
CPPFLAGS +=	-DATTRIBUTE_RESULT_SIZE_2= -DATTRIBUTE_RESULT_SIZE_1_2=
CPPFLAGS +=	-DATTRIBUTE_WARN_UNUSED_RESULT=

post-install:
	chown -R ${SHAREOWN}:${SHAREGRP} \
		${PREFIX}/lib/gcc/${CONFIG}/${VERSION}/

.include <bsd.port.mk>
