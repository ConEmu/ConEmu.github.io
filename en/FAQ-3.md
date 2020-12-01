---
title: ConEmu | FAQ - Part 3

description: Frequenly asked user questions about ConEmu usage

breadcrumbs:
 - url: TableOfContents.html#conemu
   title: ConEmu

otherlang:
   en: /en/FAQ-3.html
   ru: /ru/FAQ-3.html

readalso:
 - url: ConEmuXml.html
   title: "ConEmu: xml or registry settings storage"
---

# Portable version  {#q-3-portable}

{% include faq_disclaimer_en.md %}

* [Q. Can ConEmu be portable?](#q-3-1)
* [Q. When attempting to use `ConEmu.xml`, the error message ‘XML setting file can not be used!’ appears](#q-3-2)
* [Q. Can ConEmu make launched applications portable?](#q-3-3)



#### Q. Can ConEmu be portable?   {#q-3-1}

**A.** Yes. To enable portable configuration, it is enough to create an
*empty* file ‘ConEmu.xml’ in the same directory as ConEmuC.exe or
ConEmu.exe. The file may be created after ConEmu is loaded, which
allows copying settings loaded from the registry to the XML file.
[More about xml storage...](ConEmuXml.html)




#### Q. When attempting to use ‘ConEmu.xml’, the error message ‘XML setting file can not be used!’ appears   {#q-3-2}

**A.** The error message explains itself: the interface
IID_IXMLDOMDocument is not registered in the system registry. To
avoid registering it, you can copy the files ‘msxml3.dll’ and
‘msxml3r.dll’ in the same directory as ConEmuC.exe or ConEmu.exe.
The versions from Windows XP are preferred - they have the least
dependencies, which allows them to work in Windows 2000.




#### Q. Can ConEmu make launched applications portable?   {#q-3-3}

**A.** No. Such functional is not planned to implement at the moment.
