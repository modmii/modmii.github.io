
if exist "temp\__channel" rd /s /q "temp\__channel"> nul

Set WADtit=
Set TitID=
Set iosversion=
Set iosversionfull=
Set iosslot=
Set iostype=
Set WadStub=
Set WadBaseIOS=
Set cIOSinfo=
Set channelpath=
Set TitIDhex=
Set WADregion=
Set WadBlocks=
set GetFileSize=
Set GetFileSizeMB=
Set WadContents=0
set cIOSChecks=
Set SigningStatus=
Set WadKorKey=
Set AccessRightsHex=
Set AccessRightsBin=
Set ahbprot=
Set DVDvid=
Set WadNL=
Set WadBannerless=
Set WADdeflicker=
Set N64ExpPatch=
set ESmodule=
set ESpatches=
set FSpatch=
set ESpatch=
set NPpatch=
set VPpatch=

%WiiPy% info "%WadInput%">temp\WADinfo.txt

::check if file is empty, if empty it means WiiPy errored; likely with "This is not a valid WAD file!"
>nul findstr "^" "temp\WADinfo.txt" || set wadtype=Invalid
If /i "%wadtype%" EQU "Invalid" goto:fin2

::below fixes output that has 00 bytes (or 10 bytes) for IOSs - should no longer be necessary
::support\sfk replace "temp\WADinfo.txt" -binary /00/20/ -binary /10/20/ -yes>nul

::get Title: WADtit
support\sfk filter -quiet temp\WADinfo.txt -ls+"  Channel Name: " -rep _"  Channel Name: "__ >temp\WADinfo2.txt
set /p WADtit= <temp\WADinfo2.txt
::if not "%WADtit%"=="" echo Title: %WADtit%

::Full Title ID
support\sfk filter -quiet temp\WADinfo.txt -ls+"  Title ID: " -rep _"  Title ID: "__ -rep _" *"__ >temp\WADinfo2.txt
set /p TitIDhex= <temp\WADinfo2.txt
set channelpath=%TitIDhex:~0,8%
set TitIDhex=%TitIDhex:~8,8%

::Get channelpath. hidden channels will have 00010008 in tmd at offset 0x18C (len 4), or offset at 0xE8C of wad (offset is 0xD00 or 3328 greater in WAD than tmd)
::support\sfk hexdump -pure -nofile -offlen 0xE8C 0x04 "%WadInput%">temp\hexdump.txt
::set /p channelpath= <temp\hexdump.txt

::"Essential System Titles"
set wadtype=Invalid
If /i "%channelpath%" EQU "00000001" set wadtype=system
::00010000 is actually "Disc-based games" but labelled channelsystem so it gets treated the same as 00010002 titles, shouldn't apply anyway
If /i "%channelpath%" EQU "00010000" set wadtype=channelsystem
::"Downloadable channels"
If /i "%channelpath%" EQU "00010001" set wadtype=channel
If /i "%channelpath%" EQU "00010002" set wadtype=channelsystem
::00010004 is actually "Game channels and games that use them" but labelled channelsystem so it gets treated the same as 00010002 titles
If /i "%channelpath%" EQU "00010004" set wadtype=channelsystem
If /i "%channelpath%" EQU "00010005" set wadtype=DLC
If /i "%channelpath%" EQU "00010008" set wadtype=hidden
::00010003, 00010006 & 00010007 are actually "Unconfirmed" but labelled channelsystem so it gets treated the same as 00010002 titles, shouldn't apply anyway
If /i "%channelpath%" EQU "00010003" set wadtype=channelsystem
If /i "%channelpath%" EQU "00010006" set wadtype=channelsystem
If /i "%channelpath%" EQU "00010007" set wadtype=channelsystem


::simple bannerless check, detect minimalist banner in channels if 00000000.app is 64bytes exactly
If /i "%wadtype:~0,7%" EQU "channel" goto:doit
If /i "%wadtype%" NEQ "hidden" goto:skip
:doit
::get banner bytes
support\sfk filter temp\WADinfo.txt -nocheck -inc "Content Index: 0" to "Content Hash" -and+"Content Size: " -rep _*": "__ -rep _" "*__>"temp\WADinfo2.txt"
set /p WadBannerless= <temp\WADinfo2.txt
if %WadBannerless% LEQ 64 (set "WadBannerless= [Minimalist Banner]") & (goto:skip)
set WadBannerless=
If /i "%wadtype:~0,7%" EQU "channel" goto:skip
set "WadBannerless= [Full Banner]"
:skip


::check if fakesigned (SigningStatus)
support\sfk filter temp\WADinfo.txt -nocheck -inc "WAD Info" to "Signing Status:" -and+"Signing Status: " -rep _*": "__>"temp\WADinfo2.txt"
set /p SigningStatus= <temp\WADinfo2.txt

::if not "%SigningStatus%"=="" echo Signing Status: %SigningStatus%

If /i "%SigningStatus%" EQU "Fakesigned" (set cIOSChecks=Y) & (goto:skipdeepcheck)
If /i "%SigningStatus%" EQU "Legitimate (Unmodified TMD + Ticket)" (set cIOSChecks=) & (goto:skipdeepcheck)

::conduct cIOSchecks even if poorly fakesigned; i.e. if all 00's in tmd at offset 0x04 (len 256 or 0x100), or offset 0xD04 of wad (offset is 0xD00 or 3328 greater in WAD than tmd)
if exist temp\hexdump.txt del temp\hexdump.txt>nul
support\sfk hexdump -pure -nofile -offlen 0xD04 0x100 "%WadInput%">temp\hexdump.txt
::if all 0's, this will make it empty
support\sfk filter -quiet temp\hexdump.txt -rep _0__ -write -yes
support\sfk filter -quiet temp\hexdump.txt -no-empty-lines -no-blank-lines -write -yes
::check if file is empty, if empty it means it's fakesigned
>nul findstr "^" "temp\hexdump.txt" || set cIOSChecks=Y

::DISABLED deepcheck since now using WiiPy to do it
goto:skipdeepcheck
If /i "%cIOSChecks%" NEQ "Y" goto:skipdeepcheck
if not exist "%homedrive%\Windows\System32\certutil.exe" goto:skipdeepcheck
::conduct checks even if poorly fakesigned
set cIOSChecks=Y
set TMDlen=
set TMDend=
set SHA1=
::to check if truly fakesigned, need to get sha1 hash of tmd body (and technically ticket body too) and confirming they start with 00. For both the TMD and Ticket, the body is all of the data starting at offset 0x140 until the end (so you discard the first 320 bytes). To avoid unpacking though need to get tmd size
::TMD size is at offset 0x14 of wad (len 0x04)

if exist temp\hexdump.txt del temp\hexdump.txt>nul
support\sfk hexdump -pure -nofile -offlen 0x14 0x04 "%WadInput%">temp\hexdump.txt
set /p TMDlen= <temp\hexdump.txt
::add 0xD00 to get TMD end position in WAD
support\sfk calc -hex 0x%TMDlen%+0xD00>temp\hexdump.txt
set /p TMDend= <temp\hexdump.txt

::extract tmd body from WAD, starting at 0xE40 of WAD and ending at %TMDend%
if exist "temp\body.tmd" del "temp\body.tmd">nul
support\sfk partcopy "%WadInput%" -fromto 0xE40 %TMDend% "temp\body.tmd" -yes >nul

::calculate sha1 of "temp\body.tmd" to confirm it begins with 00
certutil -hashfile "temp\body.tmd" SHA1>temp\hexdump.txt
support\sfk filter -quiet temp\hexdump.txt -!"temp\body.tmd" -!"CertUtil" -write -yes
set /p SHA1= <temp\hexdump.txt
If /i "%SHA1:~0,2%" EQU "00" (set SigningStatus=Fakesigned) else (set SigningStatus=Not-Fakesigned)

::if not "%SigningStatus%"=="" echo Signing Status: %SigningStatus%
::echo cIOSChecks: %cIOSChecks%
:skipdeepcheck


::module count
support\sfk filter -quiet temp\WADinfo.txt -ls+"  Total Contents: " -rep _"  Total Contents: "__ -rep _" *"__ >temp\WADinfo2.txt
set /p WadContents= <temp\WADinfo2.txt

::::module count (in hex) in tmd at offset 0x1DE (len 2), or offset 0xEDE of wad (offset is 0xD00 or 3328 greater in WAD than tmd)
::if exist temp\hexdump.txt del temp\hexdump.txt>nul
::support\sfk hexdump -pure -nofile -offlen 0xEDE 0x02 "%WadInput%">temp\hexdump.txt
::set /p WadContents= <temp\hexdump.txt
::support\sfk dec %WadContents%>temp\hexdump.txt
::set /p WadContents= <temp\hexdump.txt
::set WadContents=%WadContents:~0,-1%
::::if not "%WadContents%"=="" echo Content Files: %WadContents%


::Title ID
support\sfk filter -quiet temp\WADinfo.txt -ls+"  Title ID: " -rep _"*("__ -rep _")*"__ -rep _" "__ >temp\WADinfo2.txt
set /p TitID= <temp\WADinfo2.txt
If /i "%TitID:~3,1%" EQU "" set TitID=
If /i "%TitID:~4,1%" NEQ "" set TitID=
::if not "%TitID%"=="" support\sfk echo Title ID: "%TitID%"

::::Title ID will be at tmd offset 0x190, 0xE90 of wad (len 4)
::if exist temp\hexdump.txt del temp\hexdump.txt>nul
::support\sfk hexdump -pure -nofile -offlen 0xE90 0x04 "%WadInput%">temp\hexdump.txt
::set /p TitIDhex= <temp\hexdump.txt
::::convert hex to ascii
::support\sfk num -hex %TitIDhex%>temp\hexdump.txt
::support\sfk filter -quiet temp\hexdump.txt -rep _"*>"__ -rep _"<*"__ -write -yes
::set /p TitID= <temp\hexdump.txt
::::IOS60 includes a "<" sign and is being stripped to become ... instead of .... ; correct it below 
::If /i "%TitID:~3,1%" EQU "" set TitID=
::If /i "%TitID:~0,3%" EQU "..." set TitID=

::echo Full Title ID: %channelpath%-%TitIDhex%


::Required IOS
::  Required IOS: IOS37 (0000000100000025)
support\sfk filter -quiet temp\WADinfo.txt -ls+"  Required IOS: " -rep _"*IOS"__ -rep _": N/A"__ -rep _" "*__>temp\WADinfo2.txt
set /p iosslot= <temp\WADinfo2.txt
if "%iosslot%"=="" (set wadtype=ios) & (set TitID=)

::if not "%iosslot%"=="" echo Required IOS: %iosslot%


::::Required IOS will be at tmd offset 0x18B, 0xE8B of wad (len 1), titles will list the required IOS slot # (00 for IOS wads)
::if exist temp\hexdump.txt del temp\hexdump.txt>nul
::support\sfk hexdump -pure -nofile -offlen 0xE8B 0x01 "%WadInput%">temp\hexdump.txt
::set /p iosslot= <temp\hexdump.txt
::support\sfk dec %iosslot%>temp\hexdump.txt
::set /p iosslot= <temp\hexdump.txt
::set iosslot=%iosslot:~0,-1%
::If /i "%iosslot%" EQU "0" (set wadtype=ios) & (set TitID=)
::If /i "%iosslot%" EQU "00" (set wadtype=ios) & (set TitID=)


::collect info for channels and hidden channels

If /i "%wadtype%" EQU "channel" goto:doit
If /i "%wadtype%" EQU "channelsystem" goto:doit
If /i "%wadtype%" EQU "hidden" goto:doit
::If /i "%wadtype%" EQU "DLC" goto:doit
goto:skip
:doit
if exist temp\hexdump.txt del temp\hexdump.txt>nul
support\sfk hexdump -pure -nofile -offlen 0xEDB 0x01 "%WadInput%">temp\hexdump.txt
set /p AccessRightsHex= <temp\hexdump.txt

If /i "%AccessRightsHex%" EQU "00" (set AccessRightsBin=00000000) & (set ahbprot=Disabled) & (set DVDvid=Disabled) & (goto:skip)

::bitwise stuff
::7 6 5 4 3 2 1 0 - bits
::if position 0 = 1 then AHB Access is enabled
::if position 1 = 1 then DVD Access is enabled
::other position impacts unknown
support\sfk num -single 0x%AccessRightsHex%>temp\hexdump.txt
support\sfk filter -quiet temp\hexdump.txt -rep _" >*"__ -rep _"* "__ -write -yes
set /p AccessRightsBin= <temp\hexdump.txt
set AccessRightsBin=%AccessRightsBin:~-8%
::echo AccessRightsBin: "%AccessRightsBin%"
If /i "%AccessRightsBin:~-1%" EQU "1" (set ahbprot=Enabled) else (set ahbprot=Disabled)
::echo AHB Access: %ahbprot%
If /i "%AccessRightsBin:~-2,1%" EQU "1" (set DVDvid=Enabled) else (set DVDvid=Disabled)
::echo DVD Video Access: %DVDvid%
:skip


::get WAD size in bytes, megabytes and blocks
support\sfk filter -quiet temp\WADinfo.txt -ls+"  Installed Size: " -rep _*": "__>temp\WADinfo2.txt
set /p WadBlocks= <temp\WADinfo2.txt

support\sfk filter -quiet temp\WADinfo.txt -ls+"  Installed Size (MB): " -rep _*": "__>temp\WADinfo2.txt
set /p GetFileSizeMB= <temp\WADinfo2.txt

support\sfk stat "%WadInput%">"temp\tmp.txt"
support\sfk filter "temp\tmp.txt" -rep _" bytes*"__ -rep _"* "__ >temp\hexdump.txt
set /p GetFileSize= <temp\hexdump.txt

::support\sfk calc "%GetFileSize%/1048576" -dig=2 >temp\hexdump.txt
::set /p GetFileSizeMB= <temp\hexdump.txt

::support\sfk calc %GetFileSize%/131072 -dig=0 >temp\hexdump.txt
::set /p WadBlocks= <temp\hexdump.txt




::---check Deflicker if setting enabled, but only for certain types of channels---
If /i "%AutoDetectDF%" NEQ "Y" goto:skip
::if content count is LEQ 3 then skip (so forwarder channels aren't attempted)
if %WadContents% LEQ 3 goto:skip
If /i "%channelpath%" EQU "00010001" goto:doCheck
If /i "%channelpath%" EQU "00010002" goto:doCheck
If /i "%channelpath%" EQU "00010008" goto:doCheck
If /i "%channelpath%" NEQ "00010004" goto:skip
:doCheck

::unpack WAD to temp dir
if exist "temp\__channel" rd /s /q "temp\__channel"> nul
mkdir "temp\__channel"
Support\wiipy\wiipy.exe wad unpack --skip-hash "%WadInput%" "temp\__channel">nul
if not exist "temp\__channel\00000001.app" goto:skip
set "ImageDol=temp\__channel\00000001.app"
set str1=5439800000508BC00E99498000500CC00E906980009949800090E98000994980009109800041820040
set str2=5439800000508BC00E99498000500CC00E906980009949800090E98000994980009109800048000040
support\sfk hexfind "%ImageDol%" -binary /%str2%/ >nul
::ERRORLEVEL 1 means found, 0 means not found
IF ERRORLEVEL 1 set WADdeflicker=Disabled
support\sfk hexfind "%ImageDol%" -binary /%str1%/ >nul
IF ERRORLEVEL 1 set WADdeflicker=Enabled

::N64ExpPatch
If /i "%TitID:~0,1%" NEQ "N" goto:NoExpPak
if "%TitID:~3%"=="" goto:NoExpPak
if not "%TitID:~4%"=="" goto:NoExpPak
set "N64ExpPatch=N/A"
set str3=418200083C800080
set str4=600000003C800080
support\sfk hexfind "%ImageDol%" -binary /%str4%/ >nul
::ERRORLEVEL 1 means found, 0 means not found
IF ERRORLEVEL 1 set N64ExpPatch=Enabled
support\sfk hexfind "%ImageDol%" -binary /%str3%/ >nul
IF ERRORLEVEL 1 set N64ExpPatch=Disabled
:NoExpPak

if not "%WADdeflicker%"=="" goto:skip

::decompress and check again

call Support\subscripts\dependency.bat wwcxtool
if /i "%dependency%" EQU "F" (@ping 127.0.0.1 -n 5 -w 1000> nul) & (goto:skip)

::if exist "%ImageDol%.bak" it means "%ImageDol%" has already been decompressed
move /y "%ImageDol%" "%ImageDol%.bak">nul
temp\wwcxtool.exe /u "%ImageDol%.bak" "%ImageDol%">nul
if not errorlevel 0 (set WADdeflicker=Unknown) & (goto:skip)
if not exist "%ImageDol%" (set WADdeflicker=Unknown) & (goto:skip)

support\sfk hexfind "%ImageDol%" -binary /%str2%/ >nul
::ERRORLEVEL 1 means found, 0 means not found
IF ERRORLEVEL 1 set WADdeflicker=Disabled
support\sfk hexfind "%ImageDol%" -binary /%str1%/ >nul
IF ERRORLEVEL 1 set WADdeflicker=Enabled

::N64ExpPatch
If /i "%TitID:~0,1%" NEQ "N" goto:NoExpPak
if "%TitID:~3%"=="" goto:NoExpPak
if not "%TitID:~4%"=="" goto:NoExpPak
support\sfk hexfind "%ImageDol%" -binary /%str4%/ >nul
::ERRORLEVEL 1 means found, 0 means not found
IF ERRORLEVEL 1 set N64ExpPatch=Enabled
support\sfk hexfind "%ImageDol%" -binary /%str3%/ >nul
IF ERRORLEVEL 1 set N64ExpPatch=Disabled
:NoExpPak

if "%WADdeflicker%"=="" set WADdeflicker=Unknown
:skip
::if exist "temp\__channel" rd /s /q "temp\__channel"> nul
::if not "%WADdeflicker%"=="" echo Deflicker: %WADdeflicker%
::if not "%N64ExpPatch%"=="" echo N64 Expansion Pak: %N64ExpPatch%

::get region info
If /i "%wadtype%" EQU "ios" goto:skip
If /i "%wadtype%" EQU "system" goto:skip

support\sfk filter -quiet temp\WADinfo.txt -ls+"  Region: " -rep _*": "__>temp\WADinfo2.txt
set /p WADregion= <temp\WADinfo2.txt
If /i "%WADregion%" EQU "None" set WADregion=Free

::::Region info in tmd at offset 0x19C (len 2), or offset 0xE9C of wad (offset is 0xD00 or 3328 greater in WAD than tmd)
::::Region (0: Japan, 1: USA, 2: Europe, 3: Region Free, 4: Korea)
::support\sfk hexdump -pure -nofile -offlen 0xE9C 0x02 "%WadInput%">temp\hexdump.txt
::set /p WADregion= <temp\hexdump.txt
::If /i "%WADregion%" EQU "0000" set WADregion=JPN
::If /i "%WADregion%" EQU "0001" set WADregion=USA
::If /i "%WADregion%" EQU "0002" set WADregion=PAL
::If /i "%WADregion%" EQU "0003" set WADregion=Free
::If /i "%WADregion%" EQU "0004" set WADregion=KOR
::::if not "%WADregion%"=="" echo Region: %WADregion%
:skip



If /i "%wadtype%" EQU "system" goto:versioninfo
If /i "%wadtype%" NEQ "ios" goto:fin

::check if vWii
findStr /I /C:"vWii Title: True" temp\WADinfo.txt >nul
IF ERRORLEVEL 1 (set iostype=Wii) else (set iostype=vWii)

::::vWii IOS has 01 at offset 0x183 of tmd, 0xE83 of wad
::if exist temp\hexdump.txt del temp\hexdump.txt>nul
::support\sfk hexdump -pure -nofile -offlen 0xE83 0x01 "%WadInput%">temp\hexdump.txt
::findStr /I /B /C:"01" temp\hexdump.txt >nul
::IF ERRORLEVEL 1 (set iostype=Wii) else (set iostype=vWii)
::echo iostype: %iostype%


::IOS slot is at tmd offset 0x193, 0xE93 of wad (len 1), i.e. FF is 255
if exist temp\hexdump.txt del temp\hexdump.txt>nul
support\sfk hexdump -pure -nofile -offlen 0xE93 0x01 "%WadInput%">temp\hexdump.txt
set /p iosslot= <temp\hexdump.txt
support\sfk dec %iosslot%>temp\hexdump.txt
set /p iosslot= <temp\hexdump.txt
set iosslot=%iosslot:~0,-1%

If /i "%iosslot%" EQU "1" (set wadtype=mios) & (set TitID=)
If /i "%iosslot%" EQU "01" (set wadtype=mios) & (set TitID=)
If /i "%wadtype%" NEQ "mios" goto:skipCMIOS

If /i "%SigningStatus%" EQU "Legitimate (Unmodified TMD + Ticket)" goto:skipCMIOS
If /i "%WadContents%" NEQ "2" goto:skipCMIOS

if exist "temp\cMIOS1.hash" goto:skip
echo 42d6aec1e5e5f8652f8fddd07b2ef92058648ff5 DIOS MIOS Lite v1.3 >"temp\cMIOS1.hash"
echo e6b5aefdaf7318c758d007450a6c1816ddb409c1 DIOS MIOS Lite v2.11 >>"temp\cMIOS1.hash"
echo aff3d5d66882ef69a16bb980e8677b86b6382315 DIOS MIOS v2.11 >>"temp\cMIOS1.hash"
echo 776739976c879f3ed7544977e328d11e333adaec Waninkoko rev5 cMIOS[4] >>"temp\cMIOS1.hash"
echo ae2d5ede3459b61deb7a58072e354687d141b108 WiiGator GCBL v0.2 cMIOS[4] >>"temp\cMIOS1.hash"
echo e38ae1654cde5ee5e6b61f40a7374ff8314e352b WiiGator WiiPower v0.2 cMIOS[10] >>"temp\cMIOS1.hash"
echo 77dd7139c399237426f80f66e3f855721a9a531b Swiss r1788 cMIOS[10] >>"temp\cMIOS1.hash"
:skip

::get Content Index 1 hash
support\sfk filter temp\WADinfo.txt -nocheck -inc "   Content Index: 1" to "Content Hash" -and+"Content Hash: " -rep _*": "__>"temp\WADinfo2.txt"
set /p md5= <temp\WADinfo2.txt

::check against cMIOS hashtable
support\sfk filter -quiet "temp\cMIOS1.hash" -ls+"%md5% " -lsrep _"%md5% "__ -lerep _" "__ >"temp\cMIOS.txt"
set /p cIOSinfo= <temp\cMIOS.txt
::if not "%cIOSinfo%"=="" echo cMIOS Info: %cIOSinfo%
:skipCMIOS


findStr /I /C:"WAD Type: boot2" temp\WADinfo.txt >nul
IF NOT ERRORLEVEL 1 (set wadtype=boot2) & (set TitID=) & (set iosslot=)
::If /i "%channelpath%-%TitIDhex%" EQU "00000001-00000001" (set wadtype=boot2) & (set TitID=) & (set iosslot=)

If /i "%iosslot%" EQU "0" (set wadtype=BC) & (set TitID=)
If /i "%iosslot%" EQU "00" (set wadtype=BC) & (set TitID=)

If /i "%iostype%" NEQ "vWii" goto:skip
If /i "%channelpath%-%TitIDhex%" EQU "00000001-00000200" (set wadtype=BC-NAND) & (set TitID=)
If /i "%channelpath%-%TitIDhex%" EQU "00000001-00000201" (set wadtype=BC-WFS) & (set TitID=)
:skip

::echo iosslot: %iosslot%


::collect tag and base data for IOSs only (see ciosmaps.xml for offsets in 00000000.app)
If /i "%wadtype%" NEQ "ios" goto:versioninfo

::check for stubs, filesize in bytes should be less 200000 (largest found was IOS70 @ 172,864)
if %GetFileSize% GTR 200000 goto:notstub
If /i "%WadContents%" EQU "3" set "WadStub= STUB"
::if not "%WadStub%"=="" (support\sfk echo [%yellowtext%]Warning this IOS is stubbed) & (echo.)
:notstub

::only bother unpacking to check if fakesigned (or broken-fakesigned)
If /i "%cIOSChecks%" NEQ "Y" goto:versioninfo

::was originally going to skip these checks for stubs, but technically stubs can have the ES Identify & Version patches applied... weird
::if not "%WadStub%"=="" goto:versioninfo

::unpack WAD to temp dir
if exist "temp\__channel" rd /s /q "temp\__channel"> nul
mkdir "temp\__channel"
Support\wiipy\wiipy.exe wad unpack --skip-hash "%WadInput%" "temp\__channel">nul

if not exist temp\__channel\00000000.app goto:versioninfo


::Korean Key Check binary search \ hex search
support\sfk hexfind -binary /63B82BB4F4614E2E13F2FEFBBA4C9B7E/ -dir "temp\__channel" -file .app >nul
::ERRORLEVEL 1 means found, 0 means not found
::echo ERRORLEVEL %ERRORLEVEL%
IF ERRORLEVEL 1 (set WadKorKey=Found) else (set WadKorKey=Not Found)
::if not "%WadKorKey%"=="" echo Korean Key: %WadKorKey%


::Check for ES Module "ES:" binary search \ hex search
support\sfk hexfind -binary /45533A/ -dir "temp\__channel" -file .app >temp\hexdump.txt
::ERRORLEVEL 1 means found, 0 means not found
IF NOT ERRORLEVEL 1 goto:skipESchecks

support\sfk -spat filter -quiet temp\hexdump.txt -+"1 hits" -+"hit at offset" -rep _"*\x5f\x5fchannel\x5c"__ -rep _".app*"_".app"_ -write -yes
set /p ESmodule= <temp\hexdump.txt
::echo ESmodule:"%ESmodule%"

if "%ESmodule%"=="" goto:skipESchecks

::FakeSigning Patch (FS), checks for both of these sequences: ['200723a2', '20074b0b'], and then it replaces the 07 with 00
support\sfk hexfind "temp\__channel\%ESmodule%" -binary /200023a2/ >nul
::ERRORLEVEL 1 means found, 0 means not found
IF ERRORLEVEL 1 (set FSpatch=Y) & (set ESpatches=Fakesigning)
support\sfk hexfind "temp\__channel\%ESmodule%" -binary /20004b0b/ >nul
::ERRORLEVEL 1 means found, 0 means not found
IF ERRORLEVEL 1 (set FSpatch=Y) & (set ESpatches=Fakesigning)


::ES Identify Patch (ES), checks for: '2803d123' and changes it to '28030000'
support\sfk hexfind "temp\__channel\%ESmodule%" -binary /28030000/ >nul
IF ERRORLEVEL 1 set ESpatch=Y
If /i "%ESpatch%" EQU "Y" if "%ESpatches%"=="" (set "ESpatches=ES Identify") else (set "ESpatches=%ESpatches%, ES Identify")

::Nand Permission Patch (NP) (/dev/flash access) it checks for: '428bd0012566' and changes it to '428be0012566'
support\sfk hexfind "temp\__channel\%ESmodule%" -binary /428be0012566/ >nul
IF ERRORLEVEL 1 set NPpatch=Y
If /i "%NPpatch%" EQU "Y" if "%ESpatches%"=="" (set "ESpatches=Nand Permission") else (set "ESpatches=%ESpatches%, Nand Permission")

::Version Patch (VP) it checks for 'd2014e56' and changes it to 'e0014e56'
support\sfk hexfind "temp\__channel\%ESmodule%" -binary /e0014e56/ >nul
IF ERRORLEVEL 1 set VPpatch=Y
If /i "%VPpatch%" EQU "Y" if "%ESpatches%"=="" (set "ESpatches=Version") else (set "ESpatches=%ESpatches%, Version")
::if not "%ESpatches%"=="" echo ES Module Patches: %ESpatches%


:skipESchecks

::tag only valid if first 8 bytes of 00000000.app are 1EE7C10500000001
if exist temp\hexdump.txt del temp\hexdump.txt>nul
support\sfk hexdump -pure -nofile -offlen 0x00 0x08 "temp\__channel\00000000.app">temp\hexdump.txt
findStr /I /B /C:"1EE7C10500000001" temp\hexdump.txt >nul
IF ERRORLEVEL 1 goto:versioninfo
::echo AHB Access: %ahbprot%

::cIOS base IOS info at 0x0c len 0x04 (need to convert from hex to dec)
::<patch offset="0x0c" size="4"  originalbytes="0x31,0x30,0x30,0x33" newbytes="0x00,0x00,0x00,0x38"/>
if exist temp\hexdump.txt del temp\hexdump.txt>nul
support\sfk hexdump -pure -nofile -offlen 0x0c 0x04 "temp\__channel\00000000.app">temp\hexdump.txt
set /p WadBaseIOS= <temp\hexdump.txt
support\sfk dec %WadBaseIOS%>temp\hexdump.txt
set /p WadBaseIOS= <temp\hexdump.txt
set "WadBaseIOS=[%WadBaseIOS:~0,-1%]"
::if not "%WadBaseIOS%"=="" echo WadBaseIOS: %WadBaseIOS%

::cIOS version number at 0x08 len 0x04 (need to convert from hex to dec)
if exist temp\hexdump.txt del temp\hexdump.txt>nul
support\sfk hexdump -pure -nofile -offlen 0x08 0x04 "temp\__channel\00000000.app">temp\hexdump.txt
set /p WadVersion= <temp\hexdump.txt
support\sfk dec %WadVersion%>temp\hexdump.txt
set /p WadVersion= <temp\hexdump.txt
set "WadVersion=%WadVersion:~0,-1%"
::if not "%WadVersion%"=="" echo WadVersion: %WadVersion%



::cIOSFamilyName at 0x10 len 0x16 (need to convert from hex to ascii)
if exist temp\hexdump.txt del temp\hexdump.txt>nul
support\sfk hexdump -pure -nofile -offlen 0x10 0x16 "temp\__channel\00000000.app">temp\hexdump.txt
set /p cIOSFamilyNameHex= <temp\hexdump.txt

::convert hex to ascii, but can only do 4 bytes at a time
support\sfk num -hex %cIOSFamilyNameHex:~0,8%>temp\hexdump.txt
support\sfk filter -quiet temp\hexdump.txt -rep _"*>"__ -rep _"<*"__ -write -yes
set /p cIOSFamilyName= <temp\hexdump.txt

support\sfk num -hex %cIOSFamilyNameHex:~8,8%>temp\hexdump.txt
support\sfk filter -quiet temp\hexdump.txt -rep _"*>"__ -rep _"<*"__ -write -yes
set /p cIOSFamilyName2= <temp\hexdump.txt

support\sfk num -hex %cIOSFamilyNameHex:~16,8%>temp\hexdump.txt
support\sfk filter -quiet temp\hexdump.txt -rep _"*>"__ -rep _"<*"__ -write -yes
set /p cIOSFamilyName3= <temp\hexdump.txt

support\sfk num -hex %cIOSFamilyNameHex:~24,8%>temp\hexdump.txt
support\sfk filter -quiet temp\hexdump.txt -rep _"*>"__ -rep _"<*"__ -write -yes
set /p cIOSFamilyName4= <temp\hexdump.txt

set "cIOSFamilyName=%cIOSFamilyName%%cIOSFamilyName2%%cIOSFamilyName3%%cIOSFamilyName4%"
set "cIOSFamilyName=%cIOSFamilyName:.=%"
::if not "%cIOSFamilyName%"=="" echo cIOSFamilyName: %cIOSFamilyName%

If /i "%cIOSFamilyName%" NEQ "hermes" goto:not75
If /i "%WadBaseIOS%" EQU "[75]" set "WadBaseIOS=[38+37]"
:not75


::cIOS version string at 0x20 len 0x16 (need to convert from hex to ascii)
if exist temp\hexdump.txt del temp\hexdump.txt>nul
support\sfk hexdump -pure -nofile -offlen 0x20 0x16 "temp\__channel\00000000.app">temp\hexdump.txt
set /p cIOSVerStringHex= <temp\hexdump.txt

::convert hex to ascii, but can only do 4 bytes at a time
support\sfk num -hex %cIOSVerStringHex:~0,8%>temp\hexdump.txt
support\sfk filter -quiet temp\hexdump.txt -rep _"*>"__ -rep _"<*"__ -write -yes
set /p cIOSVerString= <temp\hexdump.txt

support\sfk num -hex %cIOSVerStringHex:~8,8%>temp\hexdump.txt
support\sfk filter -quiet temp\hexdump.txt -rep _"*>"__ -rep _"<*"__ -write -yes
set /p cIOSVerString2= <temp\hexdump.txt

support\sfk num -hex %cIOSVerStringHex:~16,8%>temp\hexdump.txt
support\sfk filter -quiet temp\hexdump.txt -rep _"*>"__ -rep _"<*"__ -write -yes
set /p cIOSVerString3= <temp\hexdump.txt

support\sfk num -hex %cIOSVerStringHex:~24,8%>temp\hexdump.txt
support\sfk filter -quiet temp\hexdump.txt -rep _"*>"__ -rep _"<*"__ -write -yes
set /p cIOSVerString4= <temp\hexdump.txt

set "cIOSVerString=%cIOSVerString%%cIOSVerString2%%cIOSVerString3%%cIOSVerString4%"
set "cIOSVerString=%cIOSVerString:.=%"

::if not "%cIOSVerString%"=="" echo cIOSVerString: %cIOSVerString%
set "cIOSinfo=%cIOSFamilyName%%WadVersion%%cIOSVerString%"
if not "%cIOSinfo%"=="" set "cIOSinfo=%cIOSFamilyName%-v%WadVersion%%cIOSVerString%"

::if not "%cIOSinfo%"=="" echo WAD Tag: %cIOSinfo%
::if not "%WadBaseIOS%"=="" echo WadBaseIOS: %WadBaseIOS%


:versioninfo
support\sfk filter temp\WADinfo.txt -nocheck -inc "Title Info" to "Title Version" -and+"Title Version: " -rep _*": "__>"temp\WADinfo2.txt"
set /p iosversionfull= <temp\WADinfo2.txt
::echo iosversionfull: %iosversionfull%

support\sfk filter -quiet temp\WADinfo2.txt -rep _" "*__ -write -yes
set /p iosversion= <temp\WADinfo2.txt
::echo iosversion: %iosversion%

::::version number is at tmd offset 0x1DC (len 2), or offset 0xEDC of wad (offset is 0xD00 or 3328 greater in WAD than tmd) i.e. FFFF is 65535
::if exist temp\hexdump.txt del temp\hexdump.txt>nul
::support\sfk hexdump -pure -nofile -offlen 0xEDC 0x02 "%WadInput%">temp\hexdump.txt
::set /p iosversion= <temp\hexdump.txt
::support\sfk dec %iosversion%>temp\hexdump.txt
::set /p iosversion= <temp\hexdump.txt
::set iosversion=%iosversion:~0,-1%

:fin
If /i "%SendWADs%" EQU "I" goto:fin2
if exist "temp\__channel" rd /s /q "temp\__channel"> nul
:fin2

if exist temp\WADinfo2.txt del temp\WADinfo2.txt>nul
