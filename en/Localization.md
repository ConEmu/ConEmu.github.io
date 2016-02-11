---
redirect_from:
 - /ru/Localization.html
 - /en/l10n.html
 - /ru/l10n.html

title: "ConEmu | Localization"

description: "All language resources are located in the file ConEmu.l10n.
  Any help with translation would be appreciated."

breadcrumbs:
 - url: TableOfContents.html#feedback
   title: Feedback

readalso:
 - url: ConEmuHelping.html
   title: "How you may help"
---

# Localization (l10n)

**Work in progress**

If you want to translate ConEmu interface to your language,
your localization efforts would be appreciated.

* [Where language resources are stored](#resources)
* [Resource file format](#format)
* [How to add new language](#new-lang)
* [Resources deprecation](#deprecation)
* [How to test](#test)


## Where language resources are stored  {#resources}

All language resources are located in the file
[/Release/ConEmu/ConEmu.l10n](https://github.com/Maximus5/ConEmu/blob/daily/Release/ConEmu/ConEmu.l10n).
Don't forget to checkout latest **daily** branch if you work with local sources.


## Resource file format  {#format}

The format of the JSON file is simple and was designed to easify patches.
The file consists of several sections: `languages` for list of languages;
`cmdhints`, `mnuhints` and `controls` for resources themselves.

The resource may be either simple "string", or an ["array ", "of ", "strings"]
which are concatenated without changes at run time.

~~~
﻿{
  "languages": [
    {"id": "en", "name": "English" }
  ]
  ,
  "cmnhints": {
    "bResetSettings": {
      "en": "Reset all settings to defaults",
      "id": 1595 }
    ,
    "cbAnsiLog": {
      "en": [ "Log console output to text files\r\n"
            , "ConEmu-YYYY-MM-DD-pNNNN.log\r\n" ],
      "id": 2679 }
  }
}
~~~


## How to add new language  {#new-lang}

1. Add to the `languages` new record. Example below adds Russian with id `ru`.
2. Translate all entries by adding `ru` record to each resource.

~~~
--- a/Release/ConEmu/ConEmu.l10n
+++ b/Release/ConEmu/ConEmu.l10n
@@ -1,5 +1,7 @@
 ﻿{
   "languages": [
     {"id": "en", "name": "English" }
+    ,
+    {"id": "ru", "name": "Русский" }
   ]
   ,
@@ -842,6 +848,7 @@
     ,
     "tFontFace": {
       "en": "Face name for main font",
+      "ru": "Имя основного шрифта консоли",
       "id": 1511 }
     ,
     "tFontFace2": {
~~~


## Resources deprecation  {#deprecation}

If the `en` resource is changed, other languages translations become deprecated.
To depict that, language id-s for this resource would be prefixed with `_`
(`ru` -> `_ru`).
So, translation maintainers may easily find changed resources.

~~~
﻿{
    "bResetSettings": {
      "en": "Reset all settings to defaults",
      "_ru": "Сбросить настройки к умолчаниям",
      "id": 1595 }
}
~~~


## How to test  {#test}

The work is still in progress...
At the moment only hints and Settings dialog controls are processed by l10n engine.

To check the translation, download
[this test version](https://www.dropbox.com/s/px7jysz0aln0ajt/ConEmu.160207a.exe.7z?dl=0),
and unpack it to main distro.

You may place file `ConEmu.l10n` into `%ConEmuBaseDir%`
and run `ConEmu.exe` with your language code.

~~~
ConEmu.exe -lng "ru"
~~~

Alternatively, you may specify the location of the file with `-lngfile` argument.

~~~
ConEmu.exe -lng "ru" -lngfile "full-path-to-l10n"
~~~

Also, the button `Reload...` in the Settings dialog would reload language data too,
and resources will be applied to dialog controls when you open the dialog next time.
