---
redirect_from:
 - /ru/DragDrop.html

title: "ConEmu | Drag & Drop"
---

# Shell style drag & drop

ConEmu-Maximus5 supports ‘drag & drop’ of files and folders
between ConEmu and other applications supporting this feature.

If you use [Far Manager](FarManager.html) you will be able to
drag files and folders from Far's panels outside and drop them
into panels. Modificators `Ctrl`, `Shift` and `Alt` forces
‘Copy’, ‘Move’ and ‘Link’ actions respectively.

When you use other shells (‘cmd’, ‘bash’, ‘powershell’ ...)
ConEmu will support only ‘drop’.
So, when you drop files or folders, they paths will be just
pasted into console as simple text.


## Some hints

Due to some reason (a bugs or bitness incompatibility)
some applications may fail to accept dropped files.

Last seen problem was related to PngOptimizer.
This application uses `DragQueryFileW` function
which utilizes CF_HDROP data format.
It's unclear why, but when bitnesses of application
do not match, the function `DragQueryFileW` fails
to retrieve the count of dragged files.
