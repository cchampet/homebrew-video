require "formula"

class Bmx < Formula
  homepage "http://sourceforge.net/p/bmxlib/home/Home/"
  url "git://git.code.sf.net/p/bmxlib/bmx", :tag => "v0.1.2"

  depends_on "automake" => :build
  depends_on "autoconf" => :build
  depends_on "pkg-config" => :build
  depends_on "libtool" => :build
  depends_on "uriparser"
  depends_on "libmxf"
  depends_on "libmxfpp"

  def patches
    # #1 Fix order in autogen.sh
    # #2 For automake >= 1.12
    DATA
  end

  def install
    system "echo '#define BMX_SCM_VERSION \"v#{version}\"' > bmx_scm_version.h"
    system "./autogen.sh"
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make"
    system "make install"
  end
end

__END__
diff --git a/autogen.sh b/autogen.sh
index 37cf746..727cd50 100755
--- a/autogen.sh
+++ b/autogen.sh
@@ -12,8 +12,8 @@ fi


 set -x
-aclocal
 $lt
+aclocal
 autoheader -f
 automake --foreign --add-missing -c
 autoconf
diff --git a/configure.ac b/configure.ac
index 4a44efb..6553ff2 100644
--- a/configure.ac
+++ b/configure.ac
@@ -28,6 +28,8 @@ AC_CONFIG_MACRO_DIR([m4])
 AM_INIT_AUTOMAKE([-Wall -Werror])
 m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])

+# For automake >= 1.12
+m4_ifdef([AM_PROG_AR], [AM_PROG_AR])

 dnl-----------------------------------------------------------------------------
 dnl -- Version
