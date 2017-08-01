@echo off
cd /d "%~dp0"
powershell -noprofile -command "%~dp0Maintain.ps1" sitemap %*
cd ..
rem call git add sitemap.xml
rem call git commit -m "Update sitemap.xml"
rem call git push origin
