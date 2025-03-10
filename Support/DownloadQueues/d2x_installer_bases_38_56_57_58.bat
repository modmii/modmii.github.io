::ModMii v6.6.4 - Download Queue - Mon 02/13/2023 - 23:00:22.00
set AdvNumber=4
if /i "%GetAdvNumberOnly%" EQU "Y" goto:endofqueue
::Queue Settings
Set ROOTSAVE=ON
::Queue
echo temp\AdvDL1.bat>>temp\DLGotosADV.txt
echo temp\AdvDL2.bat>>temp\DLGotosADV.txt
echo temp\AdvDL3.bat>>temp\DLGotosADV.txt
echo temp\AdvDL4.bat>>temp\DLGotosADV.txt
echo Advanced Download: IOS38-64-v4123 >>temp\DLnamesADV.txt
echo Advanced Download: IOS56-64-v5661 >>temp\DLnamesADV.txt
echo Advanced Download: IOS57-64-v5918 >>temp\DLnamesADV.txt
echo Advanced Download: IOS58-64-v6175 >>temp\DLnamesADV.txt
if exist temp\AdvDL1.bat del temp\AdvDL1.bat>nul
echo "set name=Advanced Download: IOS38-64-v4123">>temp\AdvDL1.bat
echo "set DEC=38">>temp\AdvDL1.bat
echo "set VERFINAL=4123">>temp\AdvDL1.bat
echo "set patchname=">>temp\AdvDL1.bat
echo "set slotname=">>temp\AdvDL1.bat
echo "set versionname=">>temp\AdvDL1.bat
echo "set HEX=">>temp\AdvDL1.bat
echo "set VER=4123">>temp\AdvDL1.bat
echo "set wadfolder=">>temp\AdvDL1.bat
echo "set PATCHCODE=">>temp\AdvDL1.bat
echo "set slotcode=">>temp\AdvDL1.bat
echo "set versioncode=">>temp\AdvDL1.bat
echo "set category=userdefined">>temp\AdvDL1.bat
support\sfk -spat filter -quiet temp\AdvDL1.bat -rep _\x22__ -write -yes
if exist temp\AdvDL2.bat del temp\AdvDL2.bat>nul
echo "set name=Advanced Download: IOS56-64-v5661">>temp\AdvDL2.bat
echo "set DEC=56">>temp\AdvDL2.bat
echo "set VERFINAL=5661">>temp\AdvDL2.bat
echo "set patchname=">>temp\AdvDL2.bat
echo "set slotname=">>temp\AdvDL2.bat
echo "set versionname=">>temp\AdvDL2.bat
echo "set HEX=">>temp\AdvDL2.bat
echo "set VER=5661">>temp\AdvDL2.bat
echo "set wadfolder=">>temp\AdvDL2.bat
echo "set PATCHCODE=">>temp\AdvDL2.bat
echo "set slotcode=">>temp\AdvDL2.bat
echo "set versioncode=">>temp\AdvDL2.bat
echo "set category=userdefined">>temp\AdvDL2.bat
support\sfk -spat filter -quiet temp\AdvDL2.bat -rep _\x22__ -write -yes
if exist temp\AdvDL3.bat del temp\AdvDL3.bat>nul
echo "set name=Advanced Download: IOS57-64-v5918">>temp\AdvDL3.bat
echo "set DEC=57">>temp\AdvDL3.bat
echo "set VERFINAL=5918">>temp\AdvDL3.bat
echo "set patchname=">>temp\AdvDL3.bat
echo "set slotname=">>temp\AdvDL3.bat
echo "set versionname=">>temp\AdvDL3.bat
echo "set HEX=">>temp\AdvDL3.bat
echo "set VER=5918">>temp\AdvDL3.bat
echo "set wadfolder=">>temp\AdvDL3.bat
echo "set PATCHCODE=">>temp\AdvDL3.bat
echo "set slotcode=">>temp\AdvDL3.bat
echo "set versioncode=">>temp\AdvDL3.bat
echo "set category=userdefined">>temp\AdvDL3.bat
support\sfk -spat filter -quiet temp\AdvDL3.bat -rep _\x22__ -write -yes
if exist temp\AdvDL4.bat del temp\AdvDL4.bat>nul
echo "set name=Advanced Download: IOS58-64-v6175">>temp\AdvDL4.bat
echo "set DEC=58">>temp\AdvDL4.bat
echo "set VERFINAL=6175">>temp\AdvDL4.bat
echo "set patchname=">>temp\AdvDL4.bat
echo "set slotname=">>temp\AdvDL4.bat
echo "set versionname=">>temp\AdvDL4.bat
echo "set HEX=">>temp\AdvDL4.bat
echo "set VER=6175">>temp\AdvDL4.bat
echo "set wadfolder=">>temp\AdvDL4.bat
echo "set PATCHCODE=">>temp\AdvDL4.bat
echo "set slotcode=">>temp\AdvDL4.bat
echo "set versioncode=">>temp\AdvDL4.bat
echo "set category=userdefined">>temp\AdvDL4.bat
support\sfk -spat filter -quiet temp\AdvDL4.bat -rep _\x22__ -write -yes
:endofqueue
