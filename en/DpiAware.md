---
redirect_from:
 - /ru/DpiAware.html
 - /en/PerMonitorDpi.html

title: "ConEmu | High DPI Awareness"
---

# High DPI Awareness

<h2 id="Types_of_High-DPI_OS_settings"> Types of High-DPI OS settings </h2>

There are two ways how high-dpi support may work in Windows.


<h2 id="Types_of_high-dpi_awareness"> Types of high-dpi awareness </h2>

There are three style of DPI support in modern Windows versions.


<h2 id="Non-dpi-aware"> Non-dpi-aware </h2>

These old applications do not know anything about monitor dpi and how to deal with high resolution.

Windows tries to make them as accessible as possible so their windows are shown
larger than their ‘actual’ sizes so they fit your screen more properly.

On the other hand that is done by simple upscaling so their client contents
as bitmap which causes blurred image.


<h3 id="Very_old_build_without_dpi-awareness_causes_blurred_text"> Very old build without dpi-awareness causes blurred text </h3>

![Very old ConEmu build without dpi-awareness](/img/dpi-old-150.png)

<h3 id="New_dpi-aware_build_shows_clean_picture"> New dpi-aware build shows clean picture </h3>

![New dpi-aware ConEmu build](/img/dpi-new-150.png)
