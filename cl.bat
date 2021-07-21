@echo off

::
:: Set up and wrap the MSVC developer environment to allow the compiler to be called from anywhere.
::
:: TODO: automate the discovery of vcvarsall.bat - harder that you'd think:
::            https://gist.github.com/andrewrk/ffb272748448174e6cdb4958dae9f3d8
::

if not defined __msvc_init (
    set __msvc_init=true
    call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat" x86_amd64
)

cl.exe %*