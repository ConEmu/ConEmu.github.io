---
redirect_from:
 - /ru/Localization.html
 - /en/l10n.html
 - /ru/l10n.html

title: "ConEmu | Localization"

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

Look at the excerpt below.

~~~JSON
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

~~~diff
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


## Deprecation  {#deprecation}

If the `en` resource is changed, other languages translations becomes deprecated.
To depict that, language id-s for this resource would be prefixed with `_`
(`ru` -> `_ru`).
So, translation maintainers may easily find changed resources.

~~~JSON
﻿{
    "bResetSettings": {
      "en": "Reset all settings to defaults",
      "_ru": "Сбросить настройки к умолчаниям",
      "id": 1595 }
}
~~~
