ModMii will automatically support additional NandLoader's saved to this folder so long as they have been set up properly^^

To add a NandLoader that ModMii should ONLY offer to build as Integrated with the main.dol, save it's nandloader binary section to AnyFile.bin; nothing else is needed.

To add a NandLoader that ModMii should offer to build as Integrated and External\separate from the main.dol, save it's nandloader app file to AnyFile.app; nothing else is needed (ModMii will automatically strip out it's nandloader binary section to AnyFile.bin).

Any *.nul files saved to this folder are created automatically and are only used for nandloader detection purposes; they're the same as *.bin files except their entrypoints have been nulled out.

^^Supported NandLoaders should have a bin section that uses a 2 byte load&shift + or instruction for the entrypoint; i.e. 4 byte entrypoint is separated by 2 bytes in the middle. Currently the only known NandLoader not following this protocol is OpenDolBoot, which uses 4 byte load instruction without any separators. However, ModMii already supports OpenDolBoot without needing any extra files in this folder. If other NandLoaders are developed that use 4 byte load instruction modifications will be required to ModMii; or just update OpenDolBoot.exe and save it to ModMii's temp folder and the new Nandloader will be constructed instead of the official OpenDolBoot.

Some Nandloader Sources:
https://wiibrew.org/wiki/OpenDolBoot
https://github.com/FIX94/tiny-vwii-nand-loader
https://github.com/FIX94/hbc
https://github.com/waninkoko/nand-loader
https://github.com/LemonBoy/taiko
marcan: https://mega.nz/file/1hxBkQDC#xQR0ztW3zKGvV7Yh2OceJb73IwLo4uWWRwRMQ5_xqRU
