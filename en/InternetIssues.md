---
redirect_from:
 - /ru/InternetIssues.html

title: ConEmu | Troubleshoot internet issues

breadcrumbs:
 - url: TableOfContents.html#conemu
   title: ConEmu
 - url: Installation.html
   title: Installation

readalso:
 - url: SettingsUpdate.html
   title: "Settings › Update page"
 - url: UpdateModes.html
   title: "Automatic update modes"
 - url: AutoInstall.html
   title: "Automate your box installation"
---

# Troubleshoot internet issues

Read this page if ConEmu internal [automatic update](UpdateModes.html#automatic)
fails to download current version information or distribution packages
most probably there are issues with your Internet Explorer, because ConEmu
utilizes standard Windows API from wininet.

Possible ways to solve the problem are described below.

* [Change version.ini location](#auto-location)
* [Update Internet Explorer](#auto-ie)
* [Enable TLS 1.x in the internet options](#enable-tls)
* [Change internal downloader switches](#auto-commandline)
* [Use any third-party downloader tool](#auto-curl-wget)





#### Change version.ini location   {#auto-location}

At the moment there are several maintained locations of `version.ini`:

* [https://conemu.github.io/version.ini](https://conemu.github.io/version.ini) (primary)
* [https://sourceforge.net/projects/conemu/files/AutoUpdate/version.ini/download](https://sourceforge.net/projects/conemu/files/AutoUpdate/version.ini/download)
* [http://conemu.ru/version.ini](http://conemu.ru/version.ini) (unsecure http only)

If your provider/proxy/router blocks, for example, an access to default
[https://conemu.github.io/version.ini](https://conemu.github.io/version.ini)
you may try other locations from the list.

If all these locations are inaccessible from any browser on users PC,
there are no options. User have to contact their network
administrators for assistance.

Otherwise please open [Settings/Update](SettingsUpdate.html) and paste
into the ‘ConEmu latest version location info’ working URL.
Don't forget to save the settings.




#### Update Internet Explorer   {#auto-ie}

Try to open [https://conemu.github.io/](https://conemu.github.io/)
in the **Internet Explorer** (not in your default browser).
If it can't open the site, try to update your Internet Explorer.

There were reports that after updating from 8.0 to 11.0 the problem
with https access were solved.




#### Enable TLS 1.x in the internet options   {#enable-tls}

Information from the [issue 1568](https://github.com/Maximus5/ConEmu/issues/1568).

If you have trouble with built-in update not working (especially with Windows 7),
please make sure you have TLS1.1 (and/or) TLS1.2 checked under ‘Internet Options > Advanced’.
It might not be enabled by default.

Also the article from support.microsoft.com may help:
[Update to enable TLS 1.1 and TLS 1.2 as a default secure protocols in WinHTTP in Windows](https://support.microsoft.com/en-us/help/3140245/update-to-enable-tls-1-1-and-tls-1-2-as-a-default-secure-protocols-in).




#### Change internal downloader switches   {#auto-commandline}

To check internet issues from command line, run the following command.

~~~
ConEmuC.exe -download http://conemu.github.io/version.ini -
~~~

Actually, `-download` command has a lot of options like proxy settings,
timeouts, agent name and others.
They are described in `ConEmuC -?` printout, [About dialog](AboutDialog.html)
and [online](ConEmuC.html#Download).
You may play with them and if some option helps, change them in the
[Settings dialog](SettingsUpdate.html) or [let us know](Issues.html).




#### Use any third-party downloader tool   {#auto-curl-wget}

Most known utilities available are ‘Curl’ and ‘Wget’.
Just install them and switch to `External downloader`
on the [Update settings page](SettingsUpdate.html).
Sample commands lines are below, choose appropriate
and tune their options if required.

~~~
wget.exe %1 -O %2
curl.exe -L %1 -o %2
~~~
