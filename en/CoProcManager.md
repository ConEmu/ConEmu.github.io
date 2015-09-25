---
redirect_from:
 - /ru/CoProcManager.html

title: "ConEmu | NVIDIA related crash"

breadcrumbs:
 - url: TableOfContents.html#feedback
   title: Feedback
---

# NVIDIA CoProcManager

After changing hooking technique to
[minhook in build 150814](http://conemu.github.io/blog/2015/08/14/Build-150814.html)
some users reported crashes of every console application exit.

The crash were triggered by NVIDIA CoProcManager files (stack overflow).
These files are located in `Program Files` and `Program Files (x86)`.

```
NVIDIA Corporation\coprocmanager\
  detoured.dll
  nvd3d9wrapx.dll
  nvdxgiwrapx.dll
```

* [gh#272: Crash on console applications exit](https://github.com/Maximus5/ConEmu/issues/272)

However, I'm failed to reproduce this problem on any PC,
because these files are installed on certain graphic cards only.

I even can't report the problem to NVIDIA because I don't own any of these cards.

Temporary workaround introduced in
[build 150910](http://conemu.github.io/blog/2015/09/10/Build-150910.html)
was not perfect. And it raised other problems...

* [gh#323: Broken output while using redirection](https://github.com/Maximus5/ConEmu/issues/323)

I do not see any sense in NVIDIA hooks injected into console applications.
As far as I can understand, their purpose is to fix some graphic issues,
but console applications do not use opengl/directx and others techniques in general.

Another possible workaround is to rename/remove `coprocmanager` folders,
but this may impact on your games or applications utilizing opengl/directx.
However, you may try it...

Anyway, I doubt that it's ConEmu bug, but everything is possible
because I can't check the problem on my side.
