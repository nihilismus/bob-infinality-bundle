# bob-infinality-bundle

These are SlackBuilds+patches to rebuild some official
packages in Slackware Linux, are in test so be
careful with the result in your system.

## Infinality-bundle project

*"infinality-bundle is a collection of software utilizing the power of font
rendering offered by infinality patches and fontconfig rules known as
fontconfig-infinality-ultimate."*

*  Project: https://wiki.archlinux.org/index.php/Infinality-bundle%2Bfonts
*  Source code: https://github.com/bohoomil/fontconfig-ultimate

## Using

1.  Clone this repository
  ```
  root@darkstar:~:/tmp# git clone https://github.com/nihilismus/bob-infinality-bundle
  ```

2.  Download the sources using `bob-sources.sh`.

3. Build and install the packages using `install.sh`.

## Notes

*  At this moment these SlackBuilds are from and for Slackware Linux 14.1
*  I tried to make the minimal modificactions to the originals Slackbuilds.
*  There is not need to select a type of font rendering (Windows, Apple or Ubuntu)
   since the *"aim of infinality-bundle is to make use of the vast potential hidden
   in native Linux font rendering back-end"*. This does not mean you can not
   configure some aspects of the font rendering, please check:
   *  `/etc/profile.d/infinality-settings.sh`
   *  `/usr/doc/fontconfig-2.10.93/fontconfig-infinality-ultimate`
*  You can see the differences between the default font rendering and the patched one:
   *  Default: https://www.dropbox.com/s/xiyeyvs457nb1um/slackware-14.1-default-font.png
   *  Patched: https://www.dropbox.com/s/awqgc8wg3djviqe/slackware-14.1-patched-font.png
*  Backup /etc/fonts/ before you install fontconfig and remove any personal configuration
   (~/.fonts.conf, ~/.fonts.conf.d or ~/.config/fontconfig) to avoid any issue.

## Freetype patches

*  Location: source/l/freetype/infinality-bundle
*  Origin: https://github.com/bohoomil/fontconfig-ultimate/tree/pkgbuild/01_freetype2-iu-2.5.0.1-8

## Fontconfig patches

*  Location: source/x/fontconfig/infinality-bundle
*  Origin: https://github.com/bohoomil/fontconfig-ultimate/tree/infinality-bundle/infinality-bundle-src/2.10.93-2.5.0.1

## Cairo patches

*  Location: source/l/cairo/infinality-bundle
*  Origin: https://github.com/bohoomil/fontconfig-ultimate/tree/pkgbuild/03_cairo-iu-1.12.16-3
