---
redirect_from:
 - /ru/DpiAware.html
 - /en/PerMonitorDpi.html

title: "ConEmu | High DPI Awareness"

breadcrumbs:
 - url: TableOfContents.html#extras
   title: Extras
---

# High DPI Awareness

This article describes ‘high dpi’, ‘high resulution’, ‘dpi awareness’,
‘per monitor scaling’ and other display resolution issues.

* [Types of High-DPI OS settings](#Types_of_High-DPI_OS_settings)
* [Types of high-dpi awareness](#Types_of_high-dpi_awareness)
  * [DPI-awareness checker](#dpi-awareness-checker)
  * [Not DPI-aware](#Non-dpi-aware)
  * [Per system DPI-aware](#system-dpi-aware)
  * [Per monitor DPI-aware](#per-monitor-dpi-aware)
* [Some more examples](#Some-more-examples)
  * [Dialogs downscale issues](#Dialog-downscale-issue)
  * [Very old build without dpi-awareness causes blurred text](#Very_old_build_without_dpi-awareness_causes_blurred_text)
  * [New dpi-aware build shows clean picture](#New_dpi-aware_build_shows_clean_picture)
* [StackOverflow: No way to scale title bar (non-client area)](http://stackoverflow.com/q/31781767/1405560)


## Types of High-DPI OS settings  {#Types_of_High-DPI_OS_settings}

There are two ways how high-dpi (high resolution) support may work in Windows.

* Windows versions before 10 were able to use only one DPI for all display devices.
  That is unhandy when you have monitors which physical dimensions/DPI differs a lot.
* Windows 8.1 introduces Per-monitor DPI and you are able now
  to [configure them](http://superuser.com/a/954582/139371) separately.
  However, only in Windows 10 implementation becomes rather good.

Also, modern Windows versions do not use ‘DPI’ term.
There is ‘Scaling’ defined in per cents.


## Types of high-dpi awareness  {#Types_of_high-dpi_awareness}

There are three style of DPI support in modern Windows versions.

* [Not DPI-aware](#Non-dpi-aware)
* [Per system DPI-aware](#system-dpi-aware)
* [Per monitor DPI-aware](#per-monitor-aware)

### DPI-awareness checker   {#dpi-awareness-checker}

One of the most common delusions of high-dpi support complains
is comparison of ConEmu, which is [per monitor DPI-aware](#per-monitor-aware),
with some other application, which is **not** per monitor DPI-aware.

The only way to check DPI-awareness is an Windows API function
[GetProcessDpiAwareness](https://msdn.microsoft.com/en-us/library/windows/desktop/dn302113.aspx)
which is available in Windows 8.1 or higher.

You may use small console tool
[CheckDpiAwareness](https://github.com/Maximus5/CheckDpiAwareness).
Its sample output is below.

~~~
Process DPI-Awareness checker. (C) 2014 Maximus5

PID     Awareness       Process name
---     ---------       ------------
3540    !PerMonitor     ApplicationFrameHost  Microsoft Edge
884     !PerMonitor     ConEmu.exe            CheckDpiAwareness.exe - Far 3....
1992    !PerMonitor     explorer.exe          <Shell_TrayWnd>
10820   !PerMonitor     iexplore.exe          ConEmu - Windows Console Emula...
11464   SystemAware     MarkdownPad2.exe      ReadMe.md - MarkdownPad 2
2880    Unaware         odbcad32.exe          ODBC Data Source Administrator...
~~~

At the moment, most of applications will show either ‘SystemAware’ or ‘Unaware’.


### Not DPI-aware   {#Non-dpi-aware}

These old applications do not know anything about monitor dpi and how to deal with high resolution.

Windows tries to make them as accessible as possible, so their windows are shown
larger than their ‘actual’ sizes so they fit your screen more properly and
you may work with them in more comfortable way.

On the other hand that is done by simple upscaling so their client contents
as bitmap which causes blurred image.

Only window title bar and frame are maintained by Windows DWM,
scaled and displayed properly, not blurred.

![Very old calc at 150% and 100% scaling](/img/calc-150-100.png)


### Per system DPI-aware   {#system-dpi-aware}

These applications provide a way better support of high resolution.
And they looks fine if all your monitors have same DPI.
However, when you move them to monitor with different DPI
their contents will be blurred because of upscaling or downscaling.
That is because the application can detect only ‘System DPI’
and do not know anything about [different devices](#per-monitor-aware).


### Per monitor DPI-aware   {#per-monitor-dpi-aware}

These applications look fine on any monitor,
their contents will not be blurred on any DPI.
Unless your system is misconfigured ;-)

However, this type of high-resulution support is most frustrating
for developers, because it's rather incomprehensible what the
application should do with its contents. What is the proper way
to scale its internal objects? Should it maintain physical window
dimensions or number of visible items?

Compare with Windows 10 Explorer.
Press `Win+E` and move the window between monitors with different scaling
by `Win+Shift+Left` and `Win+Shift+Right`.


## Some more examples  {#Some-more-examples}

### Dialogs downscale issues   {#Dialog-downscale-issue}

If your primary monitor has larger scaling percentage
than secondary one, you may notice some dialog drawing artefacts.
ConEmu tries to do its best to deal with monitor scaling levels,
but dialog controls are painted by Windows kernel and without
owner-drawn implementation of all standard controls it's impossible
to make them look fine.

![Dialog downscale issue](/img/dpi-downscaled.png)

### Very old build without dpi-awareness causes blurred text   {#Very_old_build_without_dpi-awareness_causes_blurred_text}

![Very old ConEmu build without dpi-awareness](/img/dpi-old-150.png)

### New dpi-aware build shows clean picture   {#New_dpi-aware_build_shows_clean_picture}

![New dpi-aware ConEmu build](/img/dpi-new-150.png)
