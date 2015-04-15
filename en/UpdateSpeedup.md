---
redirect_from: /ru/UpdateSpeedup.html

title: ConEmu | Speedup update with installer

description: How to speedup update procedure if you are using the installer

breadcrumbs:
 - url: TableOfContents.html#conemu
   title: ConEmu
 - url: Installation.html
   title: Installation

readalso:
 - url: SettingsUpdate.html
   title: "Settings › Update page"
 - url: VersionComparison.html
   title: "Comparison: distros, bitness, stages"
 - url: Installation.html
   title: "Installation"
 - url: AutoInstall.html
   title: "Automate your box installation"
---

# Speedup update with installer

If you've installed ConEmu with [installer](VersionComparison.html#installer) `ConEmuSetup.*.exe`
automatic [updates](SettingsUpdate.html) will be processed with installer too.

ConEmu installers are x86 and x64 msi-packets packaged into one executable file `ConEmuSetup.*.exe`.

When you update or change ConEmu installation Windows will create new ‘Restore point’.
The creation of ‘Restore point’ may last few minutes depending of you computer configuration.

These ‘Restore points’ may be very useful if something bad happens with your installed software,
you will be able to rollback to selected ‘Restore point’ to heal you PC.

But if you are sure that you don't need ‘Restore points’ you may disable their creation.


## Disable creation of ‘Restore points’ while updating ConEmu

* Open Settings page [Update](SettingsUpdate.html);
* Ensure that checkbox ‘Installer’ is checked;
* Change contents of the edit field under ‘Installer’ checkbox
  from `"%1" /p:%3 /qr` to `"%1" /p:%3,adm /qn`.

Switch `/qn` tells `msiexec` to show no installer interface at all.
Side effect of this will be disabling ‘Restore points’ creation.

Note that `,adm` suffix is required because when no installer interface
is shown, no UAC confirmation dialog will be shown too, and if `msiexec`
is not started as administrator, update procedure will fail with code `1603`.
