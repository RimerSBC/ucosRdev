ucosR development demo code based on [ucosR](https://github.com/RimerSBC/ucosR)

A minimal setup for user application development. 

Utilities and configuration files: 	

| Files                   |  Build      |             Description              |
|-------------------------|:-----------:|--------------------------------------|
| flash                   | Debug       | Executable programming script JLINK  |
| flash_release           | Release     | Executable programming script JLINK  |
| jgdb                    | Debug       | Executable JLINK server script       |
| ucosR_1M_256k.ld        | Debug/Release | Linker script, starting 0x00000000 |
| ucosR_1M_256k_uf2.ld    | Release_uf2 | Linker script, starting 0x00004000   |
| ucosRdev.jlink          | Debug       | JLINK configuration script           |
| ucosRdev_release.jlink  | Release     | JLINK configuration script           |
| ucosRdev.project        | All         | CodeLite project file                |
| ucosRdev.workspace      | All         | CodeLite workspace file              |
| ucosRdev.uf2            | Release_uf2 | UF2 image compiled with Release flags|

