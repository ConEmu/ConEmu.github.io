---
redirect_from:
 - /ru/CygwinHome.html

title: "ConEmu | Cygwin and Windows profile"

description: "How to link cygwin profile to the Windows user's home directory."

breadcrumbs:
 - url: TableOfContents.html#cygwin-and-msys
   title: Cygwin and Msys

readalso:
 - url: CygwinMsysConnector.html
   title: "cygwin/msys connector"
 - url: CygwinMsys.html
   title: "Cygwin and MSYS"
 - url: CygwinStartDir.html#cygdrive
   title: "Get rid of /cygdrive"
---

# Point cygwin/msys ${HOME} to Windows' profile

By default cygwin and msys installations set `${HOME}`
to their subfolders, for example, if cygwin was installed
into `C:\cygwin64`, than your `${HOME}` would be something
like `C:\cygwin64\home\user-name`.

But how to link cygwin/msys profile into your Windows
user's home directory?

Look into `/etc` folder, the file `nsswitch.conf` must be there.
It contains line with `db_home`, which differs from installation
to installation. Few examples below:

~~~
db_home: cygwin desc
db_home: /home/%U
~~~

Try to change `db_home` by inserting `windows`, or `env`,
or even full path to your Windows' profile. Examples:

~~~
db_home: windows cygwin desc
db_home: env windows /C/your-dot-files
~~~

{% include in_article.html %}
