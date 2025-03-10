If /i "%wadtype%" EQU "Invalid" (echo This is not a valid WAD file!) & (goto:fin)

::echo WAD Info:
::echo.

If /i "%WadBannerless%" NEQ " [Minimalist Banner]" goto:skip
If /i "%wadtype:~0,7%" EQU "channel" (support\sfk echo [%yellowtext%]Warning: WAD is Bannerless and not hidden so may cause banner brick) & (echo.)
:skip

if not "%WADtit%"=="" support\sfk echo Title: "%WADtit%"

If /i "%wadtype%" EQU "ios" goto:skip
If /i "%wadtype:~0,2%" EQU "BC" goto:skip
If /i "%wadtype%" EQU "MIOS" goto:skip
if "%WadBannerless%"=="" goto:skip1
If /i "%wadtype:~0,7%" EQU "channel" echo Type: Channel%WadBannerless%
:skip1
If /i "%wadtype%" EQU "hidden" echo Type: Hidden Channel%WadBannerless%
If /i "%wadtype%" EQU "system" echo Type: System
if not "%iosslot%"=="" echo Required IOS: %iosslot%
:skip

if not "%TitID%"=="" support\sfk echo Title ID: "%TitID%"

If /i "%wadtype%" EQU "system" echo Version: %iosversionfull%
If /i "%wadtype%" EQU "mios" echo WAD Info: %iostype% MIOS v%iosversion%
If /i "%wadtype%" EQU "mios" if not "%cIOSinfo%"=="" echo cMIOS Info: %cIOSinfo%

If /i "%wadtype%" EQU "boot2" echo WAD Info: %iostype% boot2 v%iosversionfull%
If /i "%wadtype:~0,2%" EQU "BC" echo WAD Info: %iostype% %wadtype% v%iosversionfull%

If /i "%wadtype%" NEQ "ios" goto:skip
if not "%WadStub%"=="" (support\sfk echo [%yellowtext%]Warning: This IOS is stubbed) & (echo.)

if "%SendWad%"=="" echo WAD Info: %iostype% IOS%iosslot%%WadBaseIOS% v%iosversion%%WadStub%
if not "%SendWad%"=="" echo Input WAD Info: %iostype% IOS%iosslot%%WadBaseIOS% v%iosversion%%WadStub%

if not "%cIOSinfo%"=="" echo cIOS Info: %cIOSinfo%
if not "%ESpatches%"=="" echo ES Module Patches: %ESpatches%
:skip
if not "%channelpath%%TitIDhex%"=="" echo Full Title ID: %channelpath%%TitIDhex%

if not "%WADregion%"=="" echo Region: %WADregion%
if not "%WadBlocks%"=="" echo Installed Size: %WadBlocks%
if not "%GetFileSizeMB%"=="" echo Installed Size (MB): %GetFileSizeMB%
::echo Filesize: %GetFileSize% bytes


if not "%WadContents%"=="" echo Content Files: %WadContents%
if not "%SigningStatus%"=="" echo Signing Status: %SigningStatus%
if not "%WadKorKey%"=="" echo Korean Key: %WadKorKey%
if not "%ahbprot%"=="" echo AHB Access: %ahbprot%
if not "%DVDvid%"=="" echo DVD Video Access: %DVDvid%
if not "%WadNL%"=="" echo NandLoader: %WadNL%
if not "%WADdeflicker%"=="" echo Deflicker: %WADdeflicker%
if not "%N64ExpPatch%"=="" echo N64 Expansion Pak: %N64ExpPatch%
:fin