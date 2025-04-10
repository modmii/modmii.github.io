set DBversion=25.04.10
if "%CurrentDLNAME%"=="" goto:DBend
call "Support\subscripts\ClearDB.bat"
goto:%CurrentDLNAME%

:EULAU
set name=EULA v3 (USA)
set code1=00010008
set code2=48414B45
set version=3
set md5=e3158b73b02af6d0e02bdf6d5f4a42d3
set md5alt=%md5%
set category=ios
set wadname=EULA-NUS-v3[U].wad
if exist "%Drive%\WAD\NUS-EULA-v3[U].wad" move /y "%Drive%\WAD\NUS-EULA-v3[U].wad" "%Drive%\WAD\%wadname%">nul
if exist "%Drive%\WAD\%wadname%" goto:skip
if exist "temp\%wadname%" goto:skip
if /i "%MENU1%" EQU "RC" goto:skip
if exist "temp\NUS-EULA-v3[U].wad" move /y "temp\NUS-EULA-v3[U].wad" "temp\%wadname%">nul
:skip
::Rename EULA download only for region change guides to come after IOS56
if /i "%MENU1%" NEQ "RC" goto:DBend
set wadname=NUS-EULA-v3[U].wad
if exist "%Drive%\WAD\EULA-NUS-v3[U].wad" move /y "%Drive%\WAD\EULA-NUS-v3[U].wad" "%Drive%\WAD\%wadname%">nul
if exist "%Drive%\WAD\%wadname%" goto:DBend
if exist "temp\%wadname%" goto:DBend
if exist "temp\EULA-NUS-v3[U].wad" move /y "temp\EULA-NUS-v3[U].wad" "temp\%wadname%">nul
goto:DBend

:EULAE
set name=EULA v3 (PAL)
set code1=00010008
set code2=48414B50
set version=3
if /i "%MENU1%" EQU "RC" set wadname=NUS-EULA-v3[E].wad
set md5=c97ea64cb8282342f8a9078fe9acfcff
set md5alt=%md5%
set category=ios
set wadname=EULA-NUS-v3[E].wad
if exist "%Drive%\WAD\NUS-EULA-v3[E].wad" move /y "%Drive%\WAD\NUS-EULA-v3[E].wad" "%Drive%\WAD\%wadname%">nul
if exist "%Drive%\WAD\%wadname%" goto:skip
if exist "temp\%wadname%" goto:skip
if /i "%MENU1%" EQU "RC" goto:skip
if exist "temp\NUS-EULA-v3[E].wad" move /y "temp\NUS-EULA-v3[E].wad" "temp\%wadname%">nul
:skip
::Rename EULA download only for region change guides to come after IOS56
if /i "%MENU1%" NEQ "RC" goto:DBend
set wadname=NUS-EULA-v3[E].wad
if exist "%Drive%\WAD\EULA-NUS-v3[E].wad" move /y "%Drive%\WAD\EULA-NUS-v3[E].wad" "%Drive%\WAD\%wadname%">nul
if exist "%Drive%\WAD\%wadname%" goto:DBend
if exist "temp\%wadname%" goto:DBend
if exist "temp\EULA-NUS-v3[E].wad" move /y "temp\EULA-NUS-v3[E].wad" "temp\%wadname%">nul
goto:DBend

:EULAJ
set name=EULA v3 (JPN)
set code1=00010008
set code2=48414B4A
set version=3
if /i "%MENU1%" EQU "RC" set wadname=NUS-EULA-v3[J].wad
set md5=9e1d0905cc91f0feb416e0543dee904a
set md5alt=%md5%
set category=ios
set wadname=EULA-NUS-v3[J].wad
if exist "%Drive%\WAD\NUS-EULA-v3[J].wad" move /y "%Drive%\WAD\NUS-EULA-v3[J].wad" "%Drive%\WAD\%wadname%">nul
if exist "%Drive%\WAD\%wadname%" goto:skip
if exist "temp\%wadname%" goto:skip
if /i "%MENU1%" EQU "RC" goto:skip
if exist "temp\NUS-EULA-v3[J].wad" move /y "temp\NUS-EULA-v3[J].wad" "temp\%wadname%">nul
:skip
::Rename EULA download only for region change guides to come after IOS56
if /i "%MENU1%" NEQ "RC" goto:DBend
set wadname=NUS-EULA-v3[J].wad
if exist "%Drive%\WAD\EULA-NUS-v3[J].wad" move /y "%Drive%\WAD\EULA-NUS-v3[J].wad" "%Drive%\WAD\%wadname%">nul
if exist "%Drive%\WAD\%wadname%" goto:DBend
if exist "temp\%wadname%" goto:DBend
if exist "temp\EULA-NUS-v3[J].wad" move /y "temp\EULA-NUS-v3[J].wad" "temp\%wadname%">nul
goto:DBend

:EULAK
set name=EULA v3 (KOR)
set code1=00010008
set code2=48414B4B
set version=3
if /i "%MENU1%" EQU "RC" set wadname=NUS-EULA-v3[K].wad
set md5=3416c199d4fd33f51216fd84666278ef
set md5alt=%md5%
set category=ios
set wadname=EULA-NUS-v3[K].wad
if exist "%Drive%\WAD\NUS-EULA-v3[K].wad" move /y "%Drive%\WAD\NUS-EULA-v3[K].wad" "%Drive%\WAD\%wadname%">nul
if exist "%Drive%\WAD\%wadname%" goto:skip
if exist "temp\%wadname%" goto:skip
if /i "%MENU1%" EQU "RC" goto:skip
if exist "temp\NUS-EULA-v3[K].wad" move /y "temp\NUS-EULA-v3[K].wad" "temp\%wadname%">nul
:skip
::Rename EULA download only for region change guides to come after IOS56
if /i "%MENU1%" NEQ "RC" goto:DBend
set wadname=NUS-EULA-v3[K].wad
if exist "%Drive%\WAD\EULA-NUS-v3[K].wad" move /y "%Drive%\WAD\EULA-NUS-v3[K].wad" "%Drive%\WAD\%wadname%">nul
if exist "%Drive%\WAD\%wadname%" goto:DBend
if exist "temp\%wadname%" goto:DBend
if exist "temp\EULA-NUS-v3[K].wad" move /y "temp\EULA-NUS-v3[K].wad" "temp\%wadname%">nul
goto:DBend

:RSU
set name=Region Select v2 (USA)
set code1=00010008
set code2=48414C45
set version=2
set wadname=Region-Select-NUS-v2[U].wad
set md5=5eb0bdc1cb48a251d91e96d13abaa49c
set md5alt=%md5%
set category=ios
goto:DBend

:RSE
set name=Region Select v2 (PAL)
set code1=00010008
set code2=48414C50
set version=2
set wadname=Region-Select-NUS-v2[E].wad
set md5=4196dde6c23e25b01ea12c8fd23bd704
set md5alt=%md5%
set category=ios
goto:DBend

:RSJ
set name=Region Select v2 (JPN)
set code1=00010008
set code2=48414C4A
set version=2
set wadname=Region-Select-NUS-v2[J].wad
set md5=49f3bab10b39ecaac989729b5d7b131b
set md5alt=%md5%
set category=ios
goto:DBend

:RSK
set name=Region Select v2 (KOR)
set code1=00010008
set code2=48414C4B
set version=2
set wadname=Region-Select-NUS-v2[K].wad
set md5=37e788846bcf599a7ffba400a5e60b6a
set md5alt=%md5%
set category=ios
goto:DBend



:BCNUS
set name=BC
set code1=00000001
set code2=00000100
set version=6
set wadname=BC-NUS-v6.wad
set md5=68f723963127041aa383d675f2672fc3
set md5alt=%md5%
set category=ios
goto:DBend



:SM4.3U
set name=System Menu 4.3U
set code1=00000001
set code2=00000002
set version=513
set wadname=SystemMenu_4.3U_v513.wad
set md5=417358284cce02dbb0fed3ef30b0b59d
set md5alt=%md5%
set category=ios
goto:DBend

:SM4.2U
set name=System Menu 4.2U
set code1=00000001
set code2=00000002
set version=481
set wadname=SystemMenu_4.2U_v481.wad
set md5=b4eda5b30d090c9256b60441d83c9d65
set md5alt=%md5%
set category=ios
goto:DBend

:SM4.1U
set name=System Menu 4.1U
set code1=00000001
set code2=00000002
set version=449
set wadname=SystemMenu_4.1U_v449.wad
set md5=555d2c0bc92ccd05c6f6a57412ebbd37
set md5alt=%md5%
set category=ios
goto:DBend

:SM4.3E
set name=System Menu 4.3E
set code1=00000001
set code2=00000002
set version=514
set wadname=SystemMenu_4.3E_v514.wad
set md5=cad93ca3ca41704b15bbee95b2e6aae2
set md5alt=%md5%
set category=ios
goto:DBend

:SM4.2E
set name=System Menu 4.2E
set code1=00000001
set code2=00000002
set version=482
set wadname=SystemMenu_4.2E_v482.wad
set md5=efd76ac375914bf5969c74f8fb4fef75
set md5alt=%md5%
set category=ios
goto:DBend

:SM4.1E
set name=System Menu 4.1E
set code1=00000001
set code2=00000002
set version=450
set wadname=SystemMenu_4.1E_v450.wad
set md5=d19af34181c46645002efb130f6ea44c
set md5alt=%md5%
set category=ios
goto:DBend

:SM4.3J
set name=System Menu 4.3J
set code1=00000001
set code2=00000002
set version=512
set wadname=SystemMenu_4.3J_v512.wad
set md5=9552e63c8e0b6688e788639fb1c14e13
set md5alt=%md5%
set category=ios
goto:DBend

:SM4.2J
set name=System Menu 4.2J
set code1=00000001
set code2=00000002
set version=480
set wadname=SystemMenu_4.2J_v480.wad
set md5=ffa08cfaf2a9bb4f6adffa812ab535ac
set md5alt=%md5%
set category=ios
goto:DBend

:SM4.1J
set name=System Menu 4.1J
set code1=00000001
set code2=00000002
set version=448
set wadname=SystemMenu_4.1J_v448.wad
set md5=5574337ec2c36cd9a9c15b8008ca4dd2
set md5alt=%md5%
set category=ios
goto:DBend

:SM4.3K
set name=System Menu 4.3K
set code1=00000001
set code2=00000002
set version=518
set wadname=SystemMenu_4.3K_v518.wad
set md5=775159a42dc1d12b9304fbbbe7415d80
set md5alt=%md5%
set category=ios
goto:DBend

:SM4.2K
set name=System Menu 4.2K
set code1=00000001
set code2=00000002
set version=486
set wadname=SystemMenu_4.2K_v486.wad
set md5=d225a6ff7130ea4cc63638b0d38a54e7
set md5alt=%md5%
set category=ios
goto:DBend

:SM4.1K
set name=System Menu 4.1K
set code1=00000001
set code2=00000002
set version=454
set wadname=SystemMenu_4.1K_v454.wad
set md5=6326365089b5d71f36907f7315364a5f
set md5alt=%md5%
set category=ios
goto:DBend


::System Menu wads with embedded Themes

:SM4.3U-DWR
set name=System Menu 4.3U with Dark Wii Red Theme - %effect%
set wadname=SystemMenu_4.3U_v513_DarkWiiRed_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=574fc49a2143e63f56d6f0116bfeaba1
if /i "%effect%" EQU "Spin" set md5=eef92dd0af20cc9acabe42b1e6f46d5f
if /i "%effect%" EQU "Fast-Spin" set md5=d2537d706a6273e16b334814247c0600
set md5alt=%md5%
set basewad=SystemMenu_4.3U_v513
set basecios=%basewad%
set md5base=417358284cce02dbb0fed3ef30b0b59d
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=4-X_DarkWii_Red_NTSC.mym
set md5mym1=f5c50fe1ff29772a68e8e16996be57f6
set version=513
set lastbasemodule=00000001
set category=SMTHEME
goto:DBend

:SM4.2U-DWR
set name=System Menu 4.2U with Dark Wii Red Theme - %effect%
set wadname=SystemMenu_4.2U_v481_DarkWiiRed_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=ddde48b87a89cb2eb33fa3b2a7f23d00
if /i "%effect%" EQU "Spin" set md5=27c9277c11dd0d38a28276f95775ea21
if /i "%effect%" EQU "Fast-Spin" set md5=6fc672bd3859a0f9fb49fe4256dfc450
set md5alt=%md5%
set basewad=SystemMenu_4.2U_v481
set basecios=%basewad%
set md5base=b4eda5b30d090c9256b60441d83c9d65
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=4-X_DarkWii_Red_NTSC.mym
set md5mym1=f5c50fe1ff29772a68e8e16996be57f6
set version=481
set lastbasemodule=00000001
set category=SMTHEME
goto:DBend

:SM4.1U-DWR
set name=System Menu 4.1U with Dark Wii Red Theme - %effect%
set wadname=SystemMenu_4.1U_v449_DarkWiiRed_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=6475e311576b6a6222bdf44216520927
if /i "%effect%" EQU "Spin" set md5=dcac423b1c6284ec6ebc9b46e4515860
if /i "%effect%" EQU "Fast-Spin" set md5=e927055b0327b15bb9e7acb5b545edf4
set md5alt=%md5%
set basewad=SystemMenu_4.1U_v449
set basecios=%basewad%
set md5base=555d2c0bc92ccd05c6f6a57412ebbd37
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=4-X_DarkWii_Red_NTSC.mym
set md5mym1=f5c50fe1ff29772a68e8e16996be57f6
set version=449
set lastbasemodule=00000001
set category=SMTHEME
goto:DBend

:SM4.3E-DWR
set name=System Menu 4.3E with Dark Wii Red Theme - %effect%
set wadname=SystemMenu_4.3E_v514_DarkWiiRed_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=3c0538c5fc4d0992a4a43587dae26782
if /i "%effect%" EQU "Spin" set md5=63ea777059eccdf5d8f29ed644b136f8
if /i "%effect%" EQU "Fast-Spin" set md5=5c3b2e90862275d9a364e73090de2278
::md5alt's are from 7.0.3 (not fakesigned but modmii tagged)
if /i "%effect%" EQU "No-Spin" set md5alt=65e6a6ca89618c285b0229529649ccf4
if /i "%effect%" EQU "Spin" set md5alt=da47de9056100ea9c61b112a63df6ffa
if /i "%effect%" EQU "Fast-Spin" set md5alt=5006a5c030fff7bf998a38a23017149f
set basewad=SystemMenu_4.3E_v514
set basecios=%basewad%
set md5base=cad93ca3ca41704b15bbee95b2e6aae2
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=DarkWii_Red_No-Spin_4.XE_V2.mym
set md5mym1=543130dbc6ece1d4a666586ed084d714
set version=514
set lastbasemodule=00000001
set category=SMTHEME
goto:DBend

:SM4.2E-DWR
set name=System Menu 4.2E with Dark Wii Red Theme - %effect%
set wadname=SystemMenu_4.2E_v482_DarkWiiRed_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=27aec9c6433ab9b6cef17de1e0f5721a
if /i "%effect%" EQU "Spin" set md5=ce07866b4738a4d32e3d788fe9cfebea
if /i "%effect%" EQU "Fast-Spin" set md5=c9fdbff990b6d4f531792202883351d3
::md5alt's are from 7.0.3 (not fakesigned but modmii tagged)
if /i "%effect%" EQU "No-Spin" set md5alt=467c51cd0c2eb30682ba8f696e8d0fcc
if /i "%effect%" EQU "Spin" set md5alt=9025889c4478a8fb8a3f6c4fbb1903a5
if /i "%effect%" EQU "Fast-Spin" set md5alt=dee18f0bdd63f259860e5bf2a57f6e32
set basewad=SystemMenu_4.2E_v482
set basecios=%basewad%
set md5base=efd76ac375914bf5969c74f8fb4fef75
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=DarkWii_Red_No-Spin_4.XE_V2.mym
set md5mym1=543130dbc6ece1d4a666586ed084d714
set version=482
set lastbasemodule=00000001
set category=SMTHEME
goto:DBend

:SM4.1E-DWR
set name=System Menu 4.1E with Dark Wii Red Theme - %effect%
set wadname=SystemMenu_4.1E_v450_DarkWiiRed_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=8691ccac17d85001f824a9b34b6f22ce
if /i "%effect%" EQU "Spin" set md5=4daccdacbd21c8a3e57f749ea003a894
if /i "%effect%" EQU "Fast-Spin" set md5=33de591d9c3536bf33bdb96e2f64d0ac
::md5alt's are from 7.0.3 (not fakesigned but modmii tagged)
if /i "%effect%" EQU "No-Spin" set md5alt=e8d7b4818311d2c8f76d13770b9c7c09
if /i "%effect%" EQU "Spin" set md5alt=cf35e863536098419eee8e860fc27e42
if /i "%effect%" EQU "Fast-Spin" set md5alt=fc730f01cc8622842687bdd41b265794
set basewad=SystemMenu_4.1E_v450
set basecios=%basewad%
set md5base=d19af34181c46645002efb130f6ea44c
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=DarkWii_Red_No-Spin_4.XE_V2.mym
set md5mym1=543130dbc6ece1d4a666586ed084d714
set version=450
set lastbasemodule=00000001
set category=SMTHEME
goto:DBend

:SM4.3J-DWR
set name=System Menu 4.3J with Dark Wii Red Theme - %effect%
set wadname=SystemMenu_4.3J_v512_DarkWiiRed_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=a88c4d79cf4c407eaed5d52aa2143ce7
if /i "%effect%" EQU "Spin" set md5=2dc56ad1688e384e4d16d0a50a06d504
if /i "%effect%" EQU "Fast-Spin" set md5=61b3d4b98f5db43f52ea0549bb098cdd
set md5alt=%md5%
set basewad=SystemMenu_4.3J_v512
set basecios=%basewad%
set md5base=9552e63c8e0b6688e788639fb1c14e13
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=4-X_DarkWii_Red_JAP.mym
set md5mym1=002f0bbd351bd1cad5fb514701654820
set version=512
set lastbasemodule=00000001
set category=SMTHEME
goto:DBend

:SM4.2J-DWR
set name=System Menu 4.2J with Dark Wii Red Theme - %effect%
set wadname=SystemMenu_4.2J_v480_DarkWiiRed_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=e61379591d8517f1ac5b7c121beda66c
if /i "%effect%" EQU "Spin" set md5=4c3971cbbde0cff1268172b14a6a68ec
if /i "%effect%" EQU "Fast-Spin" set md5=2f4605e04779f66e7830df188a6ce1f3
set md5alt=%md5%
set basewad=SystemMenu_4.2J_v480
set basecios=%basewad%
set md5base=ffa08cfaf2a9bb4f6adffa812ab535ac
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=4-X_DarkWii_Red_JAP.mym
set md5mym1=002f0bbd351bd1cad5fb514701654820
set version=480
set lastbasemodule=00000001
set category=SMTHEME
goto:DBend

:SM4.1J-DWR
set name=System Menu 4.1J with Dark Wii Red Theme - %effect%
set wadname=SystemMenu_4.1J_v448_DarkWiiRed_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=a6096be7f926d701440bebba9b257d8b
if /i "%effect%" EQU "Spin" set md5=ef81d60bd846897bf5992b8d73409f10
if /i "%effect%" EQU "Fast-Spin" set md5=b71ed384718d930e6ac2f4a78b165d0e
set md5alt=%md5%
set basewad=SystemMenu_4.1J_v448
set basecios=%basewad%
set md5base=5574337ec2c36cd9a9c15b8008ca4dd2
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=4-X_DarkWii_Red_JAP.mym
set md5mym1=002f0bbd351bd1cad5fb514701654820
set version=448
set lastbasemodule=00000001
set category=SMTHEME
goto:DBend


:SM4.3K-DWR
set name=System Menu 4.3K with Dark Wii Red Theme - %effect%
set wadname=SystemMenu_4.3K_v518_DarkWiiRed_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=b0aea7005a9c9cee1f33dcdda8c773c3
if /i "%effect%" EQU "Spin" set md5=ac1d3f0ab22691aa787d4f49ec8cb343
if /i "%effect%" EQU "Fast-Spin" set md5=b0e506dfc33b0e098ebc8f9eb91c396d
set md5alt=%md5%
set basewad=SystemMenu_4.3K_v518
set basecios=%basewad%
set md5base=775159a42dc1d12b9304fbbbe7415d80
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=4-X_DarkWii_Red_KOR.mym
set md5mym1=cd208dd893c972a61bcd18612b6fe37b
set version=518
set lastbasemodule=00000001
set category=SMTHEME
goto:DBend

:SM4.2K-DWR
set name=System Menu 4.2K with Dark Wii Red Theme - %effect%
set wadname=SystemMenu_4.2K_v486_DarkWiiRed_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=c9a7689d80c927b251ce066113a5577e
if /i "%effect%" EQU "Spin" set md5=3ecae3eaa04f542797c49444d8fc592a
if /i "%effect%" EQU "Fast-Spin" set md5=f883fd8a53fcbb12d3176036f9828965
set md5alt=%md5%
set basewad=SystemMenu_4.2K_v486
set basecios=%basewad%
set md5base=d225a6ff7130ea4cc63638b0d38a54e7
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=4-X_DarkWii_Red_KOR.mym
set md5mym1=cd208dd893c972a61bcd18612b6fe37b
set version=486
set lastbasemodule=00000001
set category=SMTHEME
goto:DBend

:SM4.1K-DWR
set name=System Menu 4.1K with Dark Wii Red Theme - %effect%
set wadname=SystemMenu_4.1K_v454_DarkWiiRed_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=593a209c9653c54a430db4d99416052f
if /i "%effect%" EQU "Spin" set md5=ad7726ac26d4e67d1e3e3d2db5179ad8
if /i "%effect%" EQU "Fast-Spin" set md5=61a3d424e5ff2810ce63fad79d73e958
set md5alt=%md5%
set basewad=SystemMenu_4.1K_v454
set basecios=%basewad%
set md5base=6326365089b5d71f36907f7315364a5f
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=4-X_DarkWii_Red_KOR.mym
set md5mym1=cd208dd893c972a61bcd18612b6fe37b
set version=454
set lastbasemodule=00000001
set category=SMTHEME
goto:DBend

:SM4.3U-DWG
set name=System Menu 4.3U with Dark Wii Green Theme - %effect%
set wadname=SystemMenu_4.3U_v513_DarkWiiGreen_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=c4bac7c8459495951cdf8be6904f77c9
if /i "%effect%" EQU "Spin" set md5=d72bdbb4b41cd52899ee371c58b887ff
if /i "%effect%" EQU "Fast-Spin" set md5=70f781f4ad9f9181a630902995d473e8
set md5alt=%md5%
set basewad=SystemMenu_4.3U_v513
set basecios=%basewad%
set md5base=417358284cce02dbb0fed3ef30b0b59d
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=4-X_DarkWii_green_NTSC.mym
set md5mym1=57b80bcb73780514588396de33f4ced0
set version=513
set lastbasemodule=00000001
set category=SMTHEME
goto:DBend

:SM4.2U-DWG
set name=System Menu 4.2U with Dark Wii Green Theme - %effect%
set wadname=SystemMenu_4.2U_v481_DarkWiiGreen_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=317c3ea0e902d3152bf3f5e301b30b62
if /i "%effect%" EQU "Spin" set md5=c86206c4672fad2369ade338869eb04b
if /i "%effect%" EQU "Fast-Spin" set md5=cbd183974311585e3a5d6a685c6f683f
set md5alt=%md5%
set basewad=SystemMenu_4.2U_v481
set basecios=%basewad%
set md5base=b4eda5b30d090c9256b60441d83c9d65
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=4-X_DarkWii_green_NTSC.mym
set md5mym1=57b80bcb73780514588396de33f4ced0
set version=481
set lastbasemodule=00000001
set category=SMTHEME
goto:DBend

:SM4.1U-DWG
set name=System Menu 4.1U with Dark Wii Green Theme - %effect%
set wadname=SystemMenu_4.1U_v449_DarkWiiGreen_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=3ef33d0252e4b9b7d6aa57d91098a974
if /i "%effect%" EQU "Spin" set md5=7f49af92121d253784c8e823c25a1476
if /i "%effect%" EQU "Fast-Spin" set md5=34a8efdf221bd75be52603dbab2a7d98
set md5alt=%md5%
set basewad=SystemMenu_4.1U_v449
set basecios=%basewad%
set md5base=555d2c0bc92ccd05c6f6a57412ebbd37
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=4-X_DarkWii_green_NTSC.mym
set md5mym1=57b80bcb73780514588396de33f4ced0
set version=449
set lastbasemodule=00000001
set category=SMTHEME
goto:DBend

:SM4.3E-DWG
set name=System Menu 4.3E with Dark Wii Green Theme - %effect%
set wadname=SystemMenu_4.3E_v514_DarkWiiGreen_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=6577c2c8678c5ebdf3fe22e42faf3f5d
if /i "%effect%" EQU "Spin" set md5=6d7741038db43b26752b77c6a78b7709
if /i "%effect%" EQU "Fast-Spin" set md5=873ea1be47124cb0ec8280ba25239816
::md5alt's are from 7.0.3 (not fakesigned but modmii tagged)
if /i "%effect%" EQU "No-Spin" set md5alt=5e39cb21fba828a8190e785b95c8206f
if /i "%effect%" EQU "Spin" set md5alt=545a7745ef945474dd0de9206c304cac
if /i "%effect%" EQU "Fast-Spin" set md5alt=79d6151e19f07772986e0909b3fd6275
set basewad=SystemMenu_4.3E_v514
set basecios=%basewad%
set md5base=cad93ca3ca41704b15bbee95b2e6aae2
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=DarkWii_Green_No-Spin_4.XE_V2.mym
set md5mym1=34c991872b67273307c7bc7aa522b09d
set version=514
set lastbasemodule=00000001
set category=SMTHEME
goto:DBend

:SM4.2E-DWG
set name=System Menu 4.2E with Dark Wii Green Theme - %effect%
set wadname=SystemMenu_4.2E_v482_DarkWiiGreen_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=d43faa475736fa700e40129c51899a29
if /i "%effect%" EQU "Spin" set md5=eaf84b21f1178153b01bc803bf193c21
if /i "%effect%" EQU "Fast-Spin" set md5=dce36807248fe0078f0a1b1983e7d730
::md5alt's are from 7.0.3 (not fakesigned but modmii tagged)
if /i "%effect%" EQU "No-Spin" set md5alt=251d260ea8d2c7162e84a3574a6ec4bc
if /i "%effect%" EQU "Spin" set md5alt=9f90d04ad17d19006209515c76c6c756
if /i "%effect%" EQU "Fast-Spin" set md5alt=d98f173e8cdd68d8fd67ed8d9a7b14b1
set basewad=SystemMenu_4.2E_v482
set basecios=%basewad%
set md5base=efd76ac375914bf5969c74f8fb4fef75
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=DarkWii_Green_No-Spin_4.XE_V2.mym
set md5mym1=34c991872b67273307c7bc7aa522b09d
set version=482
set lastbasemodule=00000001
set category=SMTHEME
goto:DBend

:SM4.1E-DWG
set name=System Menu 4.1E with Dark Wii Green Theme - %effect%
set wadname=SystemMenu_4.1E_v450_DarkWiiGreen_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=36df89ecf38085e760090dacaf6ccb08
if /i "%effect%" EQU "Spin" set md5=13a6131653744a16ab1da12d5a66194a
if /i "%effect%" EQU "Fast-Spin" set md5=d8dd845746cd6dd0e94feaa3fb8edbcf
::md5alt's are from 7.0.3 (not fakesigned but modmii tagged)
if /i "%effect%" EQU "No-Spin" set md5alt=17071d6c0beb781d17f4ac39beaf06c5
if /i "%effect%" EQU "Spin" set md5alt=9cd3cb5665646e8444ef9c86f30ac2cc
if /i "%effect%" EQU "Fast-Spin" set md5alt=97fb3461f3ad86f333809af043ad0b69
set basewad=SystemMenu_4.1E_v450
set basecios=%basewad%
set md5base=d19af34181c46645002efb130f6ea44c
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=DarkWii_Green_No-Spin_4.XE_V2.mym
set md5mym1=34c991872b67273307c7bc7aa522b09d
set version=450
set lastbasemodule=00000001
set category=SMTHEME
goto:DBend

:SM4.3J-DWG
set name=System Menu 4.3J with Dark Wii Green Theme - %effect%
set wadname=SystemMenu_4.3J_v512_DarkWiiGreen_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=01be68fd90063782299aede01515f424
if /i "%effect%" EQU "Spin" set md5=3c02ed3f41224d4c9f2375034a9d1b83
if /i "%effect%" EQU "Fast-Spin" set md5=33b3bc2b25a888cb3b9a7ab8054134b8
set md5alt=%md5%
set basewad=SystemMenu_4.3J_v512
set basecios=%basewad%
set md5base=9552e63c8e0b6688e788639fb1c14e13
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=4-X_DarkWii_green_JAP.mym
set md5mym1=5cfe52f11b20287a6af3e6c4894a76e6
set version=512
set lastbasemodule=00000001
set category=SMTHEME
goto:DBend

:SM4.2J-DWG
set name=System Menu 4.2J with Dark Wii Green Theme - %effect%
set wadname=SystemMenu_4.2J_v480_DarkWiiGreen_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=5224595b042fe1c52cb86954cc7a74a5
if /i "%effect%" EQU "Spin" set md5=4742fa18629f22355b5258f9499053d9
if /i "%effect%" EQU "Fast-Spin" set md5=e4d6f36241f09898b2be665e2e6792ca
set md5alt=%md5%
set basewad=SystemMenu_4.2J_v480
set basecios=%basewad%
set md5base=ffa08cfaf2a9bb4f6adffa812ab535ac
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=4-X_DarkWii_green_JAP.mym
set md5mym1=5cfe52f11b20287a6af3e6c4894a76e6
set version=480
set lastbasemodule=00000001
set category=SMTHEME
goto:DBend

:SM4.1J-DWG
set name=System Menu 4.1J with Dark Wii Green Theme - %effect%
set wadname=SystemMenu_4.1J_v448_DarkWiiGreen_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=054fc6743f6568e8e99147a18460976c
if /i "%effect%" EQU "Spin" set md5=67e0ee01e42385958cab04f9bf9363e6
if /i "%effect%" EQU "Fast-Spin" set md5=3f40b58598c6dd103aee2f8e247701d9
set md5alt=%md5%
set basewad=SystemMenu_4.1J_v448
set basecios=%basewad%
set md5base=5574337ec2c36cd9a9c15b8008ca4dd2
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=4-X_DarkWii_green_JAP.mym
set md5mym1=5cfe52f11b20287a6af3e6c4894a76e6
set version=448
set lastbasemodule=00000001
set category=SMTHEME
goto:DBend


:SM4.3K-DWG
set name=System Menu 4.3K with Dark Wii Green Theme - %effect%
set wadname=SystemMenu_4.3K_v518_DarkWiiGreen_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=735b3fd794ab6ddafe6e187a0733acd7
if /i "%effect%" EQU "Spin" set md5=d79881852e21337a82f3684766a01312
if /i "%effect%" EQU "Fast-Spin" set md5=6c27741df65420e1ec24558cc0c10823
set md5alt=%md5%
set basewad=SystemMenu_4.3K_v518
set basecios=%basewad%
set md5base=775159a42dc1d12b9304fbbbe7415d80
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=4-X_DarkWii_green_KOR.mym
set md5mym1=cd616652a7e52cd2a8f7dda26f574001
set version=518
set lastbasemodule=00000001
set category=SMTHEME
goto:DBend

:SM4.2K-DWG
set name=System Menu 4.2K with Dark Wii Green Theme - %effect%
set wadname=SystemMenu_4.2K_v486_DarkWiiGreen_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=afdd99b52c9bdcfe3823cd7fe2c4633a
if /i "%effect%" EQU "Spin" set md5=5526c6dd74a42ffd2df562e4150600d1
if /i "%effect%" EQU "Fast-Spin" set md5=51a36869873968d83659ec5cc77e7857
set md5alt=%md5%
set basewad=SystemMenu_4.2K_v486
set basecios=%basewad%
set md5base=d225a6ff7130ea4cc63638b0d38a54e7
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=4-X_DarkWii_green_KOR.mym
set md5mym1=cd616652a7e52cd2a8f7dda26f574001
set version=486
set lastbasemodule=00000001
set category=SMTHEME
goto:DBend

:SM4.1K-DWG
set name=System Menu 4.1K with Dark Wii Green Theme - %effect%
set wadname=SystemMenu_4.1K_v454_DarkWiiGreen_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=0ae465e834cf8645ebdb0f996e4c0be7
if /i "%effect%" EQU "Spin" set md5=7f7ddc57862d85fb375739ac3ef0c871
if /i "%effect%" EQU "Fast-Spin" set md5=e265e7d065b1e6535a81deaead6cc3e8
set md5alt=%md5%
set basewad=SystemMenu_4.1K_v454
set basecios=%basewad%
set md5base=6326365089b5d71f36907f7315364a5f
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=4-X_DarkWii_green_KOR.mym
set md5mym1=cd616652a7e52cd2a8f7dda26f574001
set version=454
set lastbasemodule=00000001
set category=SMTHEME
goto:DBend


:MII
set name=MII Channel
set code1=00010002
set code2=48414341
set version=6
set wadname=Mii-Channel-NUS-v6.wad
set md5=3d89880b74b49abd22bbbcab02ad207c
set md5alt=b80a9132acb9f7a84bbfba9307e27ef5
set category=ios
goto:DBend

:PHOTO0
set name=Photo Channel (USA / PAL / JPN / KOR)
set code1=00010002
set code2=48414141
set version=2
set wadname=Photo-Channel-1.0-NUS-v2.wad
set md5=bb7e7d0ca163240874ab381ea13d3ad1
set md5alt=b12db87c39992f8cd5bd15b1a525986e
set category=ios
goto:DBend

:HAZA
set name=Photo Channel 1.1 dummy (HAZA)
set code1=00010002
set code2=48414141
set version=2
set wadname=Photo-Channel-1.1-dummy-HAZA.wad
set md5=3066796c54bde03968248bd87383d40f
set md5alt=%md5%
set category=ios
goto:DBend

:PHOTO
set name=Photo Channel 1.1 (USA / PAL / JPN)
set code1=00010002
set code2=48415941
set version=3
set wadname=Photo-Channel-1.1-NUS-v3.wad
set md5=e356285d36e8884932f11a3048878615
set md5alt=d984bd492164ac186aab4118c5006121
set category=ios
goto:DBend

:PHOTOK
set name=Photo Channel 1.1 (KOR)
set code1=00010002
set code2=4841594B
set version=3
set wadname=Photo-Channel-1.1-NUS-v3[K].wad
set md5=a3aa49e803fe297c0e23dd2d6a1467b3
set md5alt=a991615b0060d46aa885ba4d5f8300fa
set category=ios
goto:DBend

:SHOP
set name=Shopping Channel (USA / PAL / JPN)
set code1=00010002
set code2=48414241
set version=21
set wadname=Shopping-Channel-NUS-v21.wad
set md5=4ceaed3ebb1d5f6de9058bcd9cd6122c
set md5alt=c2132b69faa90ce2ca201c1ad9f89576
set category=ios
goto:DBend

:SHOP_K
set name=Shopping Channel (KOR)
set code1=00010002
set code2=4841424B
set version=21
set wadname=Shopping-Channel-NUS-v21[K].wad
set md5=fe985074c998aced712da2e7f1f7cb23
set md5alt=94a86775d599a78f20a12089c17eaa5e
set category=ios
goto:DBend

:NET_U
set name=USA Internet Channel
set code1=00010001
set code2=48414445
set version=1024
set wadname=Opera-Internet-Channel-NUS[U].wad
set md5=31f0863c7f904b3a1b18e66b727d55ee
set md5alt=d1fc41783118c2f248f5e7481a8921d8
set category=ios
goto:DBend

:NET_E
set name=PAL Internet Channel
set code1=00010001
set code2=48414450
set version=1024
set wadname=Opera-Internet-Channel-NUS[E].wad
set md5=23dcef3d269add05f357f827c5aa5004
set md5alt=5a4b5f47029fa6fb3ba1622b36b69838
set category=ios
goto:DBend

:NET_J
set name=JPN Internet Channel
set code1=00010001
set code2=4841444A
set version=1024
set wadname=Opera-Internet-Channel-NUS[J].wad
set md5=298a9026dbb4d74aebdfd7256bfdbc0a
set md5alt=9f767b0e9b980e169bf2d8ee4bbbc4ae
set category=ios
goto:DBend

:WEATHER_U
set name=USA Weather Channel
set code1=00010002
set code2=48414645
set version=7
set wadname=Weather-Channel-NUS-v7[U].wad
set md5=50691a80d1f1ae575bdf31ffe086a232
set md5alt=874be88e46fbdafaa8e8f5a3b63dae99
set category=ios
goto:DBend

:WEATHER_E
set name=PAL Weather Channel
set code1=00010002
set code2=48414650
set version=7
set wadname=Weather-Channel-NUS-v7[E].wad
set md5=1c3f08ec91ac3169c3408dd19aef4fd7
set md5alt=2364bf4bd620b639cff8556c4b48fe7b
set category=ios
goto:DBend

:WEATHER_J
set name=JPN Weather Channel
set code1=00010002
set code2=4841464A
set version=7
set wadname=Weather-Channel-NUS-v7[J].wad
set md5=3761cc3f3679427950951cc0da11a724
set md5alt=9c248cc65f9b1a268009e4e127cbb68e
set category=ios
goto:DBend

:NEWS_U
set name=USA NEWS Channel
set code1=00010002
set code2=48414745
set version=7
set wadname=NEWS-Channel-NUS-v7[U].wad
set md5=7ccb0d36c06bc627adce8a0687279940
set md5alt=13cd59cf991d930edd70673e5ad44d5c
set category=ios
goto:DBend

:NEWS_E
set name=PAL NEWS Channel
set code1=00010002
set code2=48414750
set version=7
set wadname=NEWS-Channel-NUS-v7[E].wad
set md5=546905b5b8d3293aa6b3545bd0cb2b8b
set md5alt=8bee05c6ab9a8f04e569866bfee39142
set category=ios
goto:DBend

:NEWS_J
set name=JPN NEWS Channel
set code1=00010002
set code2=4841474A
set version=7
set wadname=NEWS-Channel-NUS-v7[J].wad
set md5=9552d4fb56dd356e90c351b7d8bb1a6d
set md5alt=2fa82e84fbc57d786b8ec1f4b0c305ca
set category=ios
goto:DBend

:SPEAK_U
set name=USA Wii Speak Channel
set code1=00010001
set code2=48434645
set version=512
set wadname=Wii-Speak-Channel-NUS[U].wad
set md5=fc917f85a45191540cc9c55cd892c64f
set md5alt=cc6c5209d091b16670f7ba3c9d9e35b2
set category=ios
goto:DBend

:SPEAK_E
set name=PAL Wii Speak Channel
set code1=00010001
set code2=48434650
set version=512
set wadname=Wii-Speak-Channel-NUS[E].wad
set md5=6e4bd89a8fbf8364403243e627267d97
set md5alt=16499f03ae0ea2a5b09c9bf12cc07ce4
set category=ios
goto:DBend

:SPEAK_J
set name=JPN Wii Speak Channel
set code1=00010001
set code2=4843464A
set version=512
set wadname=Wii-Speak-Channel-NUS[J].wad
set md5=8acf79241ba59168a58047045bc71167
set md5alt=63891a2739cb57390791053f103ce9b4
set category=ios
goto:DBend

:WSK
set name=KOR Wii Speak Channel
set code1=00010001
set code2=4843464B
set version=512
set wadname=Wii-Speak-Channel-NUS[K].wad
set md5=31b2a3af9ea5f59e6c2815dee094bf0b
set "md5alt=%md5%"
set category=ios
goto:DBend


:SomeStubIOSs
set "name=Some Stub IOSs (%STUBSlist%)"
set code1=00000001
set code2=00000010
set version=512
set wadname=STUB-IOS16-64-v512.wad
set md5=3c3431b05c47453151a9858c87f1a8af
set md5alt=%md5%
set category=STUBS
goto:DBend


:IOS9
set name=IOS9 v1034
set code1=00000001
set code2=00000009
set version=1034
set wadname=IOS9-64-v1034.wad
set md5=33be0e937ee06cba5f0cce0fd1f4a3be
set md5alt=%md5%
set category=ios
goto:DBend

:IOS12
set name=IOS12 v526
set code1=00000001
set code2=0000000C
set version=526
set wadname=IOS12-64-v526.wad
set md5=c43fcedb40104ca5c1c7d6f484449f04
set md5alt=%md5%
set category=ios
goto:DBend

:IOS13
set name=IOS13 v1032
set code1=00000001
set code2=0000000D
set version=1032
set wadname=IOS13-64-v1032.wad
set md5=77b7c50b0337e2422c10aa91ec574aa9
set md5alt=%md5%
set category=ios
goto:DBend

:IOS14
set name=IOS14 v1032
set code1=00000001
set code2=0000000E
set version=1032
set wadname=IOS14-64-v1032.wad
set md5=1627eb56a290a67a46ea4985835ad630
set md5alt=%md5%
set category=ios
goto:DBend

:IOS15
set name=IOS15 v1032
set code1=00000001
set code2=0000000F
set version=1032
set wadname=IOS15-64-v1032.wad
set md5=c20d5851e84db40c31c3cc1f3646b2da
set md5alt=%md5%
set category=ios
goto:DBend


:IOS17
set name=IOS17 v1032
set code1=00000001
set code2=00000011
set version=1032
set wadname=IOS17-64-v1032.wad
set md5=8c789cea9676eb67fdd52e975638be6d
set md5alt=%md5%
set category=ios
goto:DBend

:IOS21
set name=IOS21 v1039
set code1=00000001
set code2=00000015
set version=1039
set wadname=IOS21-64-v1039.wad
set md5=5530a07b422c86d15b91278a470c6da0
set md5alt=%md5%
set category=ios
goto:DBend

:IOS22
set name=IOS22 v1294
set code1=00000001
set code2=00000016
set version=1294
set wadname=IOS22-64-v1294.wad
set md5=855154c8f39ef2c73e37ecaaff86ee1d
set md5alt=%md5%
set category=ios
goto:DBend

:IOS28
set name=IOS28 v1807
set code1=00000001
set code2=0000001C
set version=1807
set wadname=IOS28-64-v1807.wad
set md5=fb6bd3ac4257ac265f9edf725a2fc6bd
set md5alt=%md5%
set category=ios
goto:DBend

:IOS30
set name=IOS30 v2576
set code1=00000001
set code2=0000001E
set version=2576
set wadname=IOS30-64-v2576.wad
set md5=d855565406a81091be748eb492abe951
set md5alt=%md5%
set category=ios
goto:DBend


:IOS31
set name=IOS31 v3608
set code1=00000001
set code2=0000001F
set version=3608
set wadname=IOS31-64-v3608.wad
set md5=7908ce72ed970b9610d817dd71807a84
set md5alt=%md5%
set category=ios
goto:DBend

:IOS33
set name=IOS33 v3608
set code1=00000001
set code2=00000021
set version=3608
set wadname=IOS33-64-v3608.wad
set md5=2197541b2ae449e47c0d2f2aa5212482
set md5alt=%md5%
set category=ios
goto:DBend

:IOS34
set name=IOS34 v3608
set code1=00000001
set code2=00000022
set version=3608
set wadname=IOS34-64-v3608.wad
set md5=45c8038eb6b8c493b07b041d8aaff896
set md5alt=%md5%
set category=ios
goto:DBend

:IOS35
set name=IOS35 v3608
set code1=00000001
set code2=00000023
set version=3608
set wadname=IOS35-64-v3608.wad
set md5=a401590a69abe7fc7f254e1ed238c371
set md5alt=%md5%
set category=ios
goto:DBend

:IOS36
set name=IOS36 v3351
set code1=00000001
set code2=00000024
set version=3351
set wadname=IOS36-64-v3351.wad
set md5=de893c7ff25c20d1311357f1a6828ecc
set md5alt=%md5%
set category=ios
goto:DBend

:IOS36v3608
set name=IOS36 v3608
set code1=00000001
set code2=00000024
set version=3608
set wadname=IOS36-64-v3608.wad
set md5=5db360f18cb475059100b139fe471958
set md5alt=%md5%
set category=ios
goto:DBend



:IOS37
set name=IOS37 v5663
set code1=00000001
set code2=00000025
set version=5663
set wadname=IOS37-64-v5663.wad
set md5=da6fae25d0ff2b076e059093b4b88b2b
set md5alt=%md5%
set category=ios
goto:DBend

:IOS38
set name=IOS38 v4124
set code1=00000001
set code2=00000026
set version=4124
set wadname=IOS38-64-v4124.wad
set md5=769d98bebf9f8409133d1da7f6a4f6a0
set md5alt=%md5%
set category=ios
goto:DBend

:IOS41
set name=IOS41 v3607
set code1=00000001
set code2=00000029
set version=3607
set wadname=IOS41-64-v3607.wad
set md5=84af995f6a7a7da32d8dd513d6eff603
set md5alt=%md5%
set category=ios
goto:DBend




:IOS43
set name=IOS43 v3607
set code1=00000001
set code2=0000002B
set version=3607
set wadname=IOS43-64-v3607.wad
set md5=f8903a8cc94784239898e810f6f68be1
set md5alt=%md5%
set category=ios
goto:DBend

:IOS45
set name=IOS45 v3607
set code1=00000001
set code2=0000002D
set version=3607
set wadname=IOS45-64-v3607.wad
set md5=541cb29157dc2035b366f1bc8f1c55e7
set md5alt=%md5%
set category=ios
goto:DBend

:IOS46
set name=IOS46 v3607
set code1=00000001
set code2=0000002E
set version=3607
set wadname=IOS46-64-v3607.wad
set md5=bb7b801f4288871fa6dbdeface72fe67
set md5alt=%md5%
set category=ios
goto:DBend


:IOS48v4124
set name=IOS48 v4124
set code1=00000001
set code2=00000030
set version=4124
set wadname=IOS48-64-v4124.wad
set md5=a0d28633b2a17f43f82b1c28e9e4878e
set md5alt=%md5%
set category=ios
goto:DBend


:IOS53
set name=IOS53 v5663
set code1=00000001
set code2=00000035
set version=5663
set wadname=IOS53-64-v5663.wad
set md5=21920ac5a4b8be7b2eae7afb063706e9
set md5alt=%md5%
set category=ios
goto:DBend

:IOS55
set name=IOS55 v5663
set code1=00000001
set code2=00000037
set version=5663
set wadname=IOS55-64-v5663.wad
set md5=b38d414c959665d1a8f613fd30a3eb02
set md5alt=%md5%
set category=ios
goto:DBend

:IOS56
set name=IOS56 v5662
set code1=00000001
set code2=00000038
set version=5662
set wadname=IOS56-64-v5662.wad
set md5=cb7ea09293b88c6741816449617b454f
set md5alt=%md5%
set category=ios
goto:DBend

:IOS57
set name=IOS57 v5919
set code1=00000001
set code2=00000039
set version=5919
set wadname=IOS57-64-v5919.wad
set md5=eec44c0443caabbb839ddc8e130b433d
set md5alt=%md5%
set category=ios
goto:DBend


:IOS58
set name=IOS58 v6176
set code1=00000001
set code2=0000003A
set version=6176
set wadname=IOS58-64-v6176.wad
set md5=e085bc2eb900c135a4b198cff0322289
set md5alt=%md5%
set category=ios
goto:DBend


:IOS59
set name=IOS59 v9249
set code1=00000001
set code2=0000003B
set version=9249
set wadname=IOS59-64-v9249.wad
set md5=94b7632afd80c7a7360c52103028b10a
set md5alt=%md5%
set category=ios
goto:DBend

:IOS60
set name=IOS60 v6174
set code1=00000001
set code2=0000003C
set version=6174
set wadname=IOS60-64-v6174.wad
set md5=631238cee654c276a134678c7f32f4df
set md5alt=%md5%
set category=ios
goto:DBend


:IOS60P
set name=IOS60v65535(ModMii-IOS60-v6174)
set code1=00000001
set code2=0000003C
set version=6174
set wadname=IOS60v65535(ModMii-IOS60-v6174)
set md5=30bb5720fd63493b010da3c0607cc667
::set md5=1fdb221206de3f369fdd5ead01d011a1
set md5alt=5649d0a5d7d822c0217fd378e8808d79
set ciosslot=60
set ciosversion=65535
set category=patchios
set basewad=IOS60-64-v6174
set md5base=631238cee654c276a134678c7f32f4df
set md5basealt=%md5base%
set basecios=IOS60v65535(ModMii-IOS60-v6174)
set diffpath=IOS60v16174(IOS60v6174[FS-ES-NP-VP-DIP])
set code2new=0000003C
set lastbasemodule=0000000e
set cIOSFamilyName=ModMii-IOS60
set cIOSversionNum=6174
goto:DBend



::IOS60 installed to a bunch of different SM IOS slots for brick protection
:IOS11P60
set name=IOS11v65535(ModMii-IOS60-v6174)
set code1=00000001
set code2=0000003C
set version=6174
set wadname=IOS11v65535(ModMii-IOS60-v6174).wad
::set md5=a71e1b750f1cb530f8a2b6408bc90f7d
set md5=d752f4bc191a3c3120447bb3ad34e470
set md5alt=f9a7e0d74c1f6aff24bd1be482bd40f9
set ciosslot=11
set ciosversion=65535
set category=patchios
set basewad=IOS60-64-v6174
set md5base=631238cee654c276a134678c7f32f4df
set md5basealt=%md5base%
set basecios=IOS60v65535(ModMii-IOS60-v6174)
set diffpath=IOS60v16174(IOS60v6174[FS-ES-NP-VP-DIP])
set code2new=0000003C
set lastbasemodule=0000000e
set cIOSFamilyName=ModMii-IOS60
set cIOSversionNum=6174
goto:DBend



:IOS20P60
set name=IOS20v65535(ModMii-IOS60-v6174)
set code1=00000001
set code2=0000003C
set version=6174
set wadname=IOS20v65535(ModMii-IOS60-v6174).wad
::set md5=200e0e9378ef91b0ffac0b29d1b15951
set md5=8f71c72daa06061e589a7dfd3757bb63
set md5alt=15ea023154e1e919da8f6495d93f00c6
set ciosslot=20
set ciosversion=65535
set category=patchios
set basewad=IOS60-64-v6174
set md5base=631238cee654c276a134678c7f32f4df
set md5basealt=%md5base%
set basecios=IOS60v65535(ModMii-IOS60-v6174)
set diffpath=IOS60v16174(IOS60v6174[FS-ES-NP-VP-DIP])
set code2new=0000003C
set lastbasemodule=0000000e
set cIOSFamilyName=ModMii-IOS60
set cIOSversionNum=6174
goto:DBend



:IOS30P60
set name=IOS30v65535(ModMii-IOS60-v6174)
set code1=00000001
set code2=0000003C
set version=6174
set wadname=IOS30v65535(ModMii-IOS60-v6174).wad
::set md5=c5b0cd2758a1b0a6772ae348d48bfecb
set md5=afab9606d09ca3f574f4f8208f2f14c4
set md5alt=45410c3fa1bafb141405a6c2a7b441b5
set ciosslot=30
set ciosversion=65535
set category=patchios
set basewad=IOS60-64-v6174
set md5base=631238cee654c276a134678c7f32f4df
set md5basealt=%md5base%
set basecios=IOS60v65535(ModMii-IOS60-v6174)
set diffpath=IOS60v16174(IOS60v6174[FS-ES-NP-VP-DIP])
set code2new=0000003C
set lastbasemodule=0000000e
set cIOSFamilyName=ModMii-IOS60
set cIOSversionNum=6174
goto:DBend

:IOS40P60
set name=IOS40v65535(ModMii-IOS60-v6174)
set code1=00000001
set code2=0000003C
set version=6174
set wadname=IOS40v65535(ModMii-IOS60-v6174).wad
::set md5=b5b459d7eb6050d7ab1820d2307746c0
set md5=c53d4d5d3a51cacc56e921a13d404417
set md5alt=8a624b0eb68fda1b0166f2dcde459230
set ciosslot=40
set ciosversion=65535
set category=patchios
set basewad=IOS60-64-v6174
set md5base=631238cee654c276a134678c7f32f4df
set md5basealt=%md5base%
set basecios=IOS60v65535(ModMii-IOS60-v6174)
set diffpath=IOS60v16174(IOS60v6174[FS-ES-NP-VP-DIP])
set code2new=0000003C
set lastbasemodule=0000000e
set cIOSFamilyName=ModMii-IOS60
set cIOSversionNum=6174
goto:DBend


:IOS70K
set name=IOS70v65535(ModMii-IOS60-v6174)
set code1=00000001
set code2=0000003C
set version=6174
set wadname=IOS70v65535(ModMii-IOS60-v6174).wad
::set md5=fd26bcf8c2bfcf3c6ecb0b08d63f91b7
set md5=32dda196655bd76dff44673fc31e4ab7
set md5alt=0db464a0ed32a7ab26a7c2629d5dd49c
set ciosslot=70
set ciosversion=65535
set category=patchios
set basewad=IOS60-64-v6174
set md5base=631238cee654c276a134678c7f32f4df
set md5basealt=%md5base%
set basecios=IOS60v65535(ModMii-IOS60-v6174)
set diffpath=IOS60v16174(IOS60v6174[FS-ES-NP-VP-DIP])
set code2new=0000003C
set lastbasemodule=0000000e
set cIOSFamilyName=ModMii-IOS60
set cIOSversionNum=6174
goto:DBend


:IOS80K
set name=IOS80v65535(ModMii-IOS60-v6174)
set code1=00000001
set code2=0000003C
set version=6174
set wadname=IOS80v65535(ModMii-IOS60-v6174).wad
::set md5=dbff8708d9d37692a3ac3c5a58df7a03
set md5=1bb07709fbcacbf3f62afe5aabb41bb0
set md5alt=ae7b44a0e7e2345fc82bac6807e0c339
set ciosslot=80
set ciosversion=65535
set category=patchios
set basewad=IOS60-64-v6174
set md5base=631238cee654c276a134678c7f32f4df
set md5basealt=%md5base%
set basecios=IOS60v65535(ModMii-IOS60-v6174)
set diffpath=IOS60v16174(IOS60v6174[FS-ES-NP-VP-DIP])
set code2new=0000003C
set lastbasemodule=0000000e
set cIOSFamilyName=ModMii-IOS60
set cIOSversionNum=6174
goto:DBend


:IOS50P
set name=IOS50v65535(ModMii-IOS60-v6174)
set code1=00000001
set code2=0000003C
set version=6174
set wadname=IOS50v65535(ModMii-IOS60-v6174).wad
::set md5=c652e60f53e690a39a553ccdb1d3f635
set md5=6dacf4ad6c520b7914bd2ef9c5c0d7b4
set md5alt=324a50895fabf118650754505716b52b
set ciosslot=50
set ciosversion=65535
set category=patchios
set basewad=IOS60-64-v6174
set md5base=631238cee654c276a134678c7f32f4df
set md5basealt=%md5base%
set basecios=IOS60v65535(ModMii-IOS60-v6174)
set diffpath=IOS60v16174(IOS60v6174[FS-ES-NP-VP-DIP])
set code2new=0000003C
set lastbasemodule=0000000e
set cIOSFamilyName=ModMii-IOS60
set cIOSversionNum=6174
goto:DBend


:IOS52P
set name=IOS52v65535(ModMii-IOS60-v6174)
set code1=00000001
set code2=0000003C
set version=6174
set wadname=IOS52v65535(ModMii-IOS60-v6174).wad
::set md5=9e8776990d02f9fb2911b3201c3a4d9a
set md5=9809b51c766bb2fe5cf429e2d5053a67
set md5alt=f27624eeaafa8060f34956a311331ef8
set ciosslot=52
set ciosversion=65535
set category=patchios
set basewad=IOS60-64-v6174
set md5base=631238cee654c276a134678c7f32f4df
set md5basealt=%md5base%
set basecios=IOS60v65535(ModMii-IOS60-v6174)
set diffpath=IOS60v16174(IOS60v6174[FS-ES-NP-VP-DIP])
set code2new=0000003C
set lastbasemodule=0000000e
set cIOSFamilyName=ModMii-IOS60
set cIOSversionNum=6174
goto:DBend


:IOS61
set name=IOS61 v5662
set code1=00000001
set code2=0000003D
set version=5662
set wadname=IOS61-64-v5662.wad
set md5=393c67826119e5375c9449fe957da1ed
set md5alt=%md5%
set category=ios
goto:DBend


:IOS62
set name=IOS62 v6430
set code1=00000001
set code2=0000003E
set version=6430
set wadname=IOS62-64-v6430.wad
set md5=631d8759dd68f83425167dc3295c1f38
set md5alt=%md5%
set category=ios
goto:DBend


:IOS70
set name=IOS70 v6687
set code1=00000001
set code2=00000046
set version=6687
set wadname=IOS70-64-v6687.wad
set md5=ace10fdbad63fe10362543e56ae5081f
set md5alt=%md5%
set category=ios
goto:DBend


:IOS80
set name=IOS80 v6944
set code1=00000001
set code2=00000050
set version=6944
set wadname=IOS80-64-v6944.wad
set md5=a845fbe6d788f3a5c65ce624096150f4
set md5alt=%md5%
set category=ios
goto:DBend



:IOS236
set name=IOS236v65535(IOS36v3351[FS-ES-NP-VP])
set code1=00000001
set code2=00000024
set version=3351
set wadname=IOS236v65535(IOS36v3351[FS-ES-NP-VP]).wad
::set md5=2988673ba949020dc0b725482fea3d40
set md5=2988673ba949020dc0b725482fea3d40
set md5alt=0e29e89a3ca456813a6af4dee27c348a
set ciosslot=236
set ciosversion=65535
set basewad=IOS36-64-v3351
set md5base=de893c7ff25c20d1311357f1a6828ecc
set md5basealt=%md5base%
set basecios=IOS236v65535(IOS36v3351[FS-ES-NP-VP])
set cIOSFamilyName=rev 3351
set diffpath=cIOS236
set code2new=000000ec
set lastbasemodule=0000000e
set code2new=000000ec
goto:DBend


:M10
set name=MIOS v10
set code1=00000001
set code2=00000101
set version=10
set wadname=RVL-mios-v10.wad
set md5=2359fe4eca6a25d84326e9da610576a6
set md5alt=%md5%
set category=ios
goto:DBend


:NUSGRABBER0e
set name=0000000e.app from IOS80 v6943 (SNEEK)
::set code1=SNEEKAPP
::set code2=APP
::set version=0e
set category=NusdApp
set code1=00000001
set code2=00000050
set version=6943
set dlname=0000000e.app
set wadname=0000000e_IOS80.app
set "filename=%wadname%"
set path1=SNEEKFILES\
set md5=4b3ad6d33707d55ec27583a84b2ecf2a
set md5alt=%md5%
goto:DBend


:NUSGRABBER01_60
set name=00000001.app from IOS60 v6174 (SNEEK)
::set code1=SNEEKAPP
::set code2=APP
::set version=01_60
set category=NusdApp
set code1=00000001
set code2=0000003C
set version=6174
set dlname=00000001.app
set wadname=00000001_IOS60.app
set "filename=%wadname%"
set path1=SNEEKFILES\
set md5=48e1be8f767feb59cbc51aa4329d735a
set md5alt=%md5%
goto:DBend

:NUSGRABBER0c
set name=0000000c.app from MIOS v10 (DIOS MIOS)
::set code1=SNEEKAPP
::set code2=APP
::set version=0c
set category=NusdApp
set code1=00000001
set code2=00000101
set version=10
set dlname=0000000c.app
set wadname=0000000c.app
set "filename=%wadname%"
set path1=SNEEKFILES\
set md5=42634040d7cbb53057c577ec4c3c63f8
set md5alt=%md5%
goto:DBend


:NUSGRABBER78
set name=Theme content from System Menu 4.1J (00000078.app)
::set code1=MYMAPP
::set code2=APP
::set version=78
set category=NusdApp
set code1=00000001
set code2=00000002
set version=448
set dlname=00000078.app
set wadname=00000078_4.1J.app
set "filename=%wadname%"
set path1=themes\
set md5=f2eadf12d18e793373060222b870057d
set md5alt=%md5%
goto:DBend

:NUSGRABBER81
set name=Theme content from System Menu 4.1K (00000081.app)
::set code1=MYMAPP
::set code2=APP
::set version=81
set category=NusdApp
set code1=00000001
set code2=00000002
set version=454
set dlname=00000081.app
set wadname=00000081_4.1K.app
set "filename=%wadname%"
set path1=themes\
set md5=7eedbf1a146b29b63edbb55e04f81f98
set md5alt=%md5%
goto:DBend

:NUSGRABBER7b
set name=Theme content from System Menu 4.1U (0000007b.app)
::set code1=MYMAPP
::set code2=APP
::set version=7b
set category=NusdApp
set code1=00000001
set code2=00000002
set version=449
set dlname=0000007b.app
set wadname=0000007b_4.1U.app
set "filename=%wadname%"
set path1=themes\
set md5=6b939de8222800733f4c44ae4eadb325
set md5alt=%md5%
goto:DBend

:NUSGRABBER7e
set name=Theme content from System Menu 4.1E (0000007e.app)
::set code1=MYMAPP
::set code2=APP
::set version=7e
set category=NusdApp
set code1=00000001
set code2=00000002
set version=450
set dlname=0000007e.app
set wadname=0000007e_4.1E.app
set "filename=%wadname%"
set path1=themes\
set md5=574a3a144971ea0ec61bf8cef8d7ff80
set md5alt=%md5%
goto:DBend

:NUSGRABBER84
set name=Theme content from System Menu 4.2J (00000084.app)
::set code1=MYMAPP
::set code2=APP
::set version=84
set category=NusdApp
set code1=00000001
set code2=00000002
set version=480
set dlname=00000084.app
set wadname=00000084_4.2J.app
set "filename=%wadname%"
set path1=themes\
set md5=b08998e582c48afba3a14f6d9e1e9373
set md5alt=%md5%
goto:DBend

:NUSGRABBER87
set name=Theme content from System Menu 4.2U (00000087.app)
::set code1=MYMAPP
::set code2=APP
::set version=87
set category=NusdApp
set code1=00000001
set code2=00000002
set version=481
set dlname=00000087.app
set wadname=00000087_4.2U.app
set "filename=%wadname%"
set path1=themes\
set md5=7079948c6aed8aae6009e4fdf27c7171
set md5alt=%md5%
goto:DBend

:NUSGRABBER8a
set name=Theme content from System Menu 4.2E (0000008a.app)
::set code1=MYMAPP
::set code2=APP
::set version=8a
set category=NusdApp
set code1=00000001
set code2=00000002
set version=482
set dlname=0000008a.app
set wadname=0000008a_4.2E.app
set "filename=%wadname%"
set path1=themes\
set md5=7e7994f78941afb51e9a20085deac305
set md5alt=%md5%
goto:DBend


:NUSGRABBER8d
set name=Theme content from System Menu 4.2K (0000008d.app)
::set code1=MYMAPP
::set code2=APP
::set version=8d
set category=NusdApp
set code1=00000001
set code2=00000002
set version=486
set dlname=0000008d.app
set wadname=0000008d_4.2K.app
set "filename=%wadname%"
set path1=themes\
set md5=9d72a1966370e44cb4c456c17a077bec
set md5alt=%md5%
goto:DBend


:NUSGRABBER94
set name=Theme content from System Menu 4.3J (00000094.app)
::set code1=MYMAPP
::set code2=APP
::set version=94
set category=NusdApp
set code1=00000001
set code2=00000002
set version=512
set dlname=00000094.app
set wadname=00000094_4.3J.app
set "filename=%wadname%"
set path1=themes\
set md5=5b3ee6942a3cda716badbce3665076fc
set md5alt=%md5%
goto:DBend

:NUSGRABBER97
set name=Theme content from System Menu 4.3U (00000097.app)
::set code1=MYMAPP
::set code2=APP
::set version=97
set category=NusdApp
set code1=00000001
set code2=00000002
set version=513
set dlname=00000097.app
set wadname=00000097_4.3U.app
set "filename=%wadname%"
set path1=themes\
set md5=f388c9b11543ac2fe0912ab96064ee37
set md5alt=%md5%
goto:DBend

:NUSGRABBER9a
set name=Theme content from System Menu 4.3E (0000009a.app)
::set code1=MYMAPP
::set code2=APP
::set version=9a
set category=NusdApp
set code1=00000001
set code2=00000002
set version=514
set dlname=0000009a.app
set wadname=0000009a_4.3E.app
set "filename=%wadname%"
set path1=themes\
set md5=41310f79497c56850c37676074ee1237
set md5alt=%md5%
goto:DBend


:NUSGRABBER9d
set name=Theme content from System Menu 4.3K (0000009d.app)
::set code1=MYMAPP
::set code2=APP
::set version=9d
set category=NusdApp
set code1=00000001
set code2=00000002
set version=518
set dlname=0000009d.app
set wadname=0000009d_4.3K.app
set "filename=%wadname%"
set path1=themes\
set md5=e6f2b0d4d5e0c095895f186009bf9516
set md5alt=%md5%
goto:DBend


:A1c
set name=Theme content from vWii System Menu 4.3J (0000001c.app)
set category=NusdApp
set code1=00000007
set code2=00000002
set version=608
set dlname=0000001c.app
set wadname=0000001c_4.3J_vWii.app
set "filename=%wadname%"
set path1=themes\
set md5=d6d6c4e315d499ac48f34e2eb523746d
set md5alt=%md5%
goto:DBend


:A1f
set name=Theme content from vWii System Menu 4.3U (0000001f.app)
set category=NusdApp
set code1=00000007
set code2=00000002
set version=609
set dlname=0000001f.app
set wadname=0000001f_4.3U_vWii.app
set "filename=%wadname%"
set path1=themes\
set md5=18e44d5ccab69896ea12b6d98614bb64
set md5alt=%md5%
goto:DBend

:A22
set name=Theme content from vWii System Menu 4.3E (00000022.app)
set category=NusdApp
set code1=00000007
set code2=00000002
set version=610
set dlname=00000022.app
set wadname=00000022_4.3E_vWii.app
set "filename=%wadname%"
set path1=themes\
set md5=f5292af0218bdee99e8e61548178a87d
set md5alt=%md5%
goto:DBend


:A0d
set name=0000000d.app from vWii IOS80 v7200 (SNEEK)
set category=NusdApp
set code1=00000007
set code2=00000050
set version=7200
set dlname=0000000d.app
set wadname=0000000d_IOS80_vWii.app
set "filename=%wadname%"
set path1=SNEEKFILES\
set md5=e91a3ff336da5ffb46871fcc1cd72311
set md5alt=%md5%
goto:DBend


:vSM4.3U
set name=System Menu 4.3U vWii (5.2.0)
set code1=00000007
set code2=00000002
set version=609
set wadname=SystemMenu_4.3U_v609_vWii.wad
set md5=68acf76143eaff141d45b07b6c6672f6
set md5alt=%md5%
set category=ios
goto:DBend

:vSM4.3E
set name=System Menu 4.3E vWii (5.2.0)
set code1=00000007
set code2=00000002
set version=610
set wadname=SystemMenu_4.3E_v610_vWii.wad
set md5=87c64187d8414490f6db9ef80f1b7c83
set md5alt=%md5%
set category=ios
goto:DBend

:vSM4.3J
set name=System Menu 4.3J vWii (5.2.0)
set code1=00000007
set code2=00000002
set version=608
set wadname=SystemMenu_4.3J_v608_vWii.wad
set md5=22d1a6cc9a0c0967ef47322c30790e01
set md5alt=%md5%
set category=ios
goto:DBend

:BCnand
set name=BC NAND vWii
set code1=00000007
set code2=00000200
set version=7
set wadname=BC-NAND-NUS-v7-vWii.wad
set md5=2bf9e6b65fc28b95e9144e11075a1cc4
set md5alt=%md5%
set category=ios
goto:DBend

:BCwfs
set name=BC WFS vWii
set code1=00000007
set code2=00000201
set version=1
set wadname=BC-WFS-NUS-v1-vWii.wad
set md5=a2af6dc815700f1c2ba70ebba75dfffe
set md5alt=%md5%
set category=ios
goto:DBend

::Region select may not be needed for vWii Emunands...

:vRSU
set name=vWii Region Select v2 (USA)
set code1=00070008
set code2=48414C45
set version=2
set wadname=vWii-Region-Select-NUS-v2[U].wad
set md5=cdb0e5d4321486db78d57c09d2d70761
set md5alt=%md5%
set category=ios
goto:DBend

:vRSE
set name=vWii Region Select v2 (PAL)
set code1=00070008
set code2=48414C50
set version=2
set wadname=vWii-Region-Select-NUS-v2[E].wad
set md5=e45a09cc09904466afb99679a2bc1408
set md5alt=%md5%
set category=ios
goto:DBend

:vRSJ
set name=vWii Region Select v2 (JPN)
set code1=00070008
set code2=48414C4A
set version=2
set wadname=vWii-Region-Select-NUS-v2[J].wad
set md5=4d9f168a71ecb1a340bba0a9b5456c3b
set md5alt=%md5%
set category=ios
goto:DBend

:vIOS9
set name=vIOS9 v1290 vWii
set code1=00000007
set code2=00000009
set version=1290
set wadname=vIOS9-64-v1290-vWii.wad
set md5=b6dbc0e1f4182bc17269b2761d2dc50d
set md5alt=%md5%
set category=ios
goto:DBend

:vIOS12
set name=vIOS12 v782 vWii
set code1=00000007
set code2=0000000C
set version=782
set wadname=vIOS12-64-v782-vWii.wad
set md5=1e0bd8cc339edc74c11da9b54019c5d6
set md5alt=%md5%
set category=ios
goto:DBend

:vIOS13
set name=vIOS13 v1288 vWii
set code1=00000007
set code2=0000000D
set version=1288
set wadname=vIOS13-64-v1288-vWii.wad
set md5=da35829d433f5c8a08a0aaab184fd9eb
set md5alt=%md5%
set category=ios
goto:DBend

:vIOS14
set name=vIOS14 v1288 vWii
set code1=00000007
set code2=0000000E
set version=1288
set wadname=vIOS14-64-v1288-vWii.wad
set md5=6ee86727b021e08a32cd65e6f368fabb
set md5alt=%md5%
set category=ios
goto:DBend

:vIOS15
set name=vIOS15 v1288 vWii
set code1=00000007
set code2=0000000F
set version=1288
set wadname=vIOS15-64-v1288-vWii.wad
set md5=aab661245b35ba1e411275edfc2cb9df
set md5alt=%md5%
set category=ios
goto:DBend

:vIOS17
set name=vIOS17 v1288 vWii
set code1=00000007
set code2=00000011
set version=1288
set wadname=vIOS17-64-v1288-vWii.wad
set md5=967e47fdfa9ce3e33e7e6821894c8487
set md5alt=%md5%
set category=ios
goto:DBend

:vIOS21
set name=vIOS21 v1295 vWii
set code1=00000007
set code2=00000015
set version=1295
set wadname=vIOS21-64-v1295-vWii.wad
set md5=acc87a247ce4e3314a2a8b47efcb6d4f
set md5alt=%md5%
set category=ios
goto:DBend

:vIOS22
set name=vIOS22 v1550 vWii
set code1=00000007
set code2=00000016
set version=1550
set wadname=vIOS22-64-v1550-vWii.wad
set md5=4af6403a8fa4c3f9e7b08e032ca32097
set md5alt=%md5%
set category=ios
goto:DBend

:vIOS28
set name=vIOS28 v2063 vWii
set code1=00000007
set code2=0000001C
set version=2063
set wadname=vIOS28-64-v2063-vWii.wad
set md5=ec593c264f8d2b871f06b814a62f40d9
set md5alt=%md5%
set category=ios
goto:DBend

:vIOS31
set name=vIOS31 v3864 vWii
set code1=00000007
set code2=0000001F
set version=3864
set wadname=vIOS31-64-v3864-vWii.wad
set md5=8f78f87929c9f3d98cad9a7bad6e9179
set md5alt=%md5%
set category=ios
goto:DBend

:vIOS33
set name=vIOS33 v3864 vWii
set code1=00000007
set code2=00000021
set version=3864
set wadname=vIOS33-64-v3864-vWii.wad
set md5=1710937cc7fb7d95ec4cd3261c27f316
set md5alt=%md5%
set category=ios
goto:DBend


:vIOS34
set name=vIOS34 v3864 vWii
set code1=00000007
set code2=00000022
set version=3864
set wadname=vIOS34-64-v3864-vWii.wad
set md5=5fbdbba73752d8dfdf41ff767af86056
set md5alt=%md5%
set category=ios
goto:DBend

:vIOS35
set name=vIOS35 v3864 vWii
set code1=00000007
set code2=00000023
set version=3864
set wadname=vIOS35-64-v3864-vWii.wad
set md5=6d8c8e897ee1497330e84978f6a8a78c
set md5alt=%md5%
set category=ios
goto:DBend

:vIOS36
set name=vIOS36 v3864 vWii
set code1=00000007
set code2=00000024
set version=3864
set wadname=vIOS36-64-v3864-vWii.wad
set md5=e74726e377ac087a332acf0f603c59e8
set md5alt=%md5%
set category=ios
goto:DBend

:vIOS37
set name=vIOS37 v5919 vWii
set code1=00000007
set code2=00000025
set version=5919
set wadname=vIOS37-64-v5919-vWii.wad
set md5=0695a86ef9758ddb339ec4671a53b7b9
set md5alt=%md5%
set category=ios
goto:DBend

:vIOS38
set name=vIOS38 v4380 vWii
set code1=00000007
set code2=00000026
set version=4380
set wadname=vIOS38-64-v4380-vWii.wad
set md5=d90930aad2fed6f356cd3fcf0c0a0b37
set md5alt=%md5%
set category=ios
goto:DBend

:vIOS41
set name=vIOS41 v3863 vWii
set code1=00000007
set code2=00000029
set version=3863
set wadname=vIOS41-64-v3863-vWii.wad
set md5=61e7939e087e90df0e25610675320cd7
set md5alt=%md5%
set category=ios
goto:DBend

:vIOS43
set name=vIOS43 v3863 vWii
set code1=00000007
set code2=0000002B
set version=3863
set wadname=vIOS43-64-v3863-vWii.wad
set md5=c448af570d93f0a9005965f0bab14699
set md5alt=%md5%
set category=ios
goto:DBend

:vIOS45
set name=vIOS45 v3863 vWii
set code1=00000007
set code2=0000002D
set version=3863
set wadname=vIOS45-64-v3863-vWii.wad
set md5=fce7381da7cc241d74a833c6a41a12c9
set md5alt=%md5%
set category=ios
goto:DBend

:vIOS46
set name=vIOS46 v3863 vWii
set code1=00000007
set code2=0000002E
set version=3863
set wadname=vIOS46-64-v3863-vWii.wad
set md5=961a9ea40f2df9836e335be8ecd53634
set md5alt=%md5%
set category=ios
goto:DBend

:vIOS48
set name=vIOS48 v4380 vWii
set code1=00000007
set code2=00000030
set version=4380
set wadname=vIOS48-64-v4380-vWii.wad
set md5=3b9c40070c46e1d8f5b90f5bedf9597f
set md5alt=%md5%
set category=ios
goto:DBend

:vIOS53
set name=vIOS53 v5919 vWii
set code1=00000007
set code2=00000035
set version=5919
set wadname=vIOS53-64-v5919-vWii.wad
set md5=3f3a147cebfd1b27ec5893f02b352ca3
set md5alt=%md5%
set category=ios
goto:DBend

:vIOS55
set name=vIOS55 v5919 vWii
set code1=00000007
set code2=00000037
set version=5919
set wadname=vIOS55-64-v5919-vWii.wad
set md5=1f956711c47bebfe988604a459a01f45
set md5alt=%md5%
set category=ios
goto:DBend

:vIOS56
set name=vIOS56 v5918 vWii
set code1=00000007
set code2=00000038
set version=5918
set wadname=vIOS56-64-v5918-vWii.wad
set md5=680656b494cb283ed0c81b02ca609a83
set md5alt=%md5%
set category=ios
goto:DBend


:vIOS61
::custom copy of vIOS56
set name=cIOS61[56]-v5918-vWii
set code1=00000007
set code2=00000038
set version=5918
set wadname=cIOS61[56]-v5918-vWii.wad
set md5=9af066bbefae4873599c11a717e511ef
set md5alt=%md5%
set category=ios
goto:DBend


:vIOS57
set name=vIOS57 v6175 vWii
set code1=00000007
set code2=00000039
set version=6175
set wadname=vIOS57-64-v6175-vWii.wad
set md5=cdfd7b2e674c224132b87d6187465bed
set md5alt=%md5%
set category=ios
goto:DBend

:vIOS58
set name=vIOS58 v6432 vWii
set code1=00000007
set code2=0000003A
set version=6432
set wadname=vIOS58-64-v6432-vWii.wad
set md5=fcd1ef330e1a5e157f3882b7ff6d60c8
set md5alt=%md5%
set category=ios
goto:DBend

:vIOS59
set name=vIOS59 v9249 vWii
set code1=00000007
set code2=0000003B
set version=9249
set wadname=vIOS59-64-v9249-vWii.wad
set md5=8d7f30002d456de372dd9ad000cd5189
set md5alt=%md5%
set category=ios
goto:DBend

:vIOS62
set name=vIOS62 v6942 vWii
set code1=00000007
set code2=0000003E
set version=6942
set wadname=vIOS62-64-v6942-vWii.wad
set md5=d730ba9734b23b79a92e2f61e0a4d6fb
set md5alt=%md5%
set category=ios
goto:DBend

:vIOS80
set name=vIOS80 v7200 vWii
set code1=00000007
set code2=00000050
set version=7200
set wadname=vIOS80-64-v7200-vWii.wad
set md5=bb77730426bdf0eabe5509c291e86198
set md5alt=%md5%
set category=ios
goto:DBend

:vIOS80P
set name=vIOS80v7200[FS-ES-NP-VP]-vWii
set code1=00000007
set code2=00000050
set version=7200
set wadname=vIOS80v7200[FS-ES-NP-VP]-vWii
set md5=592c197ec1863e7a9adf86b03fbf61f1
set md5alt=%md5%
set ciosslot=80
set ciosversion=7200
set category=patchios
set basewad=vIOS80-64-v7200-vWii
set md5base=bb77730426bdf0eabe5509c291e86198
set md5basealt=%md5base%
goto:DBend



:Bannerbomb1
set name=Bannerbomb v1 (for 3.0 - 4.1 Wii's)
set code1=URL
set code2="https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/aad1f_v108.zip"
set version=bin
set dlname=aad1f_v108.zip
set wadname=BB1.zip
set md5=41d50b69c5763159afb35918c42cf320
set path1=private\wii\title\aktn\
set filename=content.bin
goto:DBend

:Bannerbomb2
set name=Bannerbomb v2 (for 4.2 Wii's)
set code1=URL
set code2="https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/abd6a_v200.zip"
set version=bin
set dlname=abd6a_v200.zip
set wadname=BB2.zip
set md5=d846f2c07c0a3be6fadca90dbb7356a7
if /i "%BB1%" EQU "*" (set path1=private2\wii\title\aktn\) else (set path1=private\wii\title\aktn\)
set filename=content.bin
goto:DBend

:ARC
set name=Any Region Changer ModMii Edition
set category=OSC
set code1=ARCME
set "dlname=%code1%.zip"
set "wadname=%dlname%"
goto:DBend


:KK
set name=KoreanKii
set code1=URL
set code2="https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/KoreanKii_v1.1.zip"
set version=*
set dlname="KoreanKii_v1.1.zip"
set wadname=KoreanKii_v1.1.zip
set md5=5205ce0a3ba230e27177cfca12ef115e
set path1=apps\KoreanKii\
set filename=boot.dol
goto:DBend


:mmm
set name=Multi-Mod Manager (MMM) v13.4
set code1=URL
set code2="https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/Multi-Mod-Manager_v13.4.zip"
set version=*
set dlname="Multi-Mod-Manager_v13.4.zip"
set wadname=Multi-Mod-Manager_v13.4.zip
set filename=boot.dol
set md5=6d5167f976b5c35b2b2a12c3aa3e7766
set path1=apps\mmm\
goto:DBend

:CleanRip
set name=CleanRip
set category=OSC
set code1=CleanRip
set "dlname=%code1%.zip"
set "wadname=%dlname%"
goto:DBend


:HM
set name=HackMii Installer v1.2
set code1=URL
set code2="https://bootmii.org/download/"
set version=elf
set wadname=hackmii_installer_v1.2.zip
set filename=boot.elf
set path1=apps\HackMii_Installer\
set md5=729eebb48f6b562b94a47a3eb0543bf4
set code3=raw.githubusercontent.com/modmii/modmii.github.io/master/temp/HackMii_Installer_1.2_meta_icon_.zip
set zipname=HackMii_Installer_1.2_meta_icon_.zip
goto:DBend


:HMOld
set name=HackMii Installer v1.0
set code1=URL
set code2="https://bootmii.org/download/"
set version=elf
set wadname=hackmii_installer_v1.0.zip
set filename=boot.elf
set path1=apps\HackMii_Installer_v1.0\
set md5=cfc05090ac7eac2c6711c196151c7919
::v1.2 meta edited for v1.0 later during download
set code3=raw.githubusercontent.com/modmii/modmii.github.io/master/temp/HackMii_Installer_1.2_meta_icon_.zip
set zipname=HackMii_Installer_1.2_meta_icon_.zip
goto:DBend

:IOS236Installer
set name=IOS236 Installer v5 Mod
set code1=URL
set code2="https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/ios236_v5_mod_.zip"
set version=*
set dlname=ios236_v5_mod_.zip
set wadname=ios236_v5_mod_.zip
set filename=boot.dol
set md5=75ea18760085d720b7e0f82b8f80842e
set path1=apps\IOS236-v5-Mod\
goto:DBend


:sysCheck
set name=SysCheck ModMii Edition
set category=OSC
set code1=SysCheckME
set "dlname=%code1%.zip"
set "wadname=%dlname%"
goto:DBend


:SIP
set category=fullextract
set name=Simple IOS Patcher
set code1=URL
set code2="https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/sip_v1.14_.zip"
set version=*
set dlname=sip_v1.14_.zip
set "wadname=%dlname%"
set filename=boot.dol
set md5=5a76e9069ddaab13793692fc20c57b40
set path1=apps\SIP\
goto:DBend

:pwns
set category=fullextract
set name=Indiana Pwns (USA, PAL and JPN)
set code1=URL
set code2="https://static.hackmii.com/indiana-pwns.zip"
set version=*
set dlname="indiana-pwns.zip"
set wadname=indiana-pwns.zip
set filename=data.bin
set md5=a6b8f03f49baa471228dcd81d3fd623a
set path1=private\wii\title\rlip\
goto:DBend

:Twi
set category=fullextract
set name=Twilight Hack v0.1 Beta1 (under 3.4: USA, PAL and JPN)
set code1=URL
set code2="https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/twilight_hack_v0.1_beta1.zip"
set version=*
set dlname=twilight_hack_v0.1_beta1.zip
set wadname=twilight_hack_v0.1_beta1.zip
set filename=data.bin
set md5=704bd625ea5b42d7ac06fc937af74d38
set path1=private\wii\title\rzdp\
goto:DBend


:Twi2
set category=fullextract
set name=Twilight Hack v0.1 Beta2 (3.4: USA, PAL and JPN)
set code1=URL
set code2="https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/Twilight-hack-v0.1-beta2.zip"
set version=*
set dlname=Twilight-hack-v0.1-beta2.zip
set wadname=Twilight-hack-v0.1-beta2.zip
set filename=data.bin
set md5=7d0ac865218738364da4c67466ed59fb
set path1=private\wii\title\rzdp\
goto:DBend


:Bathaxx
set category=fullextract
set name=Bathaxx (USA, PAL and JPN)
set code1=URL
set code2="https://wien.tomnetworks.com/wii/bathaxx.zip"
set version=*
set dlname="bathaxx.zip"
set wadname=bathaxx.zip
set filename=data.bin
set md5=5dac3152baabbc6ca17bedfd5b7350c9
set path1=private\wii\title\rlbe\
goto:DBend


:ROTJ
set category=fullextract
set name=Return of the Jodi (USA, PAL and JPN)
set code1=URL
set code2="https://static.hackmii.com/return-jodi.zip"
set version=*
set dlname="return-jodi.zip"
set wadname=return-jodi.zip
set filename=data.bin
set md5=448a3e6bfb4b6d9fafd64c45575f9cb4
set path1=private\wii\title\rlge\
goto:DBend

:TOS
set category=fullextract
set name=Eri HaKawai (USA, PAL and JPN)
set code1=URL
set code2="https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/EriHaKawai-USA+PAL+JAP.zip"
set version=*
set dlname="EriHaKawai-USA+PAL+JAP.zip"
set wadname=EriHaKawai-USA+PAL+JAP.zip
set filename=data.bin
set md5=7884370e1b8960ed09ed61395007affd
set path1=private\wii\title\rt4j\
goto:DBend

:YUGI
set category=fullextract
set name=YU-GI-OWNED (USA, PAL and JPN)
set code1=URL
set code2="https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/yu-gi-vah-ALL.zip"
set version=*
set dlname="yu-gi-vah-ALL.zip"
set wadname=yu-gi-vah-ALL.zip
set filename=data.bin
set md5=0319cb55ecb1caea34e4504aa56664ab
set path1=private\wii\title\ryoe\
goto:DBend



:smash
set name=Smash Stack (USA, PAL, JPN and KOR)
set category=fullextract
set code1=URL
set code2="https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/Smashstack_AllRegions.zip"
set version=*
set dlname="Smashstack_AllRegions.zip"
set wadname=Smashstack_AllRegions.zip
set filename=st_080805_0933.bin
set md5=aa93aab9bfdd25883bbd826a62645033
set path1=private\wii\app\rsbe\st\
goto:DBend

:DumpMii
set name=Dump Mii NAND
set category=OSC
set code1=DmpMiNND
set "dlname=%code1%.zip"
set "wadname=%dlname%"
goto:DBend


:locked
set name=Locked Apps Folder for HBC (PASS=UDLRAB)
set category=fullextract
set code1=URL
set code2="https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/LockedApps-Categorii.zip"
set version=*
set dlname=LockedApps-Categorii.zip
set wadname=LockedApps-Categorii.zip
set filename=boot.dol
set md5=6f277fd19e359db7d6f84dbad1076a29
set path1=apps\_apps_locked\
goto:DBend

:AccioHacks
set name=Accio Hacks
set code1=URL
set code2="https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/AccioHacks.zip"
set version=*
set dlname="AccioHacks.zip"
set wadname=AccioHacks.zip
set filename=boot.dol
set md5=e321da8d59578313890a50b7a31aff7b
set path1=apps\AccioHacks\
goto:DBend

:usbgx
set name=USB Loader GX
set category=fullextract
set code1=URL
set code2="https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/usbloader_gx_r1282_test_version2.zip"
set version=*
set "dlname=usbloader_gx_r1282_test_version2.zip"
set "wadname=%dlname%"
set filename=boot.dol
set path1=apps\usbloader_gx\
set md5=df093906134500e6a13eb738fd73420f
::--when oscwii updates to r1282 switch to the following:--
::set name=USB Loader GX
::set category=OSC
::set code1=usbloader_gx
::set "dlname=%code1%.zip"
::set "wadname=%dlname%"
goto:DBend


:Nintendont
set name=Nintendont
set category=OSC
set code1=Nintendont
set "dlname=%code1%.zip"
set "wadname=%dlname%"
goto:DBend


:MyM
set name=MyMenuifyMod
set category=OSC
set code1=MyMenuifyMod
set "dlname=%code1%.zip"
set "wadname=%dlname%"
goto:DBend

:csminstaller
set name=csm-installer
set category=OSC
set code1=csm-installer
set "dlname=%code1%.zip"
set "wadname=%dlname%"
goto:DBend

:bootmiisd
set name=Bootmii SD Files
set category=fullextract
set code1=URL
set code2="https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/bootmii_sd_files.zip"
set version=*
set dlname="bootmii_sd_files.zip"
set wadname=bootmii_sd_files.zip
set filename=ppcboot.elf
set md5=cad3fad8e5d20cc41168dbb04bd5cde1
set md5alt=%md5%
::md5alt is for older version from here https://static.hackmii.com/bootmii_sd_files.zip
::set md5alt=4b2ac026e3b08a588a340841244f4e98
set path1=bootmii\
goto:DBend

:neogamma
set name=Neogamma Backup Disc Loader
set category=fullextract
set code1=URL
set code2="https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/NeoGamma-Mod.zip"
set version=*
set dlname=NeoGamma-Mod.zip
set wadname=NeoGamma-Mod.zip
set filename=boot.dol
set md5=77cfd73675dbb241c874060b41a83643
set path1=apps\NeoGamma\
goto:DBend

:yawm
set name=Yet Another Wad Manager ModMii Edition
set category=OSC
set code1=yawmME
set "dlname=%code1%.zip"
set "wadname=%dlname%"
::create wm_config if missing to set startup IOS to IOS36; does not apply if ahbprot enabled
if not exist "%Drive%\WAD" mkdir "%Drive%\WAD"
if not exist "%Drive%"\WAD\wm_config.txt echo cIOSVersion=36> "%Drive%"\WAD\wm_config.txt
goto:DBend

:usbfolder
set name=Configurable USB-Loader
set category=OSC
set code1=usb-loader
set "dlname=%code1%.zip"
set "wadname=%dlname%"
goto:DBend

:FLOW
set name=WiiFlow
set category=OSC
set code1=wiiflow
set "dlname=%code1%.zip"
set "wadname=%dlname%"
goto:DBend

::left here intentionally
:CheatCodes
set name=Copy of Cheat Codes for AccioHacks
set category=CHEATS
goto:DBend

:WBM
set name=Wii Backup Manager v0.4.5 build 78
set category=fullextract
set code1=URL
set code2="https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/WiiBackupManager.zip"
set version=*
set dlname=WiiBackupManager.zip
set wadname=WiiBackupManager.zip
set filename=WiiBackupManager_Win32.exe
set md5=8ee733c1c126260962bcc83926d3cea6
set "path1=Program Files\WiiBackupManager\"
goto:DBend


:USBX
set name=USB-Loader Forwarder Channel\dol
set code1=ZIP
set code2="https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/USBLoader(s)-ahbprot58-SD-USB-v14-IDCL-(Wii+vWii)_.zip"
set version=*
set dlname=USBLoader(s)-ahbprot58-SD-USB-v14-IDCL-(Wii+vWii)_.zip
set wadname=USBLoader(s)-ahbprot58-SD-USB-v14-IDCL-(Wii+vWii)_.zip
set filename=USBLoader(s)-ahbprot58-SD-USB-v14-IDCL-(Wii+vWii).wad
set md5=f2f2bdebf7c6e68d4b08c1a26fd167a2
set md5alt=%md5%
set category=fullextract
set path1=\WAD\
goto:DBend


:FLOWF
set name=WiiFlow Forwarder Channel\dol
set code1=ZIP
set code2="https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/WiiFlow_Forwarder_wad_dol_v14_Wii+vWii.zip"
set version=*
set dlname=WiiFlow_Forwarder_wad_dol_v14_Wii+vWii.zip
set wadname=WiiFlow_Forwarder_wad_dol_v14_Wii+vWii.zip
set filename=WiiFlow-FIX94v14-forwarder-BWFA-Wii+vWii.wad
set md5=4313c66e14e681d0decf933d679e6474
set md5alt=%md5%
set category=fullextract
set path1=WAD\
goto:DBend


:S2U
set name=Switch2Uneek
set code1=ZIP
set code2="https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/switch2uneek_ModMiiBundle_v12_.zip"
set version=*
set dlname=switch2uneek_ModMiiBundle_v12_.zip
set wadname=switch2uneek_ModMiiBundle_v12_.zip
set filename=switch2uneek-4RealNand-v12-S2UK.wad
set md5=37b5f38c6c0d2cb74d389ee4a3edaa2b
set md5alt=%md5%
set category=fullextract
set path1=WAD\
::below is for building emu nand
if /i "%MENU1%" NEQ "S" goto:DBend
set filename=switch2uneek-4EMUNand-v12-S2RL.wad
set md5=24a7d692c26ddaa177ec7890c3881d4f
set md5alt=%md5%
::set path1=\
goto:DBend


:nSwitch
set name=nSwitch
set code1=ZIP
set code2="https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/neek2o_ModMii_BK2O_nSwitch_v4.2.wad"
set version=*
set "dlname=neek2o_ModMii_BK2O_nSwitch_v4.2.wad"
set wadname=neek2o_ModMii_BK2O_nSwitch_v4.2.wad
set filename=neek2o_ModMii_BK2O_nSwitch_v4.2.wad
set md5=e880a65e4293c4fbba976257afcc2188
set md5alt=%md5%
set category=fullextract
set path1=WAD\
goto:DBend


:PLChannel
set name=postLoader Forwarder Channel
set code1=ZIP
set code2="https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/postLoader_ModMii_Forwarder_BOST-Wii+vWii.wad"
set version=*
set dlname="postLoader_ModMii_Forwarder_BOST-Wii+vWii.wad"
set wadname=postLoader_ModMii_Forwarder_BOST-Wii+vWii.wad
set filename=postLoader_ModMii_Forwarder_BOST-Wii+vWii.wad
set md5=ec6e4602a6c45ccbdf590cafba68f0da
set md5alt=%md5%
set category=fullextract
set path1=WAD\
goto:DBend


:OHBC
set "name=Open Homebrew Channel WAD (LULZ v1.1.5)"
set code1=ZIP
set code2="https://github.com/Wii-Mini-Hacking/hbc/releases/download/v1.1.5/Open_HBC_1.1.5_LULZ.wad"
set version=*
set "dlname=Open_HBC_1.1.5_LULZ.wad"
set "wadname=%dlname%"
set "filename=%wadname%"
set md5=4c01410c52b353a372e2533dec539c91
set md5alt=%md5%
set category=fullextract
set path1=WAD\
goto:DBend


:OHBC113
set "name=Open Homebrew Channel WAD (OHBC v1.1.3)"
set code1=ZIP
set code2="https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/Open_HBC_1.1.3_OHBC.wad"
set version=*
set "dlname=Open_HBC_1.1.3_OHBC.wad"
set "wadname=Open_HBC_1.1.3_OHBC.wad"
set "filename=%wadname%"
set md5=7a1762f39e6051affa4a4f558bae8c3a
set md5alt=%md5%
set category=fullextract
set path1=WAD\
goto:DBend


:OHBC114
set "name=Open Homebrew Channel WAD (OHBC v1.1.4-1)"
set code1=ZIP
set code2="https://github.com/FIX94/hbc/releases/download/1.1.4-1/Homebrew.Channel.-.OHBC.wad"
set version=*
set "dlname=Homebrew.Channel.-.OHBC.wad"
set "wadname=Open_HBC_1.1.4-1_OHBC.wad"
set "filename=%wadname%"
set md5=7feaa2493bdaef8c37d48811964a6f81
set md5alt=%md5%
set category=fullextract
set path1=WAD\
goto:DBend


:F32
set name=FAT32 GUI Formatter
set category=fullextract
set code1=PC
set code2="http://ridgecrop.co.uk/guiformat.exe"
set version=*
set dlname=guiformat.exe
set wadname=FAT32_GUI_Formatter.exe
set filename=FAT32_GUI_Formatter.exe
set md5=2459a629ace148286360b860442221a2
set "path1=Program Files\FAT32_GUI_Formatter\"
goto:DBend


:RC24
set name=RiiConnect24 Patcher
set category=auto
set code1=PC
set code2="https://github.com/RiiConnect24/RiiConnect24-Patcher/releases/latest/download/RiiConnect24Patcher.bat"
set version=*
set dlname=RiiConnect24Patcher.bat
set wadname=RiiConnect24Patcher.bat
set filename=RiiConnect24Patcher.bat
set "path1=Program Files\RiiConnect24Patcher\"
goto:DBend


:WiiLink
set name=WiiLink Patcher
set category=auto
set code1=PC
::code2 needs to be parsed to get actual latest DL link
set code2="https://api.github.com/repos/WiiLink24/WiiLink24-Patcher/releases/latest"
set version=*
set dlname=latest
set wadname=latest.json
set filename=WiiLinkPatcher.exe
set "path1=Program Files\WiiLinkPatcher\"
goto:DBend


:Cemu
set name=Cemu
set category=auto
set code1=PC
::code2 needs to be parsed to get actual latest DL link
set code2="https://api.github.com/repos/cemu-project/Cemu/releases"
::/latest does not include pre-releases, which is all cemu is putting out lately
::set code2="https://api.github.com/repos/cemu-project/Cemu/releases/latest"
set version=*
set dlname=latest
set wadname=latest.json
set zipname=cemu-windows-x64.zip
set filename=Cemu.exe
set "path1=Program Files\Cemu\"
goto:DBend


:NUSGet
set name=NUSGet
set category=auto
set code1=PC
set code2="https://github.com/NinjaCheetah/NUSGet/releases/latest/download/NUSGet-Windows-bin.zip"
set version=*
set "dlname=NUSGet-Windows-bin.zip"
set "wadname=%dlname%"
set filename=NUSGet.exe
set "path1=Program Files\NUSGet\"
goto:DBend



:Diskitude
set name=Diskitude
set category=auto
set code1=PC
set code2="https://www.madebyevan.com/diskitude/Diskitude.exe"
set version=*
set dlname=Diskitude.exe
set wadname=Diskitude.exe
set filename=Diskitude.exe
set "path1=Program Files\Diskitude\"
goto:DBend

:hxd
set name=HxD
set category=auto
set code1=PC
set code2="https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/HxD.zip"
set version=*
set dlname=HxD.zip
set wadname=HxD.zip
if exist "%homedrive%\Program Files (x86)" (set filename=HxD64.exe) else (set filename=HxD32.exe)
set "path1=Program Files\HxD\"
goto:DBend


:Nkit
set name=NKit Processing App
set category=fullextract
set code1=PC
set code2="https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/NKit_v1.4.zip"
set version=*
set dlname=NKit_v1.4.zip
set wadname=NKit_v1.4.zip
set filename=NKitProcessingApp.exe
set md5=b4b1ceb6fc02596f8138eee183f50fcb
set "path1=Program Files\NKit\"
goto:DBend


:GCBM
set name=GameCube Backup Manager
set category=auto
set code1=PC
set code2="https://github.com/AxionDrak/GameCube-Backup-Manager/releases/latest/download/gcbm.zip"
set version=*
set "dlname=gcbm.zip"
set "wadname=%dlname%"
set filename=GCBM.exe
set "path1=Program Files\GCBM\"
goto:DBend


:ThemeMiiMod
set name=ThemeMii Mod
set category=fullextract
set code1=PC
set code2="https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/ThemeMii_MOD.zip"
set version=2
set dlname=ThemeMii_MOD.zip
set wadname=ThemeMii_MOD.zip
set filename=ThemeMii.exe
set md5=6f0bd5fa4a7b59c45571c057d7d348ee
set "path1=Program Files\ThemeMii\"
goto:DBend


:UStealth
set name=UStealth
set category=fullextract
set code1=PC
set code2="https://static.wiidatabase.de/UStealth.zip"
set version=*
set dlname=UStealth.zip
set wadname=UStealth.zip
set filename=Ustealth_R8.exe
set md5=6d223fd62bbb7984e78c6316e7b2d7fb
set "path1=Program Files\UStealth\"
goto:DBend


:UWUVCI
set "name=Ultimate Wii U VC Injectors (UWUVCI)"
set category=auto
set code1=fullextract
set code2="https://github.com/stuff-by-3-random-dudes/UWUVCI-AIO-WPF/releases/latest/download/UWUVCI_INSTALLER.exe"
set version=*
set dlname=UWUVCI_INSTALLER.exe
set wadname=UWUVCI_INSTALLER.exe
set "filename=UWUVCI AIO.exe"
set "path1=Program Files\UWUVCI AIO\"
goto:DBend


:SDTEST
set name=H2testw
set category=fullextract
set code1=PC
set code2="https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/h2testw.zip"
set version=*
set dlname=h2testw.zip
set wadname=h2testw.zip
set filename=h2testw.exe
set md5=303d10037dbbd1f502ad01ad829a6df8
set "path1=Program Files\h2testw\"
goto:DBend


:SMW
set name=ShowMiiWads
set category=fullextract
set code1=URL
set code2="https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/ShowMiiWads-Mod-1.5.2.zip"
set version=*
set dlname=ShowMiiWads-Mod-1.5.2.zip
set wadname=ShowMiiWads-Mod-1.5.2.zip
set filename=ShowMiiWads_Win64.exe
set md5=4bd77dd6199faa886fd7f3d76cc701c9
set "path1=Program Files\ShowMiiWads\"
goto:DBend

:CustomizeMii
set name=Customize Mii
set category=fullextract
set code1=URL
::%20=space, for batch changed to %%20 to work
set code2="https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/CustomizeMii%%203.11.rar"
set version=*
set dlname=CustomizeMii 3.11.rar
set wadname=CustomizeMii 3.11.rar
set filename=CustomizeMii.exe
set md5=e35d75c3ad0a058149bdf45155595cfc
set "path1=Program Files\CustomizeMii\"
goto:DBend

:WiiGSC
set name=Wii Game Shortcut Creator
set category=fullextract
set code1=URL
set code2="https://github.com/modmii/WiiGSC/releases/download/1.1/WiiGSC.zip"
set version=*
set dlname=WiiGSC.zip
set wadname=WiiGSC.zip
set filename=WiiGSC.exe
set md5=ce0e85d332f1d56d2c01e25b0409df90
set "path1=Program Files\WiiGSC\"
goto:DBend

:ohnes
set name=ohneschwanzenegger
set category=fullextract
set code1=PC
set code2="https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/ohneschwanzenegger.zip"
set version=*
set dlname=ohneschwanzenegger.zip
set wadname=ohneschwanzenegger.zip
set filename=ohneschwanzenegger.exe
set md5=4823707a511105678c8d6f909d022617
set "path1=Program Files\ohneschwanzenegger\"
goto:DBend

:Dolphin
set name=Dolphin
set category=auto
set code1=PC
set code2="https://tiny.cc/Dolphin"
set version=2
set dlname=Dolphin
set wadname=Dolphin.7z
set filename=Dolphin.exe
set "path1=Program Files\Dolphin-x64\"
goto:DBend

:FILEZILLA
set name=FileZilla
set category=auto
set code1=PC
if exist "%homedrive%\Program Files (x86)" (set dlname=FileZilla_win64.zip) else (set dlname=FileZilla_win32.zip)
set code2="https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/%dlname%"
set version=2
set "wadname=%dlname%"
set filename=filezilla.exe
set "path1=Program Files\%dlname:~0,-4%\"
goto:DBend


:HashMF
set name=HashMyFiles
set category=auto
set code1=PC
if exist "%homedrive%\Program Files (x86)" (set dlname=hashmyfiles-x64.zip) else (set dlname=hashmyfiles.zip)
set code2="https://www.nirsoft.net/utils/%dlname%"
set version=*
set "wadname=%dlname%"
set filename=hashmyfiles.exe
set "path1=Program Files\%dlname:~0,-4%\"
goto:DBend


:OSC
set name=Open Shop Channel
set category=auto
set code1=PC
set code2="https://link.oscwii.org/oscdl-standalone"
set version=*
set dlname=oscdl-standalone
set wadname=oscdl-standalone.exe
set filename=oscdl-standalone.exe
set "path1=Program Files\OpenShopChannel\"
goto:DBend


:WIIMC
set name=WiiMC-SS (Media Player)
set category=OSC
set code1=WiiMC-SS
set "dlname=%code1%.zip"
set "wadname=%dlname%"
goto:DBend

:CheatZip
set name=Cheat Codes (txtcodes)
set category=fullextract
set code1=ZIP
set code2="https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/txt.zip"
set version=*
set dlname=txt.zip
set "wadname=%dlname%"
set filename=SMNP01.txt
set md5=030fd3bfe73f46d2dd73180f287ead03
set md5alt=%md5%
set path1=txtcodes\
goto:DBend


:OSClib
set name=OSC Complete Wii App Library
if /i "%OSCmode%" EQU "update" set name=OSC Wii App Library Updates
set category=OSC
set code1=all
set "wadname=%dlname%"
goto:DBend

:vWii80Installer
set name=Patched IOS80 Installer for vWii
set category=OSC
set code1=Patched_IOS80_Installer_for_vWii
set "dlname=%code1%.zip"
set "wadname=%dlname%"
goto:DBend

:v43DB
set name=ww-43db-patcher
set category=OSC
set code1=ww-43db-patcher
set "dlname=%code1%.zip"
set "wadname=%dlname%"
goto:DBend


:SCR
set name=System Channel Restorer
set category=OSC
set code1=system-channel-restorer
set "dlname=%code1%.zip"
set "wadname=%dlname%"
goto:DBend


:fceugx
set name=FCEUGX (NES Emulator)
set category=OSC
set code1=fceugx
set "dlname=%code1%.zip"
set "wadname=%dlname%"
goto:DBend

:HBASlib
set name=HBAS Complete WiiU App Library
if /i "%HBASmode%" EQU "update" set name=HBAS WiiU App Library Updates
set category=HBAS
set code1=all
set "wadname=%dlname%"
goto:DBend

:Bloopair
set name=Bloopair
set category=HBAS
::this should be set to "name" from repo.json (aka %WiiUappName%)
set code1=Bloopair-Tiramisu
set "dlname=%code1%.zip"
set "wadname=%dlname%"
goto:DBend

:AccountSwap
set name=Wii U Account Swap
set category=HBAS
::this should be set to "name" from repo.json (aka %WiiUappName%)
set code1=Wii-U-Account-Swap
set "dlname=%code1%.zip"
set "wadname=%dlname%"
goto:DBend


:Inkay
set name=Inkay for Pretendo
set category=HBAS
::this should be set to "name" from repo.json (aka %WiiUappName%)
set code1=Inkay
set "dlname=%code1%.zip"
set "wadname=%dlname%"
goto:DBend


:wup_installer_gx2_wuhb
set name=WUP Installer GX2
set category=HBAS
::this should be set to "name" from repo.json (aka %WiiUappName%)
set code1=wup_installer_gx2_wuhb
set "dlname=%code1%.zip"
set "wadname=%dlname%"
goto:DBend

:wudd
set name=WiiU Disc Dumper
set category=HBAS
::this should be set to "name" from repo.json (aka %WiiUappName%)
set code1=wudd
set "dlname=%code1%.zip"
set "wadname=%dlname%"
goto:DBend

:GiveMiiYouTube
set name=GiveMiiYouTube
set category=HBAS
::this should be set to "name" from repo.json (aka %WiiUappName%)
set code1=GiveMiiYouTube
set "dlname=%code1%.zip"
set "wadname=%dlname%"
goto:DBend


:CompatTitleInstaller
set name=Compat Title Installer
set category=HBAS
::this should be set to "name" from repo.json (aka %WiiUappName%)
set code1=CompatTitleInstaller
set "dlname=%code1%.zip"
set "wadname=%dlname%"
goto:DBend


:Screenshot_WUPS
set name=Screenshot Plugin
set category=HBAS
::this should be set to "name" from repo.json (aka %WiiUappName%)
set code1=Screenshot_WUPS
set "dlname=%code1%.zip"
set "wadname=%dlname%"
goto:DBend


:evWii
set name=evWii
set category=HBAS
::this should be set to "name" from repo.json (aka %WiiUappName%)
set code1=evWii
set "dlname=%code1%.zip"
set "wadname=%dlname%"
goto:DBend

:WiiVCLaunch
set name=WiiVCLaunch
set category=HBAS
::this should be set to "name" from repo.json (aka %WiiUappName%)
set code1=WiiVCLaunch
set "dlname=%code1%.zip"
set "wadname=%dlname%"
goto:DBend

:appstore
set name=WiiU Homebrew App Store
set category=HBAS
::this should be set to "name" from repo.json (aka %WiiUappName%)
set code1=appstore
set "dlname=%code1%.zip"
set "wadname=%dlname%"
goto:DBend


:WiiUIdent
set name=WiiUIdent
set category=HBAS
::this should be set to "name" from repo.json (aka %WiiUappName%)
set code1=WiiUIdent
set "dlname=%code1%.zip"
set "wadname=%dlname%"
goto:DBend


:SaveMiiModWUTPort
set name=SaveMii Mod WUT Port
set category=HBAS
::this should be set to "name" from repo.json (aka %WiiUappName%)
set code1=SaveMiiModWUTPort
set "dlname=%code1%.zip"
set "wadname=%dlname%"
goto:DBend


:Aroma
set name=Aroma
set category=auto
set code1=URL
set code2="https://aroma.foryour.cafe/api/download/base"
set version=*
set dlname=base-aroma.zip
set "wadname=%dlname%"
set filename=root.rpx
set path1=wiiu\environments\aroma\
goto:DBend


:Nanddumper
set name=Nanddumper
set category=fullextract
set code1=ZIP
set code2="https://aroma.foryour.cafe/api/download?packages=wiiu-nanddumper-payload"
set version=*
set dlname=wiiu-nanddumper-payload.zip
set "wadname=%dlname%"
set filename=payload.elf
set path1=wiiu\payloads\nanddumper\
call support\subscripts\OtherAppSHA1.bat
goto:DBend



:EnvironmentLoader
set name=EnvironmentLoader
set category=fullextract
set code1=ZIP
set code2="https://aroma.foryour.cafe/api/download?packages=environmentloader"
set version=*
set dlname=environmentloader.zip
set "wadname=%dlname%"
set filename=payload.elf
set path1=wiiu\payloads\default\
call support\subscripts\OtherAppSHA1.bat
goto:DBend


:Wiiload Plugin
set name=Wiiload Plugin
set category=fullextract
set code1=ZIP
set code2="https://aroma.foryour.cafe/api/download?packages=wiiload"
set version=*
set dlname=wiiload.zip
set "wadname=%dlname%"
set filename=wiiload.wps
set path1=wiiu\environments\aroma\plugins\
call support\subscripts\OtherAppSHA1.bat
goto:DBend


:FTPiiU Plugin
set name=FTPiiU Plugin
set category=fullextract
set code1=ZIP
set code2="https://aroma.foryour.cafe/api/download?packages=ftpiiu"
set version=*
set dlname=ftpiiu.zip
set "wadname=%dlname%"
set filename=ftpiiu.wps
set path1=wiiu\environments\aroma\plugins\
call support\subscripts\OtherAppSHA1.bat
goto:DBend



:Tiramisu
set name=Tiramisu
set category=fullextract
set code1=URL
set code2="https://github.com/wiiu-env/Tiramisu/releases/download/v0.1.4/environmentloader-ba9c126+wiiu-nanddumper-payload-5c5ec09+fw_img_loader-c2da326+payloadloaderinstaller-ec7176d+tiramisu-f1b479d.zip"
set version=*
set dlname=Tiramisu_v0.1.4.zip
set "wadname=%dlname%"
set filename=root.rpx
set md5=5c9f07733ee6b037c4c022ae89f8ec36
set path1=wiiu\environments\tiramisu\
goto:DBend


:snes9xgx
set name=SNES9xGX (SNES Emulator)
set category=OSC
set code1=snes9xgx
set "dlname=%code1%.zip"
set "wadname=%dlname%"
goto:DBend

:vbagx
set name=Visual Boy Advance GX (GB/GBA Emulator)
set category=OSC
set code1=vbagx
set "dlname=%code1%.zip"
set "wadname=%dlname%"
goto:DBend


:SGM
set name=SaveGame Manager GX
set category=OSC
set code1=SaveGame_Manager_GX
set "dlname=%code1%.zip"
set "wadname=%dlname%"
goto:DBend


:WII64
set name=Wii64 (N64 Emulator)
set category=OSC
set code1=wii64
set "dlname=%code1%.zip"
set "wadname=%dlname%"
goto:DBend

:Not64
set name=Not64 (N64 Emulator)
set category=OSC
set code1=not64
set "dlname=%code1%.zip"
set "wadname=%dlname%"
goto:DBend


:postLoader
set name=postLoader
set category=fullextract
set code1=URL
set code2="https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/postloader.4.7.96_.zip"
set version=*
set dlname="postloader.4.7.96_.zip"
set wadname=postloader.4.7.96_.zip
set filename=boot.dol
set md5=c8328faa9c35cc75841f853d1fe7bf18
set path1=apps\postloader\
goto:DBend


:ftpii
set name=ftpii
set category=OSC
set code1=ftpii
set "dlname=%code1%.zip"
set "wadname=%dlname%"
goto:DBend


:WIIX
set name=WiiXplorer
set category=OSC
set code1=wiixplorer
set "dlname=%code1%.zip"
set "wadname=%dlname%"
goto:DBend


:HBB
set name=Homebrew Browser
set category=OSC
set code1=homebrew_browser
set "dlname=%code1%.zip"
set "wadname=%dlname%"
goto:DBend


:Casper
set name=Casper
set category=fullextract
set code1=URL
set code2="https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/casper_0.3.elf.tar.gz"
set version=*
set dlname="casper_0.3.elf.tar.gz"
set wadname=casper_0.3.elf.tar.gz
set filename=boot.elf
set md5=3e9d8254c3b197dca97d5ceb8bb5b7db
set path1=apps\Casper\
goto:DBend


:Wilbrand
set name=Wilbrand
set category=fullextract
set code1=URL
set code2="https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/Wilbrand.exe"
set version=*
set dlname="Wilbrand.exe"
set wadname=Wilbrand.exe
set filename=Wilbrand.exe
set md5=0c747be356a44ad80b050ad3d18d18ab
goto:DBend


:WIISX
set name=WiiSXRX (Playstation 1 Emulator)
set category=OSC
set code1=WiiSXRX
set "dlname=%code1%.zip"
set "wadname=%dlname%"
goto:DBend


:Priiloader
set name=Priiloader Installer
set category=OSC
set code1=priiloader
set "dlname=%code1%.zip"
set "wadname=%dlname%"
goto:DBend


:LoadPriiloader
set name=Load Priiloader
set category=OSC
set code1=LoadPriiloader
set "dlname=%code1%.zip"
set "wadname=%dlname%"
goto:DBend


::---------------------cIOSs----------------------
:CIOSDATABASE

:cIOS222[38]-v4
set name=cIOS222[38]-v4
set wadname=cIOS222[38]-v4
set ciosslot=unchanged
set md5=ab4b09e0b330be2ae957fc6847bce687
set md5alt=59c4316a1d40d4fd357a90cb21d91c9c
set basewad=IOS38-64-v3610
set md5base=08b2f485e43d957b11ac797435e3301f
set md5basealt=%md5base%
set code1=00000001
set code2=00000026
set version=3610
set basecios=cIOS222[38]-v4
set diffpath=%basecios%
set code2new=000000de
set lastbasemodule=0000000e
set cIOSFamilyName=hermes
set cIOSversionNum=4
goto:DBend

:cIOS223[37-38]-v4
set name=cIOS223[37-38]-v4
set wadname=cIOS223[37-38]-v4
set ciosslot=unchanged
set md5=606d03466c6faa398525f8ab9496ee68
set md5alt=755e36956c9570aa55b52c38e56f86df
set basewad=IOS37-64-v3612
set md5base=2faf3596a6144c6d783bd8e94c84aa16
set md5basealt=%md5base%
set code1=00000001
set code2=00000025
set version=3612
set basewadb=IOS38-64-v3610
set md5baseb=08b2f485e43d957b11ac797435e3301f
set md5basebalt=%md5baseb%
set code1b=00000001
set code2b=00000026
set versionb=3610
set basecios=cIOS223[37-38]-v4
set diffpath=%basecios%
set code2new=000000df
set lastbasemodule=0000000e
set cIOSFamilyName=hermes
set cIOSversionNum=4
goto:DBend



:NMM
set name=cBC-NMMv0.2a
set wadname=cBC-NMMv0.2a
set ciosslot=unchanged
set md5=5920f84dcc5343674d08fc2c4e400b09
set md5alt=f535e3ae28d3fa0188d15bce0d738ba5
set basewad=BC-NUS-v6
set md5base=68f723963127041aa383d675f2672fc3
set md5basealt=%md5base%
set code1=00000001
set code2=00000100
set version=6
set basewadb=RVL-mios-v10
set md5baseb=2359fe4eca6a25d84326e9da610576a6
set md5basebalt=%md5baseb%
set code1b=00000001
set code2b=00000101
set versionb=10
set basecios=cBC-NMMv0.2a
set diffpath=%basecios%
set code2new=00000100
::set URL=http://crediar.no-ip.com/NMMv0.2a-cred.rar
set URL=raw.githubusercontent.com/modmii/modmii.github.io/master/temp/NMMv0.2a-cred.rar
set dlname=NMMv0.2a-cred.rar
goto:DBend


:DML
set name=DML
set code1=ZIP
set code2="https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/DIOSMIOSLite_2.11.wad"
set version=*
set dlname="DIOSMIOSLite_2.11.wad"
set wadname=DIOSMIOSLite_2.11.wad
set filename=DIOSMIOSLite_2.11.wad
set md5=2f962f2a5cce33be6ebf1baa5255d90d
set md5alt=%md5%
set category=fullextract
set path1=WAD\
goto:DBend


:DiosMios
set name=DIOS MIOS
set code1=ZIP
set code2="https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/DIOSMIOS_2.11.wad"
set version=*
set dlname="DIOSMIOS_2.11.wad"
set wadname=DIOSMIOS_2.11.wad
set filename=DIOSMIOS_2.11.wad
set md5=c65cf269f0f876b99e288a83c353a8f3
set md5alt=%md5%
set category=fullextract
set path1=WAD\
goto:DBend


::HERMES V5 BASE 38
:cIOS222[38]-v5
set name=cIOS222[38]-v5
set wadname=cIOS222[38]-v5
set ciosslot=unchanged
set md5=77f1df39a24d312f988cecf4dd68e582
set md5alt=c624e099e717bf9b84efb80f68d54867
set basewad=IOS38-64-v3867
set md5base=7aa687bdee18b2c201ad5edd3c239e55
set md5basealt=%md5base%
set code1=00000001
set code2=00000026
set version=3867
set basecios=cIOS222[38]-v5
set diffpath=%basecios%
set code2new=000000de
set lastbasemodule=0000000e
set cIOSFamilyName=hermes
set cIOSversionNum=5
goto:DBend


::HERMES V5 BASE 37
:cIOS223[37]-v5
set name=cIOS223[37]-v5
set wadname=cIOS223[37]-v5
set ciosslot=unchanged
set md5=a2cf208d51cea80b82059937778c15b7
set md5alt=7c4f560c8e606b154f1c6f2bd1104517
set basewad=IOS37-64-v3869
set md5base=e3ead7b8ec59ce8859be3b37dbc9bc3d
set md5basealt=%md5base%
set code1=00000001
set code2=00000025
set version=3869
set basecios=cIOS223[37]-v5
set diffpath=%basecios%
set code2new=000000df
set lastbasemodule=0000000e
set cIOSFamilyName=hermes
set cIOSversionNum=5
goto:DBend

::HERMES V5 BASE 57

:cIOS224[57]-v5
set name=cIOS224[57]-v5
set wadname=cIOS224[57]-v5
set ciosslot=unchanged
set md5=ce67b890fd6dd804d75ae18093fc4235
set md5alt=12743002a22de81ed54e0099c70f9405
set basewad=IOS57-64-v5661
set md5base=757a3c6fd8a2eb449afd949cd7dc2507
set md5basealt=%md5base%
set code1=00000001
set code2=00000039
set version=5661
set basecios=cIOS224[57]-v5
set diffpath=%basecios%
set code2new=000000e0
set lastbasemodule=00000012
set cIOSFamilyName=hermes
set cIOSversionNum=5
goto:DBend


:cIOS202[60]-v5.1R
set name=cIOS202[60]-v5.1R
set wadname=cIOS202[60]-v5.1R
set ciosslot=unchanged
set md5=7e455ddeeac4f831f9235b8d37a36078
set md5alt=d653e5e065cd262c27b1c4de01de3539
set basewad=IOS60-64-v6174
set md5base=631238cee654c276a134678c7f32f4df
set md5basealt=%md5base%
set code1=00000001
set code2=0000003C
set version=6174
set basecios=cIOS202[60]-v5.1R
set diffpath=%basecios%
set code2new=000000ca
set lastbasemodule=0000000e
set cIOSFamilyName=hermesrodries
set cIOSversionNum=6
goto:DBend

:cIOS222[38]-v5.1R
set name=cIOS222[38]-v5.1R
set wadname=cIOS222[38]-v5.1R
set ciosslot=unchanged
set md5=99404fcf2af266469d93fd2ae8f0fe0a
set md5alt=39da8e46709b166adc5a4655a248e1b6
set basewad=IOS38-64-v3867
set md5base=7aa687bdee18b2c201ad5edd3c239e55
set md5basealt=%md5base%
set code1=00000001
set code2=00000026
set version=3867
set basecios=cIOS222[38]-v5.1R
set diffpath=%basecios%
set code2new=000000de
set lastbasemodule=0000000e
set cIOSFamilyName=hermesrodries
set cIOSversionNum=6
goto:DBend

:cIOS223[37]-v5.1R
set name=cIOS223[37]-v5.1R
set wadname=cIOS223[37]-v5.1R
set ciosslot=unchanged
set md5=488f09d029346edd84701f789c99bd31
set md5alt=4a992816d5c2e6f7a529f302e1761b6c
set basewad=IOS37-64-v3869
set md5base=e3ead7b8ec59ce8859be3b37dbc9bc3d
set md5basealt=%md5base%
set code1=00000001
set code2=00000025
set version=3869
set basecios=cIOS223[37]-v5.1R
set diffpath=%basecios%
set code2new=000000df
set lastbasemodule=0000000e
set cIOSFamilyName=hermesrodries
set cIOSversionNum=6
goto:DBend

:cIOS224[57]-v5.1R
set name=cIOS224[57]-v5.1R
set wadname=cIOS224[57]-v5.1R
set ciosslot=unchanged
set md5=f9d9b2967b4568e7d3c304c5e43d4952
set md5alt=38d9cb92a187732e774dcfe41e58dd9c
set basewad=IOS57-64-v5661
set md5base=757a3c6fd8a2eb449afd949cd7dc2507
set md5basealt=%md5base%
set code1=00000001
set code2=00000039
set version=5661
set basecios=cIOS224[57]-v5.1R
set diffpath=%basecios%
set code2new=000000e0
set lastbasemodule=00000012
set cIOSFamilyName=hermesrodries
set cIOSversionNum=6
goto:DBend


::WANIN'S V14 BASE 38

:cIOS249-v14
set name=cIOS249-v14
set wadname=cIOS249-v14
set ciosslot=unchanged
set md5=8cb5ff74ec37bb0b6992353097f10318
set md5alt=105928de83c3018bec3f596d478d9ae5
set basewad=IOS38-64-v3610
set md5base=08b2f485e43d957b11ac797435e3301f
set md5basealt=%md5base%
set code1=00000001
set code2=00000026
set version=3610
set basecios=cIOS249-v14
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=0000000e
set cIOSFamilyName=waninkoko
set cIOSversionNum=14
goto:DBend

:cIOS250-v14
set name=cIOS250-v14
set wadname=cIOS250-v14
set ciosslot=250
set ciosversion=65535
set md5=bf53a319daf796c7b0467194911ba33e
set md5alt=30276a910423e7de2b569b30cec2f359
set basewad=IOS38-64-v3610
set md5base=08b2f485e43d957b11ac797435e3301f
set md5basealt=%md5base%
set code1=00000001
set code2=00000026
set version=3610
set basecios=cIOS249-v14
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=0000000e
set cIOSFamilyName=waninkoko
set cIOSversionNum=14
goto:DBend


::WANIN'S V17B BASE 38

:cIOS249-v17b
set name=cIOS249-v17b
set wadname=cIOS249-v17b
set ciosslot=unchanged
set md5=dff98dfa945112aecfda31ad3900dc75
set md5alt=4b0f722a5af36824c0a7de720172d9c9
set basewad=IOS38-64-v3867
set md5base=7aa687bdee18b2c201ad5edd3c239e55
set md5basealt=%md5base%
set code1=00000001
set code2=00000026
set version=3867
set basecios=cIOS249-v17b
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=0000000e
set cIOSFamilyName=waninkoko
set cIOSversionNum=17
goto:DBend


:cIOS250-v17b
set name=cIOS250-v17b
set wadname=cIOS250-v17b
set ciosslot=250
set ciosversion=65535
set md5=8d8a6655bf221be8897c30aa52b1c2ac
set md5alt=be6bc1420a287017f404bedab87ae026
set basewad=IOS38-64-v3867
set md5base=7aa687bdee18b2c201ad5edd3c239e55
set md5basealt=%md5base%
set code1=00000001
set code2=00000026
set version=3867
set basecios=cIOS249-v17b
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=0000000e
set cIOSFamilyName=waninkoko
set cIOSversionNum=17
goto:DBend



::WANIN'S V19 BASE 37
:cIOS249[37]-v19
set name=cIOS249[37]-v19
set wadname=cIOS249[37]-v19
set ciosslot=unchanged
set md5=b98ac3559567497cae3e0af28749bc64
set md5alt=3f4379eeb001bfff89ccd38e40450d67
set basewad=IOS37-64-v3869
set md5base=e3ead7b8ec59ce8859be3b37dbc9bc3d
set md5basealt=%md5base%
set code1=00000001
set code2=00000025
set version=3869
set basecios=cIOS249[37]-v19
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=0000000e
set cIOSFamilyName=waninkoko
set cIOSversionNum=19
goto:DBend


:cIOS250[37]-v19
set name=cIOS250[37]-v19
set wadname=cIOS250[37]-v19
set ciosslot=250
set ciosversion=65535
set md5=d203532a55358f40d2607d5435dc1574
set md5alt=98a79eaba9e6a0177c8eb11f728f93f1
set basewad=IOS37-64-v3869
set md5base=e3ead7b8ec59ce8859be3b37dbc9bc3d
set md5basealt=%md5base%
set code1=00000001
set code2=00000025
set version=3869
set basecios=cIOS249[37]-v19
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=0000000e
set cIOSFamilyName=waninkoko
set cIOSversionNum=19
goto:DBend



::WANIN'S V19 BASE 38
:cIOS249[38]-v19
set name=cIOS249[38]-v19
set wadname=cIOS249[38]-v19
set ciosslot=unchanged
set md5=9ba15ac66b321827e21026fa6cd1b04f
set md5alt=cb37d148ffcbf84c8c7a1eb68a71f934
set basewad=IOS38-64-v3867
set md5base=7aa687bdee18b2c201ad5edd3c239e55
set md5basealt=%md5base%
set code1=00000001
set code2=00000026
set version=3867
set basecios=cIOS249[38]-v19
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=0000000e
set cIOSFamilyName=waninkoko
set cIOSversionNum=19
goto:DBend


:cIOS250[38]-v19
set name=cIOS250[38]-v19
set wadname=cIOS250[38]-v19
set ciosslot=250
set ciosversion=65535
set md5=c216987bad6bac699af0ae6c6c7d5738
set md5alt=4f8c0077be1dc5b6fba90a49692f4ffa
set basewad=IOS38-64-v3867
set md5base=7aa687bdee18b2c201ad5edd3c239e55
set md5basealt=%md5base%
set code1=00000001
set code2=00000026
set version=3867
set basecios=cIOS249[38]-v19
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=0000000e
set cIOSFamilyName=waninkoko
set cIOSversionNum=19
goto:DBend


::WANIN'S V19 BASE 57
:cIOS249[57]-v19
set name=cIOS249[57]-v19
set wadname=cIOS249[57]-v19
set ciosslot=unchanged
set md5=5b756d6cc3ca20736bff8d925a9dd877
set md5alt=739ba9dc344554a63a7ab8a8fc281284
set basewad=IOS57-64-v5661
set md5base=757a3c6fd8a2eb449afd949cd7dc2507
set md5basealt=%md5base%
set basecios=cIOS249[57]-v19
set diffpath=%basecios%
set code1=00000001
set code2=00000039
set version=5661
set code2new=000000f9
set lastbasemodule=00000012
set cIOSFamilyName=waninkoko
set cIOSversionNum=19
goto:DBend


:cIOS250[57]-v19
set name=cIOS250[57]-v19
set wadname=cIOS250[57]-v19
set ciosslot=250
set ciosversion=65535
set md5=1755e220b994e45120ea905289c97724
set md5alt=2417198be5e525c1995ecfd605ef8672
set basewad=IOS57-64-v5661
set md5base=757a3c6fd8a2eb449afd949cd7dc2507
set md5basealt=%md5base%
set basecios=cIOS249[57]-v19
set diffpath=%basecios%
set code1=00000001
set code2=00000039
set version=5661
set code2new=000000f9
set lastbasemodule=00000012
set cIOSFamilyName=waninkoko
set cIOSversionNum=19
goto:DBend



::WANIN'S V20 BASE 38
:cIOS249[38]-v20
set name=cIOS249[38]-v20
set wadname=cIOS249[38]-v20
set ciosslot=unchanged
set md5=74b2f313224fd9ba7dec16eecea21949
set md5alt=426655e4050b68bcd7f02c59f73e7f8a
set basewad=IOS38-64-v4123
set md5base=e4048d42f7f3c8c65193bd443a42cdcb
set md5basealt=%md5base%
set code1=00000001
set code2=00000026
set version=4123
set basecios=cIOS249[38]-v20
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=0000000e
set cIOSFamilyName=waninkoko
set cIOSversionNum=20
goto:DBend

:cIOS250[38]-v20
set name=cIOS250[38]-v20
set wadname=cIOS250[38]-v20
set ciosslot=250
set ciosversion=65535
set md5=7a629c9288c2b89904956a2f7e07a7d0
set md5alt=d7611c0955d3f914201f3b4ad12040cf
set basewad=IOS38-64-v4123
set md5base=e4048d42f7f3c8c65193bd443a42cdcb
set md5basealt=%md5base%
set code1=00000001
set code2=00000026
set version=4123
set basecios=cIOS249[38]-v20
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=0000000e
set cIOSFamilyName=waninkoko
set cIOSversionNum=20
goto:DBend


::WANIN'S V20 BASE 56
:cIOS249[56]-v20
set name=cIOS249[56]-v20
set wadname=cIOS249[56]-v20
set ciosslot=unchanged
set md5=973742ce57938744afbbe689b415da6a
set md5alt=08ac3e029b2b4f8d24ced22930ff4600
set basewad=IOS56-64-v5661
set md5base=5cdee6593cf0dacc18cf300b12166fde
set md5basealt=%md5base%
set code1=00000001
set code2=00000038
set version=5661
set basecios=cIOS249[56]-v20
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=0000000e
set cIOSFamilyName=waninkoko
set cIOSversionNum=20
goto:DBend

:cIOS250[56]-v20
set name=cIOS250[56]-v20
set wadname=cIOS250[56]-v20
set ciosslot=250
set ciosversion=65535
set md5=6e8422260eb3740be64303354f37a780
set md5alt=85ee9907b02f734de08bbc0d050189a7
set basewad=IOS56-64-v5661
set md5base=5cdee6593cf0dacc18cf300b12166fde
set md5basealt=%md5base%
set code1=00000001
set code2=00000038
set version=5661
set basecios=cIOS249[56]-v20
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=0000000e
set cIOSFamilyName=waninkoko
set cIOSversionNum=20
goto:DBend


::WANIN'S V20 BASE 57
:cIOS249[57]-v20
set name=cIOS249[57]-v20
set wadname=cIOS249[57]-v20
set ciosslot=unchanged
set md5=a1a157985cc99047712b018bd3059ef8
set md5alt=c25fb5d2ac7bcb71d2b51bf593951f68
set basewad=IOS57-64-v5918
set md5base=ac8bbbea38f29e8d8959badb3badf18e
set md5basealt=%md5base%
set code1=00000001
set code2=00000039
set version=5918
set basecios=cIOS249[57]-v20
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=00000012
set cIOSFamilyName=waninkoko
set cIOSversionNum=20
goto:DBend

:cIOS250[57]-v20
set name=cIOS250[57]-v20
set wadname=cIOS250[57]-v20
set ciosslot=250
set ciosversion=65535
set md5=128f04cca48c2bc3a2e60d7f34ce16fa
set md5alt=3efdcf1e208a3145315c9005c2150bc2
set basewad=IOS57-64-v5918
set md5base=ac8bbbea38f29e8d8959badb3badf18e
set md5basealt=%md5base%
set code1=00000001
set code2=00000039
set version=5918
set basecios=cIOS249[57]-v20
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=00000012
set cIOSFamilyName=waninkoko
set cIOSversionNum=20
goto:DBend



::WANIN'S V21 BASE 37
:cIOS249[37]-v21
set name=cIOS249[37]-v21
set wadname=cIOS249[37]-v21
set ciosslot=unchanged
set md5=be4300b989dd53d71fcf5b8dbb940be8
set md5alt=71576a073c9ddcf2e547ddcf937b3e8c
set basewad=IOS37-64-v5662
set md5base=96bffc22dca8f458f2650f12606bb43b
set md5basealt=%md5base%
set code1=00000001
set code2=00000025
set version=5662
set basecios=cIOS249[37]-v21
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=0000000e
set cIOSFamilyName=waninkoko
set cIOSversionNum=21
goto:DBend

:cIOS250[37]-v21
set name=cIOS250[37]-v21
set wadname=cIOS250[37]-v21
set ciosslot=250
set ciosversion=65535
set md5=15bd9700e2025a2892ea9a8bc2e88b8b
set md5alt=f5eb39504a61b1fcbe4fa959b7fe954f
set basewad=IOS37-64-v5662
set md5base=96bffc22dca8f458f2650f12606bb43b
set md5basealt=%md5base%
set code1=00000001
set code2=00000025
set version=5662
set basecios=cIOS249[37]-v21
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=0000000e
set cIOSFamilyName=waninkoko
set cIOSversionNum=21
goto:DBend


::WANIN'S V21 BASE 38
:cIOS249[38]-v21
set name=cIOS249[38]-v21
set wadname=cIOS249[38]-v21
set ciosslot=unchanged
set md5=219450b423a81517ba1d79c09947a36a
set md5alt=efa7e77301df7326d4b8275ba7a4dda9
set basewad=IOS38-64-v4123
set md5base=e4048d42f7f3c8c65193bd443a42cdcb
set md5basealt=%md5base%
set code1=00000001
set code2=00000026
set version=4123
set basecios=cIOS249[38]-v21
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=0000000e
set cIOSFamilyName=waninkoko
set cIOSversionNum=21
goto:DBend

:cIOS250[38]-v21
set name=cIOS250[38]-v21
set wadname=cIOS250[38]-v21
set ciosslot=250
set ciosversion=65535
set md5=cda6cdb6bd7f9419656fed1307f80e06
set md5alt=30672506a4f2b7ce44258a47943a5d7b
set basewad=IOS38-64-v4123
set md5base=e4048d42f7f3c8c65193bd443a42cdcb
set md5basealt=%md5base%
set code1=00000001
set code2=00000026
set version=4123
set basecios=cIOS249[38]-v21
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=0000000e
set cIOSFamilyName=waninkoko
set cIOSversionNum=21
goto:DBend


::WANIN'S V21 BASE 53
:cIOS249[53]-v21
set name=cIOS249[53]-v21
set wadname=cIOS249[53]-v21
set ciosslot=unchanged
set md5=93057dccaef92e008d85ee71e55ec901
set md5alt=93098b96bc7154424870336b67683680
set basewad=IOS53-64-v5662
set md5base=3a6507609b6ef16ab2ebe4334d89f147
set md5basealt=%md5base%
set code1=00000001
set code2=00000035
set version=5662
set basecios=cIOS249[53]-v21
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=0000000e
set cIOSFamilyName=waninkoko
set cIOSversionNum=21
goto:DBend

:cIOS250[53]-v21
set name=cIOS250[53]-v21
set wadname=cIOS250[53]-v21
set ciosslot=250
set ciosversion=65535
set md5=90d4ae05fdfa8165829cae2701ff0ff4
set md5alt=c792973592d435bccf8742cac998c8be
set basewad=IOS53-64-v5662
set md5base=3a6507609b6ef16ab2ebe4334d89f147
set md5basealt=%md5base%
set code1=00000001
set code2=00000035
set version=5662
set basecios=cIOS249[53]-v21
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=0000000e
set cIOSFamilyName=waninkoko
set cIOSversionNum=21
goto:DBend


::WANIN'S V21 BASE 55
:cIOS249[55]-v21
set name=cIOS249[55]-v21
set wadname=cIOS249[55]-v21
set ciosslot=unchanged
set md5=d4a3b454438199973a1f405ce0deaed9
set md5alt=e59567fbed807bed13cfcbd9962a2a9a
set basewad=IOS55-64-v5662
set md5base=cddcdadcf38e7d147080f0843a6879d1
set md5basealt=%md5base%
set code1=00000001
set code2=00000037
set version=5662
set basecios=cIOS249[55]-v21
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=0000000e
set cIOSFamilyName=waninkoko
set cIOSversionNum=21
goto:DBend

:cIOS250[55]-v21
set name=cIOS250[55]-v21
set wadname=cIOS250[55]-v21
set ciosslot=250
set ciosversion=65535
set md5=439f8b48374ad4e43a9217edafec7952
set md5alt=6846abeb8464e0227fba641cba3183e4
set basewad=IOS55-64-v5662
set md5base=cddcdadcf38e7d147080f0843a6879d1
set md5basealt=%md5base%
set code1=00000001
set code2=00000037
set version=5662
set basecios=cIOS249[55]-v21
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=0000000e
set cIOSFamilyName=waninkoko
set cIOSversionNum=21
goto:DBend


::WANIN'S V21 BASE 56
:cIOS249[56]-v21
set name=cIOS249[56]-v21
set wadname=cIOS249[56]-v21
set ciosslot=unchanged
set md5=ed58b6e48f5c83f25d2fb63393066af7
set md5alt=4d5456441c58fb9cd81e941d12cbdfdb
set basewad=IOS56-64-v5661
set md5base=5cdee6593cf0dacc18cf300b12166fde
set md5basealt=%md5base%
set code1=00000001
set code2=00000038
set version=5661
set basecios=cIOS249[56]-v21
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=0000000e
set cIOSFamilyName=waninkoko
set cIOSversionNum=21
goto:DBend

:cIOS250[56]-v21
set name=cIOS250[56]-v21
set wadname=cIOS250[56]-v21
set ciosslot=250
set ciosversion=65535
set md5=8ea19a6026eabe99b2b38c854fe73b18
set md5alt=f977427b026d1559e93b504fef82deea
set basewad=IOS56-64-v5661
set md5base=5cdee6593cf0dacc18cf300b12166fde
set md5basealt=%md5base%
set code1=00000001
set code2=00000038
set version=5661
set basecios=cIOS249[56]-v21
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=0000000e
set cIOSFamilyName=waninkoko
set cIOSversionNum=21
goto:DBend

::WANIN'S V21 BASE 57
:cIOS249[57]-v21
set name=cIOS249[57]-v21
set wadname=cIOS249[57]-v21
set ciosslot=unchanged
set md5=ff4a32a702a435990b3d4b155112fce6
set md5alt=3763694a0fb6771d03a597fd5db8ec7a
set basewad=IOS57-64-v5918
set md5base=ac8bbbea38f29e8d8959badb3badf18e
set md5basealt=%md5base%
set code1=00000001
set code2=00000039
set version=5918
set basecios=cIOS249[57]-v21
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=00000012
set cIOSFamilyName=waninkoko
set cIOSversionNum=21
goto:DBend

:cIOS250[57]-v21
set name=cIOS250[57]-v21
set wadname=cIOS250[57]-v21
set ciosslot=250
set ciosversion=65535
set md5=454a1892e7872534a5fdbedcf075aaee
set md5alt=5a0b64bdd960e513fafb57a944d4ab14
set basewad=IOS57-64-v5918
set md5base=ac8bbbea38f29e8d8959badb3badf18e
set md5basealt=%md5base%
set code1=00000001
set code2=00000039
set version=5918
set basecios=cIOS249[57]-v21
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=00000012
set cIOSFamilyName=waninkoko
set cIOSversionNum=21
goto:DBend


::WANIN'S V21 BASE 58
:cIOS249[58]-v21
set name=cIOS249[58]-v21
set wadname=cIOS249[58]-v21
set ciosslot=unchanged
set md5=a05755c95e4452a0ed120d9b8de4faba
set md5alt=42853cf8bafdf696c7e9b79c466b7d49
set basewad=IOS58-64-v6175
set md5base=5956de5352583658a5e38257daaac0e7
set md5basealt=%md5base%
set code1=00000001
set code2=0000003a
set version=6175
set basecios=cIOS249[58]-v21
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=00000012
set cIOSFamilyName=waninkoko
set cIOSversionNum=21
goto:DBend

:cIOS250[58]-v21
set name=cIOS250[58]-v21
set wadname=cIOS250[58]-v21
set ciosslot=250
set ciosversion=65535
set md5=68aa669b178f2207c56d41e13acce969
set md5alt=f61fc322353f7a3ff7b6d58f5f1b0885
set basewad=IOS58-64-v6175
set md5base=5956de5352583658a5e38257daaac0e7
set md5basealt=%md5base%
set code1=00000001
set code2=0000003a
set version=6175
set basecios=cIOS249[58]-v21
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=00000012
set cIOSFamilyName=waninkoko
set cIOSversionNum=21
goto:DBend


::d2x cIOSs

:cIOS249[37]-d2x-v10-beta52
set name=cIOS249[37]-d2x-v11-beta3
set wadname=cIOS249[37]-d2x-v11-beta3
set ciosslot=249
set ciosversion=65535
set md5=e0e1c7701d972ce77d814ee918894cb2
set md5alt=3138fe23451795b52b8c7505df6ab478
set basewad=IOS37-64-v5662
set md5base=96bffc22dca8f458f2650f12606bb43b
set md5basealt=%md5base%
set code1=00000001
set code2=00000025
set version=5662
set basecios=cIOS249[37]-d2x-v11-beta3
set diffpath=cIOS249[37]-v21
set code2new=000000f9
set lastbasemodule=0000000e
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat
if %ciosversion% GEQ 21009 set diffpath=%diffpath:~0,-3%d2x-v9
goto:DBend

:cIOS250[37]-d2x-v10-beta52
set name=cIOS250[37]-d2x-v11-beta3
set wadname=cIOS250[37]-d2x-v11-beta3
set ciosslot=250
set ciosversion=65535
set md5=56a83d918186c767a36ec91fbaf4128a
set md5alt=76a616d225a9524b1b56b9a35bf7f055
set basewad=IOS37-64-v5662
set md5base=96bffc22dca8f458f2650f12606bb43b
set md5basealt=%md5base%
set code1=00000001
set code2=00000025
set version=5662
set basecios=cIOS249[37]-d2x-v11-beta3
set diffpath=cIOS249[37]-v21
set code2new=000000f9
set lastbasemodule=0000000e
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat
if %ciosversion% GEQ 21009 set diffpath=%diffpath:~0,-3%d2x-v9
goto:DBend

:cIOS249[38]-d2x-v10-beta52
set name=cIOS249[38]-d2x-v11-beta3
set wadname=cIOS249[38]-d2x-v11-beta3
set ciosslot=249
set ciosversion=65535
set md5=219119d32db538dbe63af9b3fe44ae50
set md5alt=c420bd8c80c22f32282eef65745d5e1f
set basewad=IOS38-64-v4123
set md5base=e4048d42f7f3c8c65193bd443a42cdcb
set md5basealt=%md5base%
set code1=00000001
set code2=00000026
set version=4123
set basecios=cIOS249[38]-d2x-v11-beta3
set diffpath=cIOS249[38]-v21
set code2new=000000f9
set lastbasemodule=0000000e
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat
if %ciosversion% GEQ 21009 set diffpath=%diffpath:~0,-3%d2x-v9
goto:DBend

:cIOS250[38]-d2x-v10-beta52
set name=cIOS250[38]-d2x-v11-beta3
set wadname=cIOS250[38]-d2x-v11-beta3
set ciosslot=250
set ciosversion=65535
set md5=d0e1a3012cffe2e8b0ec407caf18517d
set md5alt=053814b4f33b1ee5cbd39b4c32339ecc
set basewad=IOS38-64-v4123
set md5base=e4048d42f7f3c8c65193bd443a42cdcb
set md5basealt=%md5base%
set code1=00000001
set code2=00000026
set version=4123
set basecios=cIOS249[38]-d2x-v11-beta3
set diffpath=cIOS249[38]-v21
set code2new=000000f9
set lastbasemodule=0000000e
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat
if %ciosversion% GEQ 21009 set diffpath=%diffpath:~0,-3%d2x-v9
goto:DBend


:cIOS248[38]-d2x-v10-beta52
set name=cIOS248[38]-d2x-v11-beta3
set wadname=cIOS248[38]-d2x-v11-beta3
set ciosslot=248
set ciosversion=65535
set md5=b1e7b1585c90a9bed323a2a5d480cd7f
set md5alt=fa4cf4b54e476b0cf9939ff091fbe7f2
set basewad=IOS38-64-v4123
set md5base=e4048d42f7f3c8c65193bd443a42cdcb
set md5basealt=%md5base%
set code1=00000001
set code2=00000026
set version=4123
set basecios=cIOS249[38]-d2x-v11-beta3
set diffpath=cIOS249[38]-v21
set code2new=000000f9
set lastbasemodule=0000000e
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat
if %ciosversion% GEQ 21009 set diffpath=%diffpath:~0,-3%d2x-v9
goto:DBend



:cIOS249[53]-d2x-v10-beta52
set name=cIOS249[53]-d2x-v11-beta3
set wadname=cIOS249[53]-d2x-v11-beta3
set ciosslot=249
set ciosversion=65535
set md5=6be73ed1d8d88c3de414bb44a83899f8
set md5alt=3151b883573c5a3ea3a386a295c6efda
set basewad=IOS53-64-v5662
set md5base=3a6507609b6ef16ab2ebe4334d89f147
set md5basealt=%md5base%
set code1=00000001
set code2=00000035
set version=5662
set basecios=cIOS249[53]-d2x-v11-beta3
set diffpath=cIOS249[53]-v21
set code2new=000000f9
set lastbasemodule=0000000e
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat
if %ciosversion% GEQ 21009 set diffpath=%diffpath:~0,-3%d2x-v9
goto:DBend

:cIOS250[53]-d2x-v10-beta52
set name=cIOS250[53]-d2x-v11-beta3
set wadname=cIOS250[53]-d2x-v11-beta3
set ciosslot=250
set ciosversion=65535
set md5=1d4dd0eed3294506789a20142a1b4d9e
set md5alt=75d78c1c1c920edc7bb884f334b19bd5
set basewad=IOS53-64-v5662
set md5base=3a6507609b6ef16ab2ebe4334d89f147
set md5basealt=%md5base%
set code1=00000001
set code2=00000035
set version=5662
set basecios=cIOS249[53]-d2x-v11-beta3
set diffpath=cIOS249[53]-v21
set code2new=000000f9
set lastbasemodule=0000000e
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat
if %ciosversion% GEQ 21009 set diffpath=%diffpath:~0,-3%d2x-v9
goto:DBend


:cIOS249[55]-d2x-v10-beta52
set name=cIOS249[55]-d2x-v11-beta3
set wadname=cIOS249[55]-d2x-v11-beta3
set ciosslot=249
set ciosversion=65535
set md5=c4271dd38663dff8ab3482f508da8c09
set md5alt=f4fad2e89624271b92012f834b93797d
set basewad=IOS55-64-v5662
set md5base=cddcdadcf38e7d147080f0843a6879d1
set md5basealt=%md5base%
set code1=00000001
set code2=00000037
set version=5662
set basecios=cIOS249[55]-d2x-v11-beta3
set diffpath=cIOS249[55]-v21
set code2new=000000f9
set lastbasemodule=0000000e
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat
if %ciosversion% GEQ 21009 set diffpath=%diffpath:~0,-3%d2x-v9
goto:DBend

:cIOS250[55]-d2x-v10-beta52
set name=cIOS250[55]-d2x-v11-beta3
set wadname=cIOS250[55]-d2x-v11-beta3
set ciosslot=250
set ciosversion=65535
set md5=4ae402b52f7b73cf896bab7f5f8ce151
set md5alt=b96bd2ae5af3417a9d75b211ef966d6c
set basewad=IOS55-64-v5662
set md5base=cddcdadcf38e7d147080f0843a6879d1
set md5basealt=%md5base%
set code1=00000001
set code2=00000037
set version=5662
set basecios=cIOS249[55]-d2x-v11-beta3
set diffpath=cIOS249[55]-v21
set code2new=000000f9
set lastbasemodule=0000000e
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat
if %ciosversion% GEQ 21009 set diffpath=%diffpath:~0,-3%d2x-v9
goto:DBend


:cIOS249[56]-d2x-v10-beta52
set name=cIOS249[56]-d2x-v11-beta3
set wadname=cIOS249[56]-d2x-v11-beta3
set ciosslot=249
set ciosversion=65535
set md5=734c9b1acc62150619fb43c09acbef88
set md5alt=4e52564b0c228bb951ec8a810e80b53d
set basewad=IOS56-64-v5661
set md5base=5cdee6593cf0dacc18cf300b12166fde
set md5basealt=%md5base%
set code1=00000001
set code2=00000038
set version=5661
set basecios=cIOS249[56]-d2x-v11-beta3
set diffpath=cIOS249[56]-v21
set code2new=000000f9
set lastbasemodule=0000000e
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat
if %ciosversion% GEQ 21009 set diffpath=%diffpath:~0,-3%d2x-v9
goto:DBend

:cIOS250[56]-d2x-v10-beta52
set name=cIOS250[56]-d2x-v11-beta3
set wadname=cIOS250[56]-d2x-v11-beta3
set ciosslot=250
set ciosversion=65535
set md5=18c87c2b4b44c3ba39dcd21e3c60052b
set md5alt=0e9d9b142d4bf2a5ede80169ed55fb8f
set basewad=IOS56-64-v5661
set md5base=5cdee6593cf0dacc18cf300b12166fde
set md5basealt=%md5base%
set code1=00000001
set code2=00000038
set version=5661
set basecios=cIOS249[56]-d2x-v11-beta3
set diffpath=cIOS249[56]-v21
set code2new=000000f9
set lastbasemodule=0000000e
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat
if %ciosversion% GEQ 21009 set diffpath=%diffpath:~0,-3%d2x-v9
goto:DBend


:cIOS249[57]-d2x-v10-beta52
set name=cIOS249[57]-d2x-v11-beta3
set wadname=cIOS249[57]-d2x-v11-beta3
set ciosslot=249
set ciosversion=65535
set md5=791f0d8521979bde6c82649c4bc0296b
set md5alt=3204eb19e7cf59d3829f356fcd6d9144
set basewad=IOS57-64-v5918
set md5base=ac8bbbea38f29e8d8959badb3badf18e
set md5basealt=%md5base%
set code1=00000001
set code2=00000039
set version=5918
set basecios=cIOS249[57]-d2x-v11-beta3
set diffpath=cIOS249[57]-v21
set code2new=000000f9
set lastbasemodule=00000012
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat
if %ciosversion% GEQ 21009 set diffpath=%diffpath:~0,-3%d2x-v9
goto:DBend


:cIOS250[57]-d2x-v10-beta52
set name=cIOS250[57]-d2x-v11-beta3
set wadname=cIOS250[57]-d2x-v11-beta3
set ciosslot=250
set ciosversion=65535
set md5=9bc7cf280185ab9865e9bc012f1061b5
set md5alt=617ddb0427d1a48dbab2c54156a09fac
set basewad=IOS57-64-v5918
set md5base=ac8bbbea38f29e8d8959badb3badf18e
set md5basealt=%md5base%
set code1=00000001
set code2=00000039
set version=5918
set basecios=cIOS249[57]-d2x-v11-beta3
set diffpath=cIOS249[57]-v21
set code2new=000000f9
set lastbasemodule=00000012
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat
if %ciosversion% GEQ 21009 set diffpath=%diffpath:~0,-3%d2x-v9
goto:DBend


:cIOS249[58]-d2x-v10-beta52
set name=cIOS249[58]-d2x-v11-beta3
set wadname=cIOS249[58]-d2x-v11-beta3
set ciosslot=249
set ciosversion=65535
set md5=e686bc8ea74e88b4c5895921a3c192c1
set md5alt=be28c327ac3d51f4b79ac623651ef3e1
set basewad=IOS58-64-v6175
set md5base=5956de5352583658a5e38257daaac0e7
set md5basealt=%md5base%
set code1=00000001
set code2=0000003a
set version=6175
set basecios=cIOS249[58]-d2x-v11-beta3
set diffpath=cIOS249[58]-v21
set code2new=000000f9
set lastbasemodule=00000012
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat
if %ciosversion% GEQ 21009 set diffpath=%diffpath:~0,-3%d2x-v9
goto:DBend

:cIOS250[58]-d2x-v10-beta52
set name=cIOS250[58]-d2x-v11-beta3
set wadname=cIOS250[58]-d2x-v11-beta3
set ciosslot=250
set ciosversion=65535
set md5=e1abd9f6e453f369e5093ef46d4bc8fa
set md5alt=b3cc99200e62cae0695a5d9ef373cf35
set basewad=IOS58-64-v6175
set md5base=5956de5352583658a5e38257daaac0e7
set md5basealt=%md5base%
set code1=00000001
set code2=0000003a
set version=6175
set basecios=cIOS249[58]-d2x-v11-beta3
set diffpath=cIOS249[58]-v21
set code2new=000000f9
set lastbasemodule=00000012
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat
if %ciosversion% GEQ 21009 set diffpath=%diffpath:~0,-3%d2x-v9
goto:DBend

:cIOS251[58]-d2x-v10-beta52
set name=cIOS251[58]-d2x-v11-beta3
set wadname=cIOS251[58]-d2x-v11-beta3
set ciosslot=251
set ciosversion=65535
set md5=18bf7927b29d2a5d38681e8e9c07cd7f
set md5alt=93b3cd865c2d3b5afc2603e6d9b226d2
set basewad=IOS58-64-v6175
set md5base=5956de5352583658a5e38257daaac0e7
set md5basealt=%md5base%
set code1=00000001
set code2=0000003a
set version=6175
set basecios=cIOS249[58]-d2x-v11-beta3
set diffpath=cIOS249[58]-v21
set code2new=000000f9
set lastbasemodule=00000012
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat
if %ciosversion% GEQ 21009 set diffpath=%diffpath:~0,-3%d2x-v9
goto:DBend


:cIOS249[60]-d2x-v10-beta52
set name=cIOS249[60]-d2x-v11-beta3
set wadname=cIOS249[60]-d2x-v11-beta3
set ciosslot=249
set ciosversion=65535
set md5=5705d714ea70ae846e400381a54c3854
set md5alt=bf776e16a57d808b94e13763d6019592
set basewad=IOS60-64-v6174
set md5base=631238cee654c276a134678c7f32f4df
set md5basealt=%md5base%
set code1=00000001
set code2=0000003c
set version=6174
set basecios=cIOS249[60]-d2x-v11-beta3
set diffpath=cIOS249[60]-v21
set code2new=000000f9
set lastbasemodule=0000000e
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat
if %ciosversion% GEQ 21009 set diffpath=%diffpath:~0,-3%d2x-v9
goto:DBend

:cIOS250[60]-d2x-v10-beta52
set name=cIOS250[60]-d2x-v11-beta3
set wadname=cIOS250[60]-d2x-v11-beta3
set ciosslot=250
set ciosversion=65535
set md5=b4af27865a61fdfd38e7a562e4acf3f2
set md5alt=c826f2afe112278ce5846539077ebf5e
set basewad=IOS60-64-v6174
set md5base=631238cee654c276a134678c7f32f4df
set md5basealt=%md5base%
set code1=00000001
set code2=0000003c
set version=6174
set basecios=cIOS249[60]-d2x-v11-beta3
set diffpath=cIOS249[60]-v21
set code2new=000000f9
set lastbasemodule=0000000e
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat
if %ciosversion% GEQ 21009 set diffpath=%diffpath:~0,-3%d2x-v9
goto:DBend


:cIOS249[70]-d2x-v10-beta52
set name=cIOS249[70]-d2x-v11-beta3
set wadname=cIOS249[70]-d2x-v11-beta3
set ciosslot=249
set ciosversion=65535
set md5=e61781283e25831b6aad76e852b11959
set md5alt=85fe56614be706037374f67fc705aa1c
set basewad=IOS70-64-v6687
set md5base=ace10fdbad63fe10362543e56ae5081f
set md5basealt=%md5base%
set code1=00000001
set code2=00000046
set version=6687
set basecios=cIOS249[70]-d2x-v11-beta3
set diffpath=cIOS249[70]-v21
set code2new=000000f9
set lastbasemodule=0000000e
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat
if %ciosversion% GEQ 21009 set diffpath=%diffpath:~0,-3%d2x-v9
goto:DBend

:cIOS250[70]-d2x-v10-beta52
set name=cIOS250[70]-d2x-v11-beta3
set wadname=cIOS250[70]-d2x-v11-beta3
set ciosslot=250
set ciosversion=65535
set md5=2f32da0fbc73beceab8a65eb7c333823
set md5alt=b682d6ebdd54d748f8e8179025eb5362
set basewad=IOS70-64-v6687
set md5base=ace10fdbad63fe10362543e56ae5081f
set md5basealt=%md5base%
set code1=00000001
set code2=00000046
set version=6687
set basecios=cIOS249[70]-d2x-v11-beta3
set diffpath=cIOS249[70]-v21
set code2new=000000f9
set lastbasemodule=0000000e
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat
if %ciosversion% GEQ 21009 set diffpath=%diffpath:~0,-3%d2x-v9
goto:DBend

:cIOS249[80]-d2x-v10-beta52
set name=cIOS249[80]-d2x-v11-beta3
set wadname=cIOS249[80]-d2x-v11-beta3
set ciosslot=249
set ciosversion=65535
set md5=f156601761c86c2fc7c38a2b3a44d0b2
set md5alt=18e23d596f7982d7c7360187d2785761
set basewad=IOS80-64-v6943
set md5base=a7540a54d37b0275f625238d54c438d8
set md5basealt=%md5base%
set code1=00000001
set code2=00000050
set version=6943
set basecios=cIOS249[80]-d2x-v11-beta3
set diffpath=cIOS249[80]-v21
set code2new=000000f9
set lastbasemodule=0000000e
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat
if %ciosversion% GEQ 21009 set diffpath=%diffpath:~0,-3%d2x-v9
goto:DBend

:cIOS250[80]-d2x-v10-beta52
set name=cIOS250[80]-d2x-v11-beta3
set wadname=cIOS250[80]-d2x-v11-beta3
set ciosslot=250
set ciosversion=65535
set md5=ccdebe42c8d1720ffe50f1a6568c5a00
set md5alt=26ca39152ab64e7f44c560bd81111d19
set basewad=IOS80-64-v6943
set md5base=a7540a54d37b0275f625238d54c438d8
set md5basealt=%md5base%
set code1=00000001
set code2=00000050
set version=6943
set basecios=cIOS249[80]-d2x-v11-beta3
set diffpath=cIOS249[80]-v21
set code2new=000000f9
set lastbasemodule=0000000e
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat
if %ciosversion% GEQ 21009 set diffpath=%diffpath:~0,-3%d2x-v9
goto:DBend

::------------------vWii d2x cIOSs--------------------

:cIOS248[38]-d2x-vWii
set name=cIOS248[38]-d2x-v11-beta3-vWii
set "wadname=%name%"
set ciosslot=248
set ciosversion=65535
set md5=4ab18ac0e49ac3d69ca42ee90a96ea86
set md5alt=%md5%
set basewad=vIOS38-64-v4380-vWii
set md5base=d90930aad2fed6f356cd3fcf0c0a0b37
set md5basealt=%md5base%
set code1=00000007
set code2=00000026
set version=4380
set "basecios=%name%"
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat
goto:DBend

:cIOS249[56]-d2x-vWii
set name=cIOS249[56]-d2x-v11-beta3-vWii
set "wadname=%name%"
set ciosslot=249
set ciosversion=65535
set md5=2c251cf33f5f1c0fe0a138e23b0cf52c
set md5alt=%md5%
set basewad=vIOS56-64-v5918-vWii
set md5base=680656b494cb283ed0c81b02ca609a83
set md5basealt=%md5base%
set code1=00000007
set code2=00000038
set version=5918
set "basecios=%name%"
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat
goto:DBend

:cIOS250[57]-d2x-vWii
set name=cIOS250[57]-d2x-v11-beta3-vWii
set "wadname=%name%"
set ciosslot=250
set ciosversion=65535
set md5=f78a70de9228c748411edd6c98d6e0b5
set md5alt=%md5%
set basewad=vIOS57-64-v6175-vWii
set md5base=cdfd7b2e674c224132b87d6187465bed
set md5basealt=%md5base%
set code1=00000007
set code2=00000039
set version=6175
set "basecios=%name%"
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat
goto:DBend


:cIOS251[58]-d2x-vWii
set name=cIOS251[58]-d2x-v11-beta3-vWii
set "wadname=%name%"
set ciosslot=251
set ciosversion=65535
set md5=349c745c596e1d25757a4c2e2195c645
set md5alt=%md5%
set basewad=vIOS58-64-v6432-vWii
set md5base=fcd1ef330e1a5e157f3882b7ff6d60c8
set md5basealt=%md5base%
set code1=00000007
set code2=0000003a
set version=6432
set "basecios=%name%"
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat
goto:DBend

::------------------CMIOSs--------------------

:RVL-cMIOS-v65535(v10)_WiiGator_WiiPower_v0.2
set name=WiiGator+WiiPower cMIOS-v65535(v10)
set wadname=RVL-cMIOS-v65535(v10)_WiiGator_WiiPower_v0.2
set ciosslot=unchanged
set md5=d04d8743f86df8699f872304493f6b3a
set md5alt=015e9d2725666e43c1be8305cff1b040
set basewad=RVL-mios-v10
set md5base=2359fe4eca6a25d84326e9da610576a6
set md5basebalt=%md5baseb%
set code1=00000001
set code2=00000101
set version=10
set basecios=RVL-cMIOS-v65535(v10)_WiiGator_WiiPower_v0.2
set diffpath=%basecios%
set code2new=00000101
goto:DBend


:Swiss_cMIOS
set name=Swiss cMIOS r1788
set wadname=RVL-cMIOS[10]_Swiss_r1788
set ciosslot=unchanged
set md5=4bdeff6b69a25047e707f6600e462cef
set md5alt=%md5%
set basewad=RVL-mios-v10
set md5base=2359fe4eca6a25d84326e9da610576a6
set md5basebalt=%md5baseb%
set code1=00000001
set code2=00000101
set version=10
set basecios=RVL-cMIOS[10]_Swiss_r1788
set diffpath=%basecios%
set code2new=00000101
goto:DBend


:RVL-cmios-v4_WiiGator_GCBL_v0.2
set name=cMIOS-v4 WiiGator GCBL v0.2
set wadname=RVL-cmios-v4_WiiGator_GCBL_v0.2
set ciosslot=unchanged
set md5=3ea68908f6fdea52de2a2a2561074660
set md5alt=674823e79fa844c4dda3253feb73c1b9
set basewad=RVL-mios-v4
set md5base=363bdce5ac61655241175d41cb3eeb38
set code1=00000001
set code2=00000101
set version=4
set basecios=RVL-cmios-v4_WiiGator_GCBL_v0.2
set diffpath=%basecios%
set code2new=00000101
goto:DBend

:RVL-cmios-v4_Waninkoko_rev5
set name=cMIOS-v4 Waninkoko rev5
set wadname=RVL-cmios-v4_Waninkoko_rev5
set ciosslot=unchanged
set md5=c392d59f10fbd9f3f3f2ad405c43464a
set md5alt=eb83cf72ed83fa046a0b28f5d9d5e70e
set basewad=RVL-mios-v4
set md5base=363bdce5ac61655241175d41cb3eeb38
set code1=00000001
set code2=00000101
set version=4
set basecios=RVL-cmios-v4_Waninkoko_rev5
set diffpath=%basecios%
set code2new=00000101
goto:DBend


::-----------THEMES-------------

:DarkWii_Red_4.1U
set name=DarkWii Red Theme (4.1U) - %effect%
set wadname=DarkWii_Red_%effect%_4.1U
if /i "%effect%" EQU "No-Spin" set md5=5a35523ad74c5bc1db86a3762f04c5f0
if /i "%effect%" EQU "Spin" set md5=b980bdeebe4ce58b38fe52b8b053a7c7
if /i "%effect%" EQU "Fast-Spin" set md5=4c4bf74f1df31cc1dfec6b6a4be3f405
set mym1=4-X_DarkWii_Red_NTSC.mym
set md5mym1=f5c50fe1ff29772a68e8e16996be57f6
set version=449
set dlname=0000007b_4.1U.app
set md5base=6b939de8222800733f4c44ae4eadb325
set category=themes
set code1=00000001
set code2=00000002
goto:DBend

:DarkWii_Red_4.2U
set name=DarkWii Red Theme (4.2U) - %effect%
set wadname=DarkWii_Red_%effect%_4.2U
if /i "%effect%" EQU "No-Spin" set md5=ab3e5c96440dc8bc79eb41d49c3b3dfc
if /i "%effect%" EQU "Spin" set md5=976c1cf30e2db73c1157d7b947353a4d
if /i "%effect%" EQU "Fast-Spin" set md5=4ec4d4f32a2a267ed924502af7bacb30
set mym1=4-X_DarkWii_Red_NTSC.mym
set md5mym1=f5c50fe1ff29772a68e8e16996be57f6
set version=481
set dlname=00000087_4.2U.app
set md5base=7079948c6aed8aae6009e4fdf27c7171
set category=themes
set code1=00000001
set code2=00000002
goto:DBend

:DarkWii_Red_4.3U
set name=DarkWii Red Theme (4.3U) - %effect%
set wadname=DarkWii_Red_%effect%_4.3U
if /i "%effect%" EQU "No-Spin" set md5=daa093de4da55abb5acc32a2df64cedf
if /i "%effect%" EQU "Spin" set md5=e40293b6dc79bcc95e4b0753b64941c1
if /i "%effect%" EQU "Fast-Spin" set md5=139aa9b276fdc7cadf6a775489431fdc
set mym1=4-X_DarkWii_Red_NTSC.mym
set md5mym1=f5c50fe1ff29772a68e8e16996be57f6
set version=513
set dlname=00000097_4.3U.app
set md5base=f388c9b11543ac2fe0912ab96064ee37
set category=themes
set code1=00000001
set code2=00000002
goto:DBend

:DarkWii_Red_4.1E
set name=DarkWii Red Theme (4.1E) - %effect%
set wadname=DarkWii_Red_%effect%_4.1E
if /i "%effect%" EQU "No-Spin" set md5=5d2808f2ada0febd5cb25e6b27ee73ec
if /i "%effect%" EQU "Spin" set md5=6ee40eb0097c1c017174124f4bb72ab3
if /i "%effect%" EQU "Fast-Spin" set md5=5fead311c48b57434c23c97448472ace
set mym1=DarkWii_Red_No-Spin_4.XE_V2.mym
set md5mym1=543130dbc6ece1d4a666586ed084d714
set version=450
set dlname=0000007e_4.1E.app
set md5base=574a3a144971ea0ec61bf8cef8d7ff80
set category=themes
set code1=00000001
set code2=00000002
goto:DBend

:DarkWii_Red_4.2E
set name=DarkWii Red Theme (4.2E) - %effect%
set wadname=DarkWii_Red_%effect%_4.2E
if /i "%effect%" EQU "No-Spin" set md5=98ce754a9892ecdb0a49684051eaef79
if /i "%effect%" EQU "Spin" set md5=02c167e5a533eda4d31f58b362d966cf
if /i "%effect%" EQU "Fast-Spin" set md5=85b71837f9ae655ebbb8e052cfd327b8
set mym1=DarkWii_Red_No-Spin_4.XE_V2.mym
set md5mym1=543130dbc6ece1d4a666586ed084d714
set version=482
set dlname=0000008a_4.2E.app
set md5base=7e7994f78941afb51e9a20085deac305
set category=themes
set code1=00000001
set code2=00000002
goto:DBend

:DarkWii_Red_4.3E
set name=DarkWii Red Theme (4.3E) - %effect%
set wadname=DarkWii_Red_%effect%_4.3E
if /i "%effect%" EQU "No-Spin" set md5=b856d3a18101d3bf1d0032c981f434ea
if /i "%effect%" EQU "Spin" set md5=057c14d23c191e3c547769b6525f2242
if /i "%effect%" EQU "Fast-Spin" set md5=7e4ed76b41a6ded82f791f379e3ef464
set mym1=DarkWii_Red_No-Spin_4.XE_V2.mym
set md5mym1=543130dbc6ece1d4a666586ed084d714
set version=514
set dlname=0000009a_4.3E.app
set md5base=41310f79497c56850c37676074ee1237
set category=themes
set code1=00000001
set code2=00000002
goto:DBend

:DarkWii_Red_4.1J
set name=DarkWii Red Theme (4.1J) - %effect%
set wadname=DarkWii_Red_%effect%_4.1J
if /i "%effect%" EQU "No-Spin" set md5=6eb1e07e0378a01e6304ab4fce134485
if /i "%effect%" EQU "Spin" set md5=53ac82aa03c4c3533ce3fe8581679b31
if /i "%effect%" EQU "Fast-Spin" set md5=6a4d65d177cf8cabfcc7888da05c2a88
set mym1=4-X_DarkWii_Red_JAP.mym
set md5mym1=002f0bbd351bd1cad5fb514701654820
::000000**.app
set version=448
set dlname=00000078_4.1J.app
set md5base=f2eadf12d18e793373060222b870057d
set category=themes
set code1=00000001
set code2=00000002
goto:DBend

:DarkWii_Red_4.2J
set name=DarkWii Red Theme (4.2J) - %effect%
set wadname=DarkWii_Red_%effect%_4.2J
if /i "%effect%" EQU "No-Spin" set md5=66cddcce45c692d13beea27736dd5267
if /i "%effect%" EQU "Spin" set md5=e22199dcc4a7a4c3183d475f74184eb1
if /i "%effect%" EQU "Fast-Spin" set md5=804ef9fa711eed98f4c96b1d5dd81a6c
set mym1=4-X_DarkWii_Red_JAP.mym
set md5mym1=002f0bbd351bd1cad5fb514701654820
set version=480
set dlname=00000084_4.2J.app
set md5base=b08998e582c48afba3a14f6d9e1e9373
set category=themes
set code1=00000001
set code2=00000002
goto:DBend

:DarkWii_Red_4.3J
set name=DarkWii Red Theme (4.3J) - %effect%
set wadname=DarkWii_Red_%effect%_4.3J
if /i "%effect%" EQU "No-Spin" set md5=8c336b26db747466a8d8129e8dd735eb
if /i "%effect%" EQU "Spin" set md5=568f91399425b7c35a9d2f7ecf447c89
if /i "%effect%" EQU "Fast-Spin" set md5=f53225b6443b1041b6c7e4c684f5adbc
set mym1=4-X_DarkWii_Red_JAP.mym
set md5mym1=002f0bbd351bd1cad5fb514701654820
set version=512
set dlname=00000094_4.3J.app
set md5base=5b3ee6942a3cda716badbce3665076fc
set category=themes
set code1=00000001
set code2=00000002
goto:DBend

:DarkWii_Red_4.1K
set name=DarkWii Red Theme (4.1K) - %effect%
set wadname=DarkWii_Red_%effect%_4.1K
if /i "%effect%" EQU "No-Spin" set md5=4e210ac672ddef9fd4281b8f027be5d5
if /i "%effect%" EQU "Spin" set md5=ec5af75e40ab416e49e49776c2353922
if /i "%effect%" EQU "Fast-Spin" set md5=df038625344627dbe95960bd36fefa09
set mym1=4-X_DarkWii_Red_KOR.mym
set md5mym1=cd208dd893c972a61bcd18612b6fe37b
set version=454
set dlname=00000081_4.1K.app
set md5base=7eedbf1a146b29b63edbb55e04f81f98
set category=themes
set code1=00000001
set code2=00000002
goto:DBend

:DarkWii_Red_4.2K
set name=DarkWii Red Theme (4.2K) - %effect%
set wadname=DarkWii_Red_%effect%_4.2K
if /i "%effect%" EQU "No-Spin" set md5=46fdc79bf2f2ec31f498b7c3fc95eb5d
if /i "%effect%" EQU "Spin" set md5=fe41d1685a845f4a8dce00f67afe2232
if /i "%effect%" EQU "Fast-Spin" set md5=6e6eeba26b19b75ddb898e06670193c1
set mym1=4-X_DarkWii_Red_KOR.mym
set md5mym1=cd208dd893c972a61bcd18612b6fe37b
set version=486
set dlname=0000008d_4.2K.app
set md5base=9d72a1966370e44cb4c456c17a077bec
set category=themes
set code1=00000001
set code2=00000002
goto:DBend

:DarkWii_Red_4.3K
set name=DarkWii Red Theme (4.3K) - %effect%
set wadname=DarkWii_Red_%effect%_4.3K
if /i "%effect%" EQU "No-Spin" set md5=b2d7318a0c2f237fc1e38b928c59967c
if /i "%effect%" EQU "Spin" set md5=4cd061b8315c7f08f317b9965072b2cb
if /i "%effect%" EQU "Fast-Spin" set md5=b7b2913f20b9409af4e16673c4dbdfff
set mym1=4-X_DarkWii_Red_KOR.mym
set md5mym1=cd208dd893c972a61bcd18612b6fe37b
set version=518
set dlname=0000009d_4.3K.app
set md5base=e6f2b0d4d5e0c095895f186009bf9516
set category=themes
set code1=00000001
set code2=00000002
goto:DBend

:DarkWii_Green_4.1U
set name=DarkWii Green Theme (4.1U) - %effect%
set wadname=DarkWii_Green_%effect%_4.1U
if /i "%effect%" EQU "No-Spin" set md5=a60b422f8cf2454f278e3e83d4a056c3
if /i "%effect%" EQU "Spin" set md5=94fb57f22fdbc6ad4d707315bd46ea58
if /i "%effect%" EQU "Fast-Spin" set md5=c255f12f12daca03a67347fc0c527237
set mym1=4-X_DarkWii_green_NTSC.mym
set md5mym1=57b80bcb73780514588396de33f4ced0
set version=449
set dlname=0000007b_4.1U.app
set md5base=6b939de8222800733f4c44ae4eadb325
set category=themes
set code1=00000001
set code2=00000002
goto:DBend

:DarkWii_Green_4.2U
set name=DarkWii Green Theme (4.2U) - %effect%
set wadname=DarkWii_Green_%effect%_4.2U
if /i "%effect%" EQU "No-Spin" set md5=4710dfb2e0109ca9491f72712419a0eb
if /i "%effect%" EQU "Spin" set md5=b80eeb65db32b478d6c3aa85c46c4f08
if /i "%effect%" EQU "Fast-Spin" set md5=7eeda3abe2f441b31337c29426293830
set mym1=4-X_DarkWii_green_NTSC.mym
set md5mym1=57b80bcb73780514588396de33f4ced0
set version=481
set dlname=00000087_4.2U.app
set md5base=7079948c6aed8aae6009e4fdf27c7171
set category=themes
set code1=00000001
set code2=00000002
goto:DBend

:DarkWii_Green_4.3U
set name=DarkWii Green Theme (4.3U) - %effect%
set wadname=DarkWii_Green_%effect%_4.3U
if /i "%effect%" EQU "No-Spin" set md5=384cac8a04d5899aa60ec8cd2f6f8bca
if /i "%effect%" EQU "Spin" set md5=c2f584ab98ff82e0789af25fc79e4f36
if /i "%effect%" EQU "Fast-Spin" set md5=64e36afaf02c8a0c1a47b21680dfdab4
set mym1=4-X_DarkWii_green_NTSC.mym
set md5mym1=57b80bcb73780514588396de33f4ced0
set version=513
set dlname=00000097_4.3U.app
set md5base=f388c9b11543ac2fe0912ab96064ee37
set category=themes
set code1=00000001
set code2=00000002
goto:DBend

:DarkWii_Green_4.1E
set name=DarkWii Green Theme (4.1E) - %effect%
set wadname=DarkWii_Green_%effect%_4.1E
if /i "%effect%" EQU "No-Spin" set md5=55978344479c3abf6c9648e92c58209c
if /i "%effect%" EQU "Spin" set md5=84940c65af00a8faad1c35d55877a0fa
if /i "%effect%" EQU "Fast-Spin" set md5=dcffb6be25e2b0fa75e6cfb04070cf7a
set mym1=DarkWii_Green_No-Spin_4.XE_V2.mym
set md5mym1=34c991872b67273307c7bc7aa522b09d
set version=450
set dlname=0000007e_4.1E.app
set md5base=574a3a144971ea0ec61bf8cef8d7ff80
set category=themes
set code1=00000001
set code2=00000002
goto:DBend

:DarkWii_Green_4.2E
set name=DarkWii Green Theme (4.2E) - %effect%
set wadname=DarkWii_Green_%effect%_4.2E
if /i "%effect%" EQU "No-Spin" set md5=bb2a3f079ca17b19a5953aff98e8ba9d
if /i "%effect%" EQU "Spin" set md5=e950a2602c5b15936da322757c4f1f6d
if /i "%effect%" EQU "Fast-Spin" set md5=3ea3db1216e391acb3f697b2d60e9205
set mym1=DarkWii_Green_No-Spin_4.XE_V2.mym
set md5mym1=34c991872b67273307c7bc7aa522b09d
set version=482
set dlname=0000008a_4.2E.app
set md5base=7e7994f78941afb51e9a20085deac305
set category=themes
set code1=00000001
set code2=00000002
goto:DBend

:DarkWii_Green_4.3E
set name=DarkWii Green Theme (4.3E) - %effect%
set wadname=DarkWii_Green_%effect%_4.3E
if /i "%effect%" EQU "No-Spin" set md5=4cc51aec0f96c28cfe512027b9e555aa
if /i "%effect%" EQU "Spin" set md5=1f870c4f34c59254e75bc6892ec75bd0
if /i "%effect%" EQU "Fast-Spin" set md5=8a60eff1a5fa8317d488b18f804a225a
set mym1=DarkWii_Green_No-Spin_4.XE_V2.mym
set md5mym1=34c991872b67273307c7bc7aa522b09d
set version=514
set dlname=0000009a_4.3E.app
set md5base=41310f79497c56850c37676074ee1237
set category=themes
set code1=00000001
set code2=00000002
goto:DBend

:DarkWii_Green_4.1J
set name=DarkWii Green Theme (4.1J) - %effect%
set wadname=DarkWii_Green_%effect%_4.1J
if /i "%effect%" EQU "No-Spin" set md5=4d0998aa124bde3261359cfabdd6cb61
if /i "%effect%" EQU "Spin" set md5=7cb9693876dd3f4bc45fcd5a63683d71
if /i "%effect%" EQU "Fast-Spin" set md5=9d72f623abf064c92bf1f21d34bfc638
set mym1=4-X_DarkWii_green_JAP.mym
set md5mym1=5cfe52f11b20287a6af3e6c4894a76e6
::000000**.app
set version=448
set dlname=00000078_4.1J.app
set md5base=f2eadf12d18e793373060222b870057d
set category=themes
set code1=00000001
set code2=00000002
goto:DBend

:DarkWii_Green_4.2J
set name=DarkWii Green Theme (4.2J) - %effect%
set wadname=DarkWii_Green_%effect%_4.2J
if /i "%effect%" EQU "No-Spin" set md5=267c49e45e282a2ae0eeef0c75eb8a6e
if /i "%effect%" EQU "Spin" set md5=07e0d0a90d97f415aeba57cd8f9a811e
if /i "%effect%" EQU "Fast-Spin" set md5=2ce1809c3a772c183222d669818a7cff
set mym1=4-X_DarkWii_green_JAP.mym
set md5mym1=5cfe52f11b20287a6af3e6c4894a76e6
set version=480
set dlname=00000084_4.2J.app
set md5base=b08998e582c48afba3a14f6d9e1e9373
set category=themes
set code1=00000001
set code2=00000002
goto:DBend

:DarkWii_Green_4.3J
set name=DarkWii Green Theme (4.3J) - %effect%
set wadname=DarkWii_Green_%effect%_4.3J
if /i "%effect%" EQU "No-Spin" set md5=e18753f64513b91a98252490ac9e8c5c
if /i "%effect%" EQU "Spin" set md5=4cc0753aa1391e938328ee45ba386c75
if /i "%effect%" EQU "Fast-Spin" set md5=039f70b8dc6b51a092cb45c1de71215c
set mym1=4-X_DarkWii_green_JAP.mym
set md5mym1=5cfe52f11b20287a6af3e6c4894a76e6
set version=512
set dlname=00000094_4.3J.app
set md5base=5b3ee6942a3cda716badbce3665076fc
set category=themes
set code1=00000001
set code2=00000002
goto:DBend

:DarkWii_Green_4.1K
set name=DarkWii Green Theme (4.1K) - %effect%
set wadname=DarkWii_Green_%effect%_4.1K
if /i "%effect%" EQU "No-Spin" set md5=2462d00aff8144520a054f0378394f54
if /i "%effect%" EQU "Spin" set md5=03bdd5f3cbce4c852303cdd5a794b007
if /i "%effect%" EQU "Fast-Spin" set md5=d86ecf26d5f53b92beab9e9e3a8a1dbb
set mym1=4-X_DarkWii_green_KOR.mym
set md5mym1=cd616652a7e52cd2a8f7dda26f574001
set version=454
set dlname=00000081_4.1K.app
set md5base=7eedbf1a146b29b63edbb55e04f81f98
set category=themes
set code1=00000001
set code2=00000002
goto:DBend

:DarkWii_Green_4.2K
set name=DarkWii Green Theme (4.2K) - %effect%
set wadname=DarkWii_Green_%effect%_4.2K
if /i "%effect%" EQU "No-Spin" set md5=b5ff49c077776ef0c8ba4fa6bf2c700c
if /i "%effect%" EQU "Spin" set md5=0ffc7574df89bb9852b8cbd0e8f8436d
if /i "%effect%" EQU "Fast-Spin" set md5=7fc14e61f0771926d206688d3c25f803
set mym1=4-X_DarkWii_green_KOR.mym
set md5mym1=cd616652a7e52cd2a8f7dda26f574001
set version=486
set dlname=0000008d_4.2K.app
set md5base=9d72a1966370e44cb4c456c17a077bec
set category=themes
set code1=00000001
set code2=00000002
goto:DBend

:DarkWii_Green_4.3K
set name=DarkWii Green Theme (4.3K) - %effect%
set wadname=DarkWii_Green_%effect%_4.3K
if /i "%effect%" EQU "No-Spin" set md5=a4520e4ccf332f1de676d237602ae248
if /i "%effect%" EQU "Spin" set md5=3495f6c3c30bf80f7082001b58ec1d98
if /i "%effect%" EQU "Fast-Spin" set md5=79f4e7ce9c0d04e397b63e4e257af55a
set mym1=4-X_DarkWii_green_KOR.mym
set md5mym1=cd616652a7e52cd2a8f7dda26f574001
set version=518
set dlname=0000009d_4.3K.app
set md5base=e6f2b0d4d5e0c095895f186009bf9516
set category=themes
set code1=00000001
set code2=00000002
goto:DBend

::---Dark Wii Blue Themes and SM WADs----

:DarkWii_Blue_4.1U
set name=DarkWii Blue Theme (4.1U) - %effect%
set wadname=DarkWii_Blue_%effect%_4.1U
if /i "%effect%" EQU "No-Spin" set md5=d2980e025738d88a03830303788e1c1a
if /i "%effect%" EQU "Spin" set md5=8cdd3813e18ba60f5ccd7cf2d7efe061
if /i "%effect%" EQU "Fast-Spin" set md5=4e9b81df4cc75fe05f73c29d26be214d
set mym1=4-X_DarkWii_darkblue_NTSC.mym
set md5mym1=ea9d5eacd4a49a0c4323d48f432c85b5
set version=449
set dlname=0000007b_4.1U.app
set md5base=6b939de8222800733f4c44ae4eadb325
set category=themes
set code1=00000001
set code2=00000002
goto:DBend

:DarkWii_Blue_4.2U
set name=DarkWii Blue Theme (4.2U) - %effect%
set wadname=DarkWii_Blue_%effect%_4.2U
if /i "%effect%" EQU "No-Spin" set md5=1d364e96b8e663e322c8dc91c3c3171f
if /i "%effect%" EQU "Spin" set md5=ae008a01c65f497254d0dd6b7f18968b
if /i "%effect%" EQU "Fast-Spin" set md5=a512da06f111a60a9961360ae772ae7f
set mym1=4-X_DarkWii_darkblue_NTSC.mym
set md5mym1=ea9d5eacd4a49a0c4323d48f432c85b5
set version=481
set dlname=00000087_4.2U.appset version=481
set dlname=00000087_4.2U.app
set md5base=7079948c6aed8aae6009e4fdf27c7171
set category=themes
set code1=00000001
set code2=00000002
goto:DBend

:DarkWii_Blue_4.3U
set name=DarkWii Blue Theme (4.3U) - %effect%
set wadname=DarkWii_Blue_%effect%_4.3U
if /i "%effect%" EQU "No-Spin" set md5=9e85913698da621f788a9d5c96b4e05f
if /i "%effect%" EQU "Spin" set md5=8af7b4e1e980eec51049552c4fa32909
if /i "%effect%" EQU "Fast-Spin" set md5=110ad70a75c21857801f09a7a6c9c905
set mym1=4-X_DarkWii_darkblue_NTSC.mym
set md5mym1=ea9d5eacd4a49a0c4323d48f432c85b5
set version=513
set dlname=00000097_4.3U.app
set md5base=f388c9b11543ac2fe0912ab96064ee37
set category=themes
set code1=00000001
set code2=00000002
goto:DBend

:DarkWii_Blue_4.1E
set name=DarkWii Blue Theme (4.1E) - %effect%
set wadname=DarkWii_Blue_%effect%_4.1E
if /i "%effect%" EQU "No-Spin" set md5=d37933cef8d38042b75a194ec4fe8c86
if /i "%effect%" EQU "Spin" set md5=20cf269483a3d31129ca8234bad877b2
if /i "%effect%" EQU "Fast-Spin" set md5=067ac1f3442479b4a482cf326220a997
set mym1=DarkWii_Blue_No-Spin_4.XE_V2.mym
set md5mym1=26f80d142dec2451e65f8ef03d108413
set version=450
set dlname=0000007e_4.1E.app
set md5base=574a3a144971ea0ec61bf8cef8d7ff80
set category=themes
set code1=00000001
set code2=00000002
goto:DBend

:DarkWii_Blue_4.2E
set name=DarkWii Blue Theme (4.2E) - %effect%
set wadname=DarkWii_Blue_%effect%_4.2E
if /i "%effect%" EQU "No-Spin" set md5=7e2711437a4845f54da8155f6927943e
if /i "%effect%" EQU "Spin" set md5=fdf38aa48f227c66b5a79add15c97582
if /i "%effect%" EQU "Fast-Spin" set md5=d44a1d716e1970ea2855536b09430a41
set mym1=DarkWii_Blue_No-Spin_4.XE_V2.mym
set md5mym1=26f80d142dec2451e65f8ef03d108413
set version=482
set dlname=0000008a_4.2E.app
set md5base=7e7994f78941afb51e9a20085deac305
set category=themes
set code1=00000001
set code2=00000002
goto:DBend

:DarkWii_Blue_4.3E
set name=DarkWii Blue Theme (4.3E) - %effect%
set wadname=DarkWii_Blue_%effect%_4.3E
if /i "%effect%" EQU "No-Spin" set md5=16d6022b7ed02be1ece7532e0e194e61
if /i "%effect%" EQU "Spin" set md5=9241b6d13a6c51b3feb62b0524c76b01
if /i "%effect%" EQU "Fast-Spin" set md5=5610abac827b30dc6243ae5e05b4101c
set mym1=DarkWii_Blue_No-Spin_4.XE_V2.mym
set md5mym1=26f80d142dec2451e65f8ef03d108413
set version=514
set dlname=0000009a_4.3E.app
set md5base=41310f79497c56850c37676074ee1237
set category=themes
set code1=00000001
set code2=00000002
goto:DBend

:DarkWii_Blue_4.1J
set name=DarkWii Blue Theme (4.1J) - %effect%
set wadname=DarkWii_Blue_%effect%_4.1J
if /i "%effect%" EQU "No-Spin" set md5=ae9c933c2c641e2c9f8b98f196d5ff46
if /i "%effect%" EQU "Spin" set md5=e15d452acaa41479a789439064cadaea
if /i "%effect%" EQU "Fast-Spin" set md5=b5fe986367e9b1add83336e48afe25df
set mym1=4-X_DarkWii_darkblue_JAP.mym
set md5mym1=5a3a3643d013cd501b35b041f34333a1
::000000**.app
set version=448
set dlname=00000078_4.1J.app
set md5base=f2eadf12d18e793373060222b870057d
set category=themes
set code1=00000001
set code2=00000002
goto:DBend

:DarkWii_Blue_4.2J
set name=DarkWii Blue Theme (4.2J) - %effect%
set wadname=DarkWii_Blue_%effect%_4.2J
if /i "%effect%" EQU "No-Spin" set md5=ca38a8ed7eb311d03a5f3d9d16113e2a
if /i "%effect%" EQU "Spin" set md5=f98d4b6a96750ff87787b2868e803880
if /i "%effect%" EQU "Fast-Spin" set md5=60502ab6a369d892e10874bcf2cc6e0a
set mym1=4-X_DarkWii_darkblue_JAP.mym
set md5mym1=5a3a3643d013cd501b35b041f34333a1
set version=480
set dlname=00000084_4.2J.app
set md5base=b08998e582c48afba3a14f6d9e1e9373
set category=themes
set code1=00000001
set code2=00000002
goto:DBend

:DarkWii_Blue_4.3J
set name=DarkWii Blue Theme (4.3J) - %effect%
set wadname=DarkWii_Blue_%effect%_4.3J
if /i "%effect%" EQU "No-Spin" set md5=21f5f43f29edb6fb4290d57ecf7ef2b6
if /i "%effect%" EQU "Spin" set md5=456a798b61b392c6ceb06cf670a0479e
if /i "%effect%" EQU "Fast-Spin" set md5=4da21a05b296d9c817af747cae4c1744
set mym1=4-X_DarkWii_darkblue_JAP.mym
set md5mym1=5a3a3643d013cd501b35b041f34333a1
set version=512
set dlname=00000094_4.3J.app
set md5base=5b3ee6942a3cda716badbce3665076fc
set category=themes
set code1=00000001
set code2=00000002
goto:DBend

:DarkWii_Blue_4.1K
set name=DarkWii Blue Theme (4.1K) - %effect%
set wadname=DarkWii_Blue_%effect%_4.1K
if /i "%effect%" EQU "No-Spin" set md5=f8fbc476d24c63652a6caf9760c8341f
if /i "%effect%" EQU "Spin" set md5=6c44eb7dd2abd53ac74f60e285e0604e
if /i "%effect%" EQU "Fast-Spin" set md5=3500ba5a28654f2b6f8a7b84afce95a7
set mym1=4-X_DarkWii_darkblue_KOR.mym
set md5mym1=171a0eee45e22440091c5035e1652455
set version=454
set dlname=00000081_4.1K.app
set md5base=7eedbf1a146b29b63edbb55e04f81f98
set category=themes
set code1=00000001
set code2=00000002
goto:DBend

:DarkWii_Blue_4.2K
set name=DarkWii Blue Theme (4.2K) - %effect%
set wadname=DarkWii_Blue_%effect%_4.2K
if /i "%effect%" EQU "No-Spin" set md5=16fd30053d0b9c2aef893fc17d9ee74c
if /i "%effect%" EQU "Spin" set md5=c46ac07036364707e92cf2fa2690e647
if /i "%effect%" EQU "Fast-Spin" set md5=479ed3ff8ff0927eb69604380202b523
set mym1=4-X_DarkWii_darkblue_KOR.mym
set md5mym1=171a0eee45e22440091c5035e1652455
set version=486
set dlname=0000008d_4.2K.app
set md5base=9d72a1966370e44cb4c456c17a077bec
set category=themes
set code1=00000001
set code2=00000002
goto:DBend

:DarkWii_Blue_4.3K
set name=DarkWii Blue Theme (4.3K) - %effect%
set wadname=DarkWii_Blue_%effect%_4.3K
if /i "%effect%" EQU "No-Spin" set md5=714ff7fd3c3f35ca69f021bb2401db12
if /i "%effect%" EQU "Spin" set md5=e33e819b4cabb80a8d96056cd17f743d
if /i "%effect%" EQU "Fast-Spin" set md5=2871695986f82653edc26c5c52ad2548
set mym1=4-X_DarkWii_darkblue_KOR.mym
set md5mym1=171a0eee45e22440091c5035e1652455
set version=518
set dlname=0000009d_4.3K.app
set md5base=e6f2b0d4d5e0c095895f186009bf9516
set category=themes
set code1=00000001
set code2=00000002
goto:DBend


::----------------------------------


:SM4.3U-DWB
set name=System Menu 4.3U with Dark Wii Blue Theme - %effect%
set wadname=SystemMenu_4.3U_v513_DarkWiiBlue_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=40ecb3746c733849a46de13e08b62929
if /i "%effect%" EQU "Spin" set md5=e934c723dc4a5fe9b5066df94f318865
if /i "%effect%" EQU "Fast-Spin" set md5=c1e13e498142cbd5f76aa649c8710027
set md5alt=%md5%
set basewad=SystemMenu_4.3U_v513
set basecios=%basewad%
set md5base=417358284cce02dbb0fed3ef30b0b59d
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=4-X_DarkWii_darkblue_NTSC.mym
set md5mym1=ea9d5eacd4a49a0c4323d48f432c85b5
set version=513
set lastbasemodule=00000001
set category=SMTHEME
goto:DBend

:SM4.2U-DWB
set name=System Menu 4.2U with Dark Wii Blue Theme - %effect%
set wadname=SystemMenu_4.2U_v481_DarkWiiBlue_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=e6512a9d3c20ef5d098620722c97aae1
if /i "%effect%" EQU "Spin" set md5=832a1362cb3d93003eadac91e2011abd
if /i "%effect%" EQU "Fast-Spin" set md5=210f5e6f79b09e33ed591e4e1908b126
set md5alt=%md5%
set basewad=SystemMenu_4.2U_v481
set basecios=%basewad%
set md5base=b4eda5b30d090c9256b60441d83c9d65
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=4-X_DarkWii_darkblue_NTSC.mym
set md5mym1=ea9d5eacd4a49a0c4323d48f432c85b5
set version=481
set lastbasemodule=00000001
set category=SMTHEME
goto:DBend

:SM4.1U-DWB
set name=System Menu 4.1U with Dark Wii Blue Theme - %effect%
set wadname=SystemMenu_4.1U_v449_DarkWiiBlue_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=6a6d5cd0988b9492d8b3415e00f9af69
if /i "%effect%" EQU "Spin" set md5=d9a6816358837b211e73f88bf60951f7
if /i "%effect%" EQU "Fast-Spin" set md5=075ed682cae80b7f1bec75bf0f049498
set md5alt=%md5%
set basewad=SystemMenu_4.1U_v449
set basecios=%basewad%
set md5base=555d2c0bc92ccd05c6f6a57412ebbd37
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=4-X_DarkWii_darkblue_NTSC.mym
set md5mym1=ea9d5eacd4a49a0c4323d48f432c85b5
set version=449
set lastbasemodule=00000001
set category=SMTHEME
goto:DBend

:SM4.3E-DWB
set name=System Menu 4.3E with Dark Wii Blue Theme - %effect%
set wadname=SystemMenu_4.3E_v514_DarkWiiBlue_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=b5c9dca0c1a925f2db4b09992ba44797
if /i "%effect%" EQU "Spin" set md5=4875d0669a829cd031ef09aa122b1ead
if /i "%effect%" EQU "Fast-Spin" set md5=2fea610c29c78fde9defd703acba16ce
::md5alt's are from 7.0.3 (not fakesigned but modmii tagged)
if /i "%effect%" EQU "No-Spin" set md5alt=46c3a6cde1b78402169c4a81af8a4d66
if /i "%effect%" EQU "Spin" set md5alt=8d9a36a01ac98ceec8e11768371fc186
if /i "%effect%" EQU "Fast-Spin" set md5alt=85a881e197aba4476d3c5dd03e705b9d
set basewad=SystemMenu_4.3E_v514
set basecios=%basewad%
set md5base=cad93ca3ca41704b15bbee95b2e6aae2
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=DarkWii_Blue_No-Spin_4.XE_V2.mym
set md5mym1=26f80d142dec2451e65f8ef03d108413
set version=514
set lastbasemodule=00000001
set category=SMTHEME
goto:DBend

:SM4.2E-DWB
set name=System Menu 4.2E with Dark Wii Blue Theme - %effect%
set wadname=SystemMenu_4.2E_v482_DarkWiiBlue_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=9c2d2a04c1210f7a256ec3ca14b9fe02
if /i "%effect%" EQU "Spin" set md5=b6679289fdc368faa7384b6a7210347b
if /i "%effect%" EQU "Fast-Spin" set md5=e85bc87b092c0159099c04d0dcf6f100
::md5alt's are from 7.0.3 (not fakesigned but modmii tagged)
if /i "%effect%" EQU "No-Spin" set md5alt=2484f10fee5c9aeebbf2edccb7c368e4
if /i "%effect%" EQU "Spin" set md5alt=ece08aabb3465d8fb783ed4a2b53093a
if /i "%effect%" EQU "Fast-Spin" set md5alt=87ccfd648c3c1ffe351f7b67745d2892
set basewad=SystemMenu_4.2E_v482
set basecios=%basewad%
set md5base=efd76ac375914bf5969c74f8fb4fef75
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=DarkWii_Blue_No-Spin_4.XE_V2.mym
set md5mym1=26f80d142dec2451e65f8ef03d108413
set version=482
set lastbasemodule=00000001
set category=SMTHEME
goto:DBend

:SM4.1E-DWB
set name=System Menu 4.1E with Dark Wii Blue Theme - %effect%
set wadname=SystemMenu_4.1E_v450_DarkWiiBlue_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=34c9e851e143be08298853554c01d6da
if /i "%effect%" EQU "Spin" set md5=25a845c5844b28fde832594d170cebbb
if /i "%effect%" EQU "Fast-Spin" set md5=2ed179cddb893841ee14dc337df56951
::md5alt's are from 7.0.3 (not fakesigned but modmii tagged)
if /i "%effect%" EQU "No-Spin" set md5alt=bb2cc00ef2240f9ee30f96923c8ec10f
if /i "%effect%" EQU "Spin" set md5alt=0de7cce13ddc60b12ea03fc4ebb443c2
if /i "%effect%" EQU "Fast-Spin" set md5alt=54e597368370778548d09ee2b557ae81
set basewad=SystemMenu_4.1E_v450
set basecios=%basewad%
set md5base=d19af34181c46645002efb130f6ea44c
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=DarkWii_Blue_No-Spin_4.XE_V2.mym
set md5mym1=26f80d142dec2451e65f8ef03d108413
set version=450
set lastbasemodule=00000001
set category=SMTHEME
goto:DBend

:SM4.3J-DWB
set name=System Menu 4.3J with Dark Wii Blue Theme - %effect%
set wadname=SystemMenu_4.3J_v512_DarkWiiBlue_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=4b7cba779ba83360f9ad029d8cf46792
if /i "%effect%" EQU "Spin" set md5=6c9538887789e9b2466bfa18f0a40125
if /i "%effect%" EQU "Fast-Spin" set md5=ff112400809521304b099f6248fef47b
set md5alt=%md5%
set basewad=SystemMenu_4.3J_v512
set basecios=%basewad%
set md5base=9552e63c8e0b6688e788639fb1c14e13
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=4-X_DarkWii_darkblue_JAP.mym
set md5mym1=5a3a3643d013cd501b35b041f34333a1
set version=512
set lastbasemodule=00000001
set category=SMTHEME
goto:DBend

:SM4.2J-DWB
set name=System Menu 4.2J with Dark Wii Blue Theme - %effect%
set wadname=SystemMenu_4.2J_v480_DarkWiiBlue_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=b9cd35d05e9f215c86c7e813c8c5037c
if /i "%effect%" EQU "Spin" set md5=69a53d79377ed406bf5195bd09ea54b3
if /i "%effect%" EQU "Fast-Spin" set md5=cbdd3f2ea038321547499677a64e7f86
set md5alt=%md5%
set basewad=SystemMenu_4.2J_v480
set basecios=%basewad%
set md5base=ffa08cfaf2a9bb4f6adffa812ab535ac
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=4-X_DarkWii_darkblue_JAP.mym
set md5mym1=5a3a3643d013cd501b35b041f34333a1
set version=480
set lastbasemodule=00000001
set category=SMTHEME
goto:DBend

:SM4.1J-DWB
set name=System Menu 4.1J with Dark Wii Blue Theme - %effect%
set wadname=SystemMenu_4.1J_v448_DarkWiiBlue_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=79ff2bc78490d950b9515f2588794553
if /i "%effect%" EQU "Spin" set md5=ebd700849c10d2c58ef10b55ba1735c3
if /i "%effect%" EQU "Fast-Spin" set md5=5e1e4f4e69c1bf8465cdcc14fc90226d
set md5alt=%md5%
set basewad=SystemMenu_4.1J_v448
set basecios=%basewad%
set md5base=5574337ec2c36cd9a9c15b8008ca4dd2
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=4-X_DarkWii_darkblue_JAP.mym
set md5mym1=5a3a3643d013cd501b35b041f34333a1
set version=448
set lastbasemodule=00000001
set category=SMTHEME
goto:DBend


:SM4.3K-DWB
set name=System Menu 4.3K with Dark Wii Blue Theme - %effect%
set wadname=SystemMenu_4.3K_v518_DarkWiiBlue_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=fbee4308a9b0c55eaa17382947786841
if /i "%effect%" EQU "Spin" set md5=758c24527fa92b01d65fd08e406aa5b1
if /i "%effect%" EQU "Fast-Spin" set md5=3a466ad622406932b79f2f0a4d1e6337
set md5alt=%md5%
set basewad=SystemMenu_4.3K_v518
set basecios=%basewad%
set md5base=775159a42dc1d12b9304fbbbe7415d80
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=4-X_DarkWii_darkblue_KOR.mym
set md5mym1=171a0eee45e22440091c5035e1652455
set version=518
set lastbasemodule=00000001
set category=SMTHEME
goto:DBend

:SM4.2K-DWB
set name=System Menu 4.2K with Dark Wii Blue Theme - %effect%
set wadname=SystemMenu_4.2K_v486_DarkWiiBlue_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=c97268a051eaf82081365a1d4d4e07d5
if /i "%effect%" EQU "Spin" set md5=41e4d4651b65dd3110551fd2087c3835
if /i "%effect%" EQU "Fast-Spin" set md5=e056d414aadfde7b543b77e0e6eb3087
set md5alt=%md5%
set basewad=SystemMenu_4.2K_v486
set basecios=%basewad%
set md5base=d225a6ff7130ea4cc63638b0d38a54e7
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=4-X_DarkWii_darkblue_KOR.mym
set md5mym1=171a0eee45e22440091c5035e1652455
set version=486
set lastbasemodule=00000001
set category=SMTHEME
goto:DBend

:SM4.1K-DWB
set name=System Menu 4.1K with Dark Wii Blue Theme - %effect%
set wadname=SystemMenu_4.1K_v454_DarkWiiBlue_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=1f46ece598cdb99c2fef17f2a4ef7488
if /i "%effect%" EQU "Spin" set md5=b2dc4f6f3fca1c42ebeb14a7912ab28f
if /i "%effect%" EQU "Fast-Spin" set md5=b01d4d6ab32b610379e7cbd07559df80
set md5alt=%md5%
set basewad=SystemMenu_4.1K_v454
set basecios=%basewad%
set md5base=6326365089b5d71f36907f7315364a5f
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=4-X_DarkWii_darkblue_KOR.mym
set md5mym1=171a0eee45e22440091c5035e1652455
set version=454
set lastbasemodule=00000001
set category=SMTHEME
goto:DBend



::---Dark Wii Orange Themes and SM WADs----

:darkwii_orange_4.1U
set name=DarkWii Orange Theme (4.1U) - %effect%
set wadname=DarkWii_Orange_%effect%_4.1U
if /i "%effect%" EQU "No-Spin" set md5=59e59652557ccb5ef04be1e63e892a5c
if /i "%effect%" EQU "Spin" set md5=8914ce3f551ea7d81f8317f09c503d78
if /i "%effect%" EQU "Fast-Spin" set md5=aa35fbc1ed1b757ced1a05528cc0c8b1
set mym1=4-X_DarkWii_orange_NTSC.mym
set md5mym1=c3526b0a46f908dc8aaa88b5065bd126
set version=449
set dlname=0000007b_4.1U.app
set md5base=6b939de8222800733f4c44ae4eadb325
set category=themes
set code1=00000001
set code2=00000002
goto:DBend

:darkwii_orange_4.2U
set name=DarkWii Orange Theme (4.2U) - %effect%
set wadname=DarkWii_Orange_%effect%_4.2U
if /i "%effect%" EQU "No-Spin" set md5=4145dd94a97043c6d697ac3c8e2d1747
if /i "%effect%" EQU "Spin" set md5=ab0bf7c9d7b375e3701a96e563f95964
if /i "%effect%" EQU "Fast-Spin" set md5=bf33fc221370f7b77fac273d97a4dd40
set mym1=4-X_DarkWii_orange_NTSC.mym
set md5mym1=c3526b0a46f908dc8aaa88b5065bd126
set version=481
set dlname=00000087_4.2U.app
set md5base=7079948c6aed8aae6009e4fdf27c7171
set category=themes
set code1=00000001
set code2=00000002
goto:DBend

:darkwii_orange_4.3U
set name=DarkWii Orange Theme (4.3U) - %effect%
set wadname=DarkWii_Orange_%effect%_4.3U
if /i "%effect%" EQU "No-Spin" set md5=c753766c5c11d1bd3aad1666fd9a04ba
if /i "%effect%" EQU "Spin" set md5=14629d2365c4d50a4f52a3c14799567d
if /i "%effect%" EQU "Fast-Spin" set md5=53dd9db8d5eb640cf035ae4e959053ba
set mym1=4-X_DarkWii_orange_NTSC.mym
set md5mym1=c3526b0a46f908dc8aaa88b5065bd126
set version=513
set dlname=00000097_4.3U.app
set md5base=f388c9b11543ac2fe0912ab96064ee37
set category=themes
set code1=00000001
set code2=00000002
goto:DBend

:darkwii_orange_4.1E
set name=DarkWii Orange Theme (4.1E) - %effect%
set wadname=DarkWii_Orange_%effect%_4.1E
if /i "%effect%" EQU "No-Spin" set md5=e0d27a68ad4f4f50c55cd0a1c0c6a9c1
if /i "%effect%" EQU "Spin" set md5=304882153024e3114fb7395541636813
if /i "%effect%" EQU "Fast-Spin" set md5=af7b016edb12b5a3d14fd10cc1cf38b1
set mym1=DarkWii_Orange_No-Spin_4.XE_V2.mym
set md5mym1=25862c24642701a0fd2548d1e7565d5d
set version=450
set dlname=0000007e_4.1E.app
set md5base=574a3a144971ea0ec61bf8cef8d7ff80
set category=themes
set code1=00000001
set code2=00000002
goto:DBend

:darkwii_orange_4.2E
set name=DarkWii Orange Theme (4.2E) - %effect%
set wadname=DarkWii_Orange_%effect%_4.2E
if /i "%effect%" EQU "No-Spin" set md5=1b49d810a964d44dacb447561879ab46
if /i "%effect%" EQU "Spin" set md5=e93ebab4579522b7f3cc5955cc3baff7
if /i "%effect%" EQU "Fast-Spin" set md5=6a105c6474a1515550cdc9070a0f5d82
set mym1=DarkWii_Orange_No-Spin_4.XE_V2.mym
set md5mym1=25862c24642701a0fd2548d1e7565d5d
set version=482
set dlname=0000008a_4.2E.app
set md5base=7e7994f78941afb51e9a20085deac305
set category=themes
set code1=00000001
set code2=00000002
goto:DBend

:darkwii_orange_4.3E
set name=DarkWii Orange Theme (4.3E) - %effect%
set wadname=DarkWii_Orange_%effect%_4.3E
if /i "%effect%" EQU "No-Spin" set md5=80ec7694bbcfa772726e9f512d13f96a
if /i "%effect%" EQU "Spin" set md5=6c80e5a4fd0026a81332589641cf7b09
if /i "%effect%" EQU "Fast-Spin" set md5=968052e16890a982c66a697c4d8d249d
set mym1=DarkWii_Orange_No-Spin_4.XE_V2.mym
set md5mym1=25862c24642701a0fd2548d1e7565d5d
set version=514
set dlname=0000009a_4.3E.app
set md5base=41310f79497c56850c37676074ee1237
set category=themes
set code1=00000001
set code2=00000002
goto:DBend

:darkwii_orange_4.1J
set name=DarkWii Orange Theme (4.1J) - %effect%
set wadname=DarkWii_Orange_%effect%_4.1J
if /i "%effect%" EQU "No-Spin" set md5=290f3b3a689de16da850841c76612c17
if /i "%effect%" EQU "Spin" set md5=0fe5503d7d487bf7d1d257a75df8bc05
if /i "%effect%" EQU "Fast-Spin" set md5=f041707a714e63c16cb34ca6c9c7eb78
set mym1=4-X_DarkWii_orange_JAP.mym
set md5mym1=887ba0484c3ac115050caea26e66bd32
::000000**.app
set version=448
set dlname=00000078_4.1J.app
set md5base=f2eadf12d18e793373060222b870057d
set category=themes
set code1=00000001
set code2=00000002
goto:DBend

:darkwii_orange_4.2J
set name=DarkWii Orange Theme (4.2J) - %effect%
set wadname=DarkWii_Orange_%effect%_4.2J
if /i "%effect%" EQU "No-Spin" set md5=e4f264af6e5bbe59bd8e4388ef4974ce
if /i "%effect%" EQU "Spin" set md5=2c38ee314f531e620fb77e555539962d
if /i "%effect%" EQU "Fast-Spin" set md5=a16a90a5cadb946f775fff9c1af2e6bd
set mym1=4-X_DarkWii_orange_JAP.mym
set md5mym1=887ba0484c3ac115050caea26e66bd32
set version=480
set dlname=00000084_4.2J.app
set md5base=b08998e582c48afba3a14f6d9e1e9373
set category=themes
set code1=00000001
set code2=00000002
goto:DBend

:darkwii_orange_4.3J
set name=DarkWii Orange Theme (4.3J) - %effect%
set wadname=DarkWii_Orange_%effect%_4.3J
if /i "%effect%" EQU "No-Spin" set md5=6733abd78364cf85a36c2cab57a411d5
if /i "%effect%" EQU "Spin" set md5=a8197d6a130db2a501fd9c58afb74e24
if /i "%effect%" EQU "Fast-Spin" set md5=b52414592488d00d2ac47ad53ae151d2
set mym1=4-X_DarkWii_orange_JAP.mym
set md5mym1=887ba0484c3ac115050caea26e66bd32
set version=512
set dlname=00000094_4.3J.app
set md5base=5b3ee6942a3cda716badbce3665076fc
set category=themes
set code1=00000001
set code2=00000002
goto:DBend

:darkwii_orange_4.1K
set name=DarkWii Orange Theme (4.1K) - %effect%
set wadname=DarkWii_Orange_%effect%_4.1K
if /i "%effect%" EQU "No-Spin" set md5=52d22b6444bf3ffa7cdac8a33955c190
if /i "%effect%" EQU "Spin" set md5=46c388551f67f4cddbac36dbd5638edf
if /i "%effect%" EQU "Fast-Spin" set md5=ea0d2deb1aa4720edae1ba1ceab44fca
set mym1=4-X_DarkWii_orange_KOR.mym
set md5mym1=4d3873a7e56cc1165d233570b43c19c0
set version=454
set dlname=00000081_4.1K.app
set md5base=7eedbf1a146b29b63edbb55e04f81f98
set category=themes
set code1=00000001
set code2=00000002
goto:DBend

:darkwii_orange_4.2K
set name=DarkWii Orange Theme (4.2K) - %effect%
set wadname=DarkWii_Orange_%effect%_4.2K
if /i "%effect%" EQU "No-Spin" set md5=103c52b1a13562fcaa981d5637668d68
if /i "%effect%" EQU "Spin" set md5=f2c4b20cc89170636c281742c9e12a6e
if /i "%effect%" EQU "Fast-Spin" set md5=d4ebf85eb37dec6a7147239025015200
set mym1=4-X_DarkWii_orange_KOR.mym
set md5mym1=4d3873a7e56cc1165d233570b43c19c0
set version=486
set dlname=0000008d_4.2K.app
set md5base=9d72a1966370e44cb4c456c17a077bec
set category=themes
set code1=00000001
set code2=00000002
goto:DBend

:darkwii_orange_4.3K
set name=DarkWii Orange Theme (4.3K) - %effect%
set wadname=DarkWii_Orange_%effect%_4.3K
if /i "%effect%" EQU "No-Spin" set md5=ebad8ff3c12810ecb8046312c7f5f9bf
if /i "%effect%" EQU "Spin" set md5=6965a59afcd016a15019b66a5c1663f5
if /i "%effect%" EQU "Fast-Spin" set md5=2caa5bd51ff2ccc1038da9a9807b9ef6
set mym1=4-X_DarkWii_orange_KOR.mym
set md5mym1=4d3873a7e56cc1165d233570b43c19c0
set version=518
set dlname=0000009d_4.3K.app
set md5base=e6f2b0d4d5e0c095895f186009bf9516
set category=themes
set code1=00000001
set code2=00000002
goto:DBend


::----------------------------------


:SM4.3U-DWO
set name=System Menu 4.3U with Dark Wii Orange Theme - %effect%
set wadname=SystemMenu_4.3U_v513_DarkWiiOrange_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=d690233428172af9fedb5c6bbd2af273
if /i "%effect%" EQU "Spin" set md5=a7be9a1d12b143bf2e563a7f59ba3db3
if /i "%effect%" EQU "Fast-Spin" set md5=d686f953216e319505dc6966ec8c1352
set md5alt=%md5%
set basewad=SystemMenu_4.3U_v513
set basecios=%basewad%
set md5base=417358284cce02dbb0fed3ef30b0b59d
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=4-X_DarkWii_orange_NTSC.mym
set md5mym1=c3526b0a46f908dc8aaa88b5065bd126
set version=513
set lastbasemodule=00000001
set category=SMTHEME
goto:DBend

:SM4.2U-DWO
set name=System Menu 4.2U with Dark Wii Orange Theme - %effect%
set wadname=SystemMenu_4.2U_v481_DarkWiiOrange_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=6c6e119347e16fea3b68a801fd28d955
if /i "%effect%" EQU "Spin" set md5=2e0d3a0c35e05ba28ec1c16ab821aa1a
if /i "%effect%" EQU "Fast-Spin" set md5=cf9e68afbea553ad71ffeb5101fbe621
set md5alt=%md5%
set basewad=SystemMenu_4.2U_v481
set basecios=%basewad%
set md5base=b4eda5b30d090c9256b60441d83c9d65
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=4-X_DarkWii_orange_NTSC.mym
set md5mym1=c3526b0a46f908dc8aaa88b5065bd126
set version=481
set lastbasemodule=00000001
set category=SMTHEME
goto:DBend

:SM4.1U-DWO
set name=System Menu 4.1U with Dark Wii Orange Theme - %effect%
set wadname=SystemMenu_4.1U_v449_DarkWiiOrange_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=967bf063b1e90a53b84dc4077a26735d
if /i "%effect%" EQU "Spin" set md5=6dd4b6e95e971d823132b5462443e8b9
if /i "%effect%" EQU "Fast-Spin" set md5=a61c32272e37ac4556f91f125626752d
set md5alt=%md5%
set basewad=SystemMenu_4.1U_v449
set basecios=%basewad%
set md5base=555d2c0bc92ccd05c6f6a57412ebbd37
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=4-X_DarkWii_orange_NTSC.mym
set md5mym1=c3526b0a46f908dc8aaa88b5065bd126
set version=449
set lastbasemodule=00000001
set category=SMTHEME
goto:DBend

:SM4.3E-DWO
set name=System Menu 4.3E with Dark Wii Orange Theme - %effect%
set wadname=SystemMenu_4.3E_v514_DarkWiiOrange_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=0803c5af66025a261b4155e709768131
if /i "%effect%" EQU "Spin" set md5=c877690199e9856d45924766acecc931
if /i "%effect%" EQU "Fast-Spin" set md5=4a5c73366519de38d496c1bb79b55159
::md5alt's are from 7.0.3 (not fakesigned but modmii tagged)
if /i "%effect%" EQU "No-Spin" set md5alt=e6dc92bb61f56b5e029c05d8c2249e45
if /i "%effect%" EQU "Spin" set md5alt=cce715e212729b0e078c74cd14268d71
if /i "%effect%" EQU "Fast-Spin" set md5alt=ecba9c4e0e3b3df726b6198bce593e04
set basewad=SystemMenu_4.3E_v514
set basecios=%basewad%
set md5base=cad93ca3ca41704b15bbee95b2e6aae2
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=DarkWii_Orange_No-Spin_4.XE_V2.mym
set md5mym1=25862c24642701a0fd2548d1e7565d5d
set version=514
set lastbasemodule=00000001
set category=SMTHEME
goto:DBend

:SM4.2E-DWO
set name=System Menu 4.2E with Dark Wii Orange Theme - %effect%
set wadname=SystemMenu_4.2E_v482_DarkWiiOrange_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=e5aa09a2029f7702d3efb715ff9fcc76
if /i "%effect%" EQU "Spin" set md5=3d533aeb8c510e6f4418c57c4b80becf
if /i "%effect%" EQU "Fast-Spin" set md5=f53181064a9c5cfa67a966c5b5e1c97a
::md5alt's are from 7.0.3 (not fakesigned but modmii tagged)
if /i "%effect%" EQU "No-Spin" set md5alt=e5236e781556c6e47cb2dfb4b2f2cc2e
if /i "%effect%" EQU "Spin" set md5alt=f231210dc59398a356c5798979d7b8f5
if /i "%effect%" EQU "Fast-Spin" set md5alt=4414dba63f5f92b8500f224523d25683
set basewad=SystemMenu_4.2E_v482
set basecios=%basewad%
set md5base=efd76ac375914bf5969c74f8fb4fef75
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=DarkWii_Orange_No-Spin_4.XE_V2.mym
set md5mym1=25862c24642701a0fd2548d1e7565d5d
set version=482
set lastbasemodule=00000001
set category=SMTHEME
goto:DBend

:SM4.1E-DWO
set name=System Menu 4.1E with Dark Wii Orange Theme - %effect%
set wadname=SystemMenu_4.1E_v450_DarkWiiOrange_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=7f098206519d9f99f00461edee3e356c
if /i "%effect%" EQU "Spin" set md5=99c053f67ed915fbd2f4c1afc5feb429
if /i "%effect%" EQU "Fast-Spin" set md5=c19ed5059902bb7dbd5d6a2976192cd6
::md5alt's are from 7.0.3 (not fakesigned but modmii tagged)
if /i "%effect%" EQU "No-Spin" set md5alt=976e3e99cdd810fa9686b5b26bf5795b
if /i "%effect%" EQU "Spin" set md5alt=ee941d140b8f9c6c0709fb4b90dab34a
if /i "%effect%" EQU "Fast-Spin" set md5alt=2c0cfaaa0cd584aa32e83c555c2a6817
set basewad=SystemMenu_4.1E_v450
set basecios=%basewad%
set md5base=d19af34181c46645002efb130f6ea44c
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=DarkWii_Orange_No-Spin_4.XE_V2.mym
set md5mym1=25862c24642701a0fd2548d1e7565d5d
set version=450
set lastbasemodule=00000001
set category=SMTHEME
goto:DBend

:SM4.3J-DWO
set name=System Menu 4.3J with Dark Wii Orange Theme - %effect%
set wadname=SystemMenu_4.3J_v512_DarkWiiOrange_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=b3c555f949cd042bb76ecc02b6b8052f
if /i "%effect%" EQU "Spin" set md5=753f564b921731bc3c06f15250ff1a8f
if /i "%effect%" EQU "Fast-Spin" set md5=d33ef710b058d94eca2c7813d6d0fe70
set md5alt=%md5%
set basewad=SystemMenu_4.3J_v512
set basecios=%basewad%
set md5base=9552e63c8e0b6688e788639fb1c14e13
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=4-X_DarkWii_orange_JAP.mym
set md5mym1=887ba0484c3ac115050caea26e66bd32
set version=512
set lastbasemodule=00000001
set category=SMTHEME
goto:DBend

:SM4.2J-DWO
set name=System Menu 4.2J with Dark Wii Orange Theme - %effect%
set wadname=SystemMenu_4.2J_v480_DarkWiiOrange_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=a0beaf5f8d240b8c87cf9ec78cb03bd8
if /i "%effect%" EQU "Spin" set md5=8af2aad10d722cf3f5a0f262643d8958
if /i "%effect%" EQU "Fast-Spin" set md5=04006a411e8d406a5c61076c4839d2e8
set md5alt=%md5%
set basewad=SystemMenu_4.2J_v480
set basecios=%basewad%
set md5base=ffa08cfaf2a9bb4f6adffa812ab535ac
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=4-X_DarkWii_orange_JAP.mym
set md5mym1=887ba0484c3ac115050caea26e66bd32
set version=480
set lastbasemodule=00000001
set category=SMTHEME
goto:DBend

:SM4.1J-DWO
set name=System Menu 4.1J with Dark Wii Orange Theme - %effect%
set wadname=SystemMenu_4.1J_v448_DarkWiiOrange_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=c5765b9105eff4433ed009ebd7c421d3
if /i "%effect%" EQU "Spin" set md5=bf58288de2d6e60daaaae2a23a8051fa
if /i "%effect%" EQU "Fast-Spin" set md5=94468ca67bea79d42f81eac58f179a56
set md5alt=%md5%
set basewad=SystemMenu_4.1J_v448
set basecios=%basewad%
set md5base=5574337ec2c36cd9a9c15b8008ca4dd2
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=4-X_DarkWii_orange_JAP.mym
set md5mym1=887ba0484c3ac115050caea26e66bd32
set version=448
set lastbasemodule=00000001
set category=SMTHEME
goto:DBend


:SM4.3K-DWO
set name=System Menu 4.3K with Dark Wii Orange Theme - %effect%
set wadname=SystemMenu_4.3K_v518_DarkWiiOrange_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=92ade3b902ea3af80c5c68da590225e6
if /i "%effect%" EQU "Spin" set md5=96697da27829881c3a352fd05a20a2e5
if /i "%effect%" EQU "Fast-Spin" set md5=b3f443f3588bcf85dccbc87e169479b3
set md5alt=%md5%
set basewad=SystemMenu_4.3K_v518
set basecios=%basewad%
set md5base=775159a42dc1d12b9304fbbbe7415d80
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=4-X_DarkWii_orange_KOR.mym
set md5mym1=4d3873a7e56cc1165d233570b43c19c0
set version=518
set lastbasemodule=00000001
set category=SMTHEME
goto:DBend

:SM4.2K-DWO
set name=System Menu 4.2K with Dark Wii Orange Theme - %effect%
set wadname=SystemMenu_4.2K_v486_DarkWiiOrange_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=90eb46d54c54d700cd6127b3b2cfb97c
if /i "%effect%" EQU "Spin" set md5=18b4c37d022de7a977b7711a259e71a3
if /i "%effect%" EQU "Fast-Spin" set md5=c3b3467012c3a2117116b33eac61243f
set md5alt=%md5%
set basewad=SystemMenu_4.2K_v486
set basecios=%basewad%
set md5base=d225a6ff7130ea4cc63638b0d38a54e7
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=4-X_DarkWii_orange_KOR.mym
set md5mym1=4d3873a7e56cc1165d233570b43c19c0
set version=486
set lastbasemodule=00000001
set category=SMTHEME
goto:DBend

:SM4.1K-DWO
set name=System Menu 4.1K with Dark Wii Orange Theme - %effect%
set wadname=SystemMenu_4.1K_v454_DarkWiiOrange_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=360d92c6116709c7bdd9e35dac9064a2
if /i "%effect%" EQU "Spin" set md5=377e4ee11e9066e4e305356fa9b02be8
if /i "%effect%" EQU "Fast-Spin" set md5=cf71c8ce80048d04036028323d1b4071
set md5alt=%md5%
set basewad=SystemMenu_4.1K_v454
set basecios=%basewad%
set md5base=6326365089b5d71f36907f7315364a5f
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=4-X_DarkWii_orange_KOR.mym
set md5mym1=4d3873a7e56cc1165d233570b43c19c0
set version=454
set lastbasemodule=00000001
set category=SMTHEME
goto:DBend


::vWii themes

:DarkWii_Red_vWiiU
set name=DarkWii Red Theme (vWiiU) - %effect%
set wadname=DarkWii_Red_%effect%_vWiiU
if /i "%effect%" EQU "No-Spin" set md5=bf0555164013e98cd12fadc9e7e08e4f
if /i "%effect%" EQU "Spin" set md5=a92f645aed2db14e5189095a7b6ed5f6
if /i "%effect%" EQU "Fast-Spin" set md5=83c6dddcfd8b08ef744171ae17b4bc9a
set mym1=4-X_DarkWii_Red_NTSC.mym
set md5mym1=f5c50fe1ff29772a68e8e16996be57f6
::000000**.app
set version=609
set dlname=0000001f_4.3U_vWii.app
set md5base=18e44d5ccab69896ea12b6d98614bb64
set category=themes
set code1=00000007
set code2=00000002
goto:DBend

:DarkWii_Green_vWiiU
set name=DarkWii Green Theme (vWiiU) - %effect%
set wadname=DarkWii_Green_%effect%_vWiiU
if /i "%effect%" EQU "No-Spin" set md5=3cadec8539e392605ee644eb1ce52fc0
if /i "%effect%" EQU "Spin" set md5=e5e74e28dec21cf3263af8a75e5223ec
if /i "%effect%" EQU "Fast-Spin" set md5=e8239906de5a7f060d80946882a05839
set mym1=4-X_DarkWii_green_NTSC.mym
set md5mym1=57b80bcb73780514588396de33f4ced0
::000000**.app
set version=609
set dlname=0000001f_4.3U_vWii.app
set md5base=18e44d5ccab69896ea12b6d98614bb64
set category=themes
set code1=00000007
set code2=00000002
goto:DBend

:DarkWii_Blue_vWiiU
set name=DarkWii Blue Theme (vWiiU) - %effect%
set wadname=DarkWii_Blue_%effect%_vWiiU
if /i "%effect%" EQU "No-Spin" set md5=cb77e3d9d7c63c219a292a5d58d184f8
if /i "%effect%" EQU "Spin" set md5=5897233f400dd492c41a1497e588a027
if /i "%effect%" EQU "Fast-Spin" set md5=a92d1d31a30fd0c4cdff4dbe0353432b
set mym1=4-X_DarkWii_darkblue_NTSC.mym
set md5mym1=ea9d5eacd4a49a0c4323d48f432c85b5
::000000**.app
set version=609
set dlname=0000001f_4.3U_vWii.app
set md5base=18e44d5ccab69896ea12b6d98614bb64
set category=themes
set code1=00000007
set code2=00000002
goto:DBend

:darkwii_orange_vWiiU
set name=DarkWii Orange Theme (vWiiU) - %effect%
set wadname=DarkWii_Orange_%effect%_vWiiU
if /i "%effect%" EQU "No-Spin" set md5=62f57e54d2b5bf188ba98005204064fe
if /i "%effect%" EQU "Spin" set md5=21640e7b269fd8ddacd322ee3ab25e7e
if /i "%effect%" EQU "Fast-Spin" set md5=2790f037a2c8e9659ec3b07323c7ece8
set mym1=4-X_DarkWii_orange_NTSC.mym
set md5mym1=c3526b0a46f908dc8aaa88b5065bd126
::000000**.app
set version=609
set dlname=0000001f_4.3U_vWii.app
set md5base=18e44d5ccab69896ea12b6d98614bb64
set category=themes
set code1=00000007
set code2=00000002
goto:DBend

:DarkWii_Red_vWiiJ
set name=DarkWii Red Theme (vWiiJ) - %effect%
set wadname=DarkWii_Red_%effect%_vWiiJ
if /i "%effect%" EQU "No-Spin" set md5=dfb23dfc196db25b6536a7f745bd0ca0
if /i "%effect%" EQU "Spin" set md5=bc9a0fddadff2f5f780e535be9b9d46e
if /i "%effect%" EQU "Fast-Spin" set md5=cfa1d6d17476709ea1716c092be2908a
set mym1=4-X_DarkWii_Red_JAP.mym
set md5mym1=002f0bbd351bd1cad5fb514701654820
::000000**.app
set version=608
set dlname=0000001c_4.3J_vWii.app
set md5base=d6d6c4e315d499ac48f34e2eb523746d
set category=themes
set code1=00000007
set code2=00000002
goto:DBend


:DarkWii_Green_vWiiJ
set name=DarkWii Green Theme (vWiiJ) - %effect%
set wadname=DarkWii_Green_%effect%_vWiiJ
if /i "%effect%" EQU "No-Spin" set md5=2f3370e1333a39bc677d1780b3f89359
if /i "%effect%" EQU "Spin" set md5=a1a4a71ccae3b6053c88f3c10d1145db
if /i "%effect%" EQU "Fast-Spin" set md5=19bba00be1319654c1e271216ffe9a70
set mym1=4-X_DarkWii_green_JAP.mym
set md5mym1=5cfe52f11b20287a6af3e6c4894a76e6
::000000**.app
set version=608
set dlname=0000001c_4.3J_vWii.app
set md5base=d6d6c4e315d499ac48f34e2eb523746d
set category=themes
set code1=00000007
set code2=00000002
goto:DBend

:DarkWii_Blue_vWiiJ
set name=DarkWii Blue Theme (vWiiJ) - %effect%
set wadname=DarkWii_Blue_%effect%_vWiiJ
if /i "%effect%" EQU "No-Spin" set md5=03dc25ce2e5250f55ebfb542bf1cdb9b
if /i "%effect%" EQU "Spin" set md5=5165fd515a7a26533edd749a117c96c7
if /i "%effect%" EQU "Fast-Spin" set md5=f9d729a4186a21b8bb0400b9cbea3057
set mym1=4-X_DarkWii_darkblue_JAP.mym
set md5mym1=5a3a3643d013cd501b35b041f34333a1
::000000**.app
set version=608
set dlname=0000001c_4.3J_vWii.app
set md5base=d6d6c4e315d499ac48f34e2eb523746d
set category=themes
set code1=00000007
set code2=00000002
goto:DBend

:darkwii_orange_vWiiJ
set name=DarkWii Orange Theme (vWiiJ) - %effect%
set wadname=DarkWii_Orange_%effect%_vWiiJ
if /i "%effect%" EQU "No-Spin" set md5=43b2ddc25d648da9b29177e99793bf54
if /i "%effect%" EQU "Spin" set md5=d1ea0757ec36af04a2a7dd34c3c02e6d
if /i "%effect%" EQU "Fast-Spin" set md5=10d9d2a9689ed429463d671ecd502c86
set mym1=4-X_DarkWii_orange_JAP.mym
set md5mym1=887ba0484c3ac115050caea26e66bd32
::000000**.app
set version=608
set dlname=0000001c_4.3J_vWii.app
set md5base=d6d6c4e315d499ac48f34e2eb523746d
set category=themes
set code1=00000007
set code2=00000002
goto:DBend

:DarkWii_Red_vWiiE
set name=DarkWii Red Theme (vWiiE) - %effect%
set wadname=DarkWii_Red_%effect%_vWiiE
if /i "%effect%" EQU "No-Spin" set md5=bd83f55c740b83ae98a8d7480182a642
if /i "%effect%" EQU "Spin" set md5=4c27f6b0e2ebea7b958befa77cb43def
if /i "%effect%" EQU "Fast-Spin" set md5=57df93adfa3f6b367bcd349aab93b7c4
set mym1=DarkWii_Red_No-Spin_4.XE_V2.mym
set md5mym1=543130dbc6ece1d4a666586ed084d714
::000000**.app
set version=610
set dlname=00000022_4.3E_vWii.app
set md5base=f5292af0218bdee99e8e61548178a87d
set category=themes
set code1=00000007
set code2=00000002
goto:DBend

:DarkWii_Green_vWiiE
set name=DarkWii Green Theme (vWiiE) - %effect%
set wadname=DarkWii_Green_%effect%_vWiiE
if /i "%effect%" EQU "No-Spin" set md5=bbd4b88698e000171cd85f879c482ef4
if /i "%effect%" EQU "Spin" set md5=f0a3a1184ae855a8d21bbed7d6bd5e57
if /i "%effect%" EQU "Fast-Spin" set md5=594c998d6c6810a95f77fc5047f6b059
set mym1=DarkWii_Green_No-Spin_4.XE_V2.mym
set md5mym1=34c991872b67273307c7bc7aa522b09d
::000000**.app
set version=610
set dlname=00000022_4.3E_vWii.app
set md5base=f5292af0218bdee99e8e61548178a87d
set category=themes
set code1=00000007
set code2=00000002
goto:DBend

:DarkWii_Blue_vWiiE
set name=DarkWii Blue Theme (vWiiE) - %effect%
set wadname=DarkWii_Blue_%effect%_vWiiE
if /i "%effect%" EQU "No-Spin" set md5=2c19231bade7dd112fcf966ec92bb4d7
if /i "%effect%" EQU "Spin" set md5=8ae4ea159f86e7795ccf3cd2ac47dc37
if /i "%effect%" EQU "Fast-Spin" set md5=94578815f6fcc614962fd6d0283914bb
set mym1=DarkWii_Blue_No-Spin_4.XE_V2.mym
set md5mym1=26f80d142dec2451e65f8ef03d108413
::000000**.app
set version=610
set dlname=00000022_4.3E_vWii.app
set md5base=f5292af0218bdee99e8e61548178a87d
set category=themes
set code1=00000007
set code2=00000002
goto:DBend

:darkwii_orange_vWiiE
set name=DarkWii Orange Theme (vWiiE) - %effect%
set wadname=DarkWii_Orange_%effect%_vWiiE
if /i "%effect%" EQU "No-Spin" set md5=28c4063dc9779de6788ec0d05cdd1772
if /i "%effect%" EQU "Spin" set md5=f2ec1f9f174332f3f6ec4cf0b9eb164c
if /i "%effect%" EQU "Fast-Spin" set md5=feca7428e15335ff33c14b97857aad64
set mym1=DarkWii_Orange_No-Spin_4.XE_V2.mym
set md5mym1=25862c24642701a0fd2548d1e7565d5d
::000000**.app
set version=610
set dlname=00000022_4.3E_vWii.app
set md5base=f5292af0218bdee99e8e61548178a87d
set category=themes
set code1=00000007
set code2=00000002
goto:DBend


:DBend
