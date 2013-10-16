# infinality-bundle for Slackware(R) Linux(R)

These are SlackBuilds+patches to rebuild some official
packages in Slackware(R) Linux(R), are in test so be
careful with the result in your system.

## Infinality-bundle project

"infinality-bundle is a collection of software utilizing the power of font
rendering offered by infinality patches and fontconfig rules known as
fontconfig-infinality-ultimate."              - from http://bohoomil.cu.cc

Source code: https://github.com/bohoomil/fontconfig-ultimate

## Freetype patches

Location: source/l/freetype/infinality-bundle
Origin: https://github.com/bohoomil/fontconfig-ultimate/tree/pkgbuild/01_freetype2-iu-2.5.0.1-7

## Fontconfig patches
Location: source/x/fontconfig/infinality-bundle
Origin: https://github.com/bohoomil/fontconfig-ultimate

## Cairo patches

Location: source/l/cairo/infinality-bundle
Origin: https://github.com/bohoomil/fontconfig-ultimate/tree/pkgbuild/03_cairo-iu-1.12.16-3

## Notes

*  At this moment these SlackBuilds are from and for Slackware(R) Linux(R) -current (14.1)
*  The order to build and install is freetype, fontconfig and cairo.
*  There's no need to select a type of font rendering (Windows, Apple or Ubuntu)
   since the "the aim of infinality-bundle is to make use of the vast potential hidden
   in native Linux font rendering back-end". This does not means you can not
   configure some aspects of the font rendering, please check:
   http://bohoomil.cu.cc/#anchor-6 and `/usr/doc/fontconfig-2.10.93/fontconfig-infinality-ultimate-git`
*  `bob-sources.sh` is an script to mirror the official SlackBuilds, so you do not
   may use it, at least you are trying to test some new official Slackbuilds ;)
*  Check the next screenshots to see the result:
   https://www.dropbox.com/s/xiyeyvs457nb1um/slackware-14.1-default-font.png,
   https://www.dropbox.com/s/awqgc8wg3djviqe/slackware-14.1-patched-font.png

Antonio Hernández Blas <hba.nihilismus@gmail.com>
