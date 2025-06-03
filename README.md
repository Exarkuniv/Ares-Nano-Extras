# RetroPie-Extras-Nano
RetroPie Extras install scripts for Jetson Nano

they are working on getting Port Master to work on the Nano
once that happened, i will delete this retpo as it will be worthless

The following commands clone the repo to your Jetson Nano and then run install-scripts.sh to install the scripts in the master branch directly to the proper directories in the ARES-Setup/ folder.

```
cd ~
git clone https://github.com/Exarkuniv/Ares-Nano-Extras.git
sudo chmod 755 ~/Ares-Nano-Extras/install-extras.sh
cd ~/Ares-Nano-Extras && ./install-extras.sh
```


**UPDATE**
AS id 11-27-23 I think for the most part this is good to go. of course odd things come up, but i belive i got most of it cleaned up


if you want background music i have figured that out also
all you need to do is add a ``music`` folder here 

``/opt/ares/configs/all/emulationstation``

ALSO
as of right now, you do need to install the runcommand to get the ports to work. 
possiable that will be fixed but i dont know how

**Other fixes and tweeks**

Fix to get sound on Quake 2. for whatever reason the control panel will swith to the analog output for the sound, 
you will have to switch it to HDMI if thats what you have.

i install the ``PulseAudio Volume Control`` app and just disable analog output, since using command line was abit confusing. 

to get the **rigelengine, tfe, dxx-rebirth, nblood, rednukem, and pcexhumed and others**  script to install, you need to change the GCC and G++ from version 7 to version 10 and 11

so use ``sudo update-alternatives --config gcc`` and ``sudo update-alternatives --config g++`` and change it to whatever number the higher version is on your system

 ``sudo ~/ARES-Setup/ares_setup.sh``

 ``wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | sudo tee /usr/share/keyrings/kitware-archive-keyring.gpg >/dev/null``

here is what is needed to be added to the ``es_system.cfg`` for things to work or be seen

```
<system>
    <name>supermodel</name>
    <fullname>Sega supermodel 3</fullname>
    <path>/home/aresuser/ARES/roms/model3</path>
    <extension>.zip  .ZIP </extension>
    <command>/opt/ares/supplementary/runcommand/runcommand.sh 0 _SYS_ model3 %ROM%</command>
    <platform>supermodel</platform>
    <theme>model3</theme>
  </system>
  
    
	<system>
    <name>ports</name>
    <fullname>Ports</fullname>
    <path>/home/aresuser/ARES/roms/ports</path>
    <extension>.sh .SH</extension>
    <command>bash %ROM%</command>
    <platform>pc</platform>
    <theme>ports</theme>
  </system>
  
  
  
    <system>
    <name>solarus</name>
    <fullname>Solarus Engine</fullname>
    <path>/home/aresuser/ARES/roms/solarus</path>
    <extension>.solarus .zip .SOLARUS .ZIP</extension>
    <command>/opt/ares/supplementary/runcommand/runcommand.sh 0 _SYS_ solarus %ROM%</command>
    <platform>solarus</platform>
    <theme>solarus</theme>
	<system>
	


<system>
    <name>doom</name>
    <fullname>DOOM</fullname>
    <path>/home/aresuser/ARES/roms/doom</path>
    <extension>.sh .SH</extension>
    <command>bash %ROM%</command>
    <platform>doom</platform>
    <theme>doom</theme>
  </system>
  ```

# Emulationstation-OGA-Theme-Gallery
Emulationstation theme gallery that links to themes that are compatible on small screen devices such as OGA, OGS, Gameforce Chi, RGB10, RGB10MAX, RK2020, RG351p/m, RG351v, and RG503.

Make sure to check out the [wiki](https://github.com/Jetup13/Emulationstation-OGA-Theme-Gallery/wiki/FAQ)

Theme's can be downloaded from github or on device through [JohnIrive1433's](https://github.com/JohnIrvine1433) [Thememaster](https://github.com/JohnIrvine1433/ThemeMaster)

Themes shown are from [AeoluxUX](https://github.com/AeolusUX), [Akira-N28](https://github.com/Akira-N28), [CodyV59](https://github.com/CodyV59), [dani7959](https://github.com/dani7959), [farfenkugell](https://github.com/farfenkugell), [Jetup13](https://github.com/Jetup13), [mluizvitor](https://github.com/mluizvitor), [Narcurutu](https://github.com/Nacurutu), [nkahoang](https://github.com/nkahoang), [RetroBenny](https://github.com/TheBenny), and [Vidnez](https://github.com/Vidnez/)

| Theme Name     | Preview       |480x320|640x480|854x480|960x544|720x720|
| ---------------|:-------------:|:------:|:------:|:------:|:------:|:-----:
| [Albedo](https://github.com/mluizvitor/es-theme-albedo)                        | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/albedo.png)|Yes|Yes|Untested|Untested|Untested|
| [Alekfull-SOLO-ArkOS](https://github.com/AeolusUX/Alekfull-SOLO-ArkOS)         | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/alekfull-solo-arkos.png)|Untested|Yes|Untested|Untested|Untested|
| [ArkOS-Carbon](https://github.com/Jetup13/es-theme-arkos-carbon)               | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/arkos-carbon.png)|Yes|Untested|Untested|Untested|Untested|
| [ARC-S-Theme Remix](https://github.com/Nacurutu/es-theme-ARC-S-Theme-Remix---The-RA-CFW)                   | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/arc-s-theme-remix.png)|Untested|Yes|Untested|Untested|Untested|
| [Art-Book](https://github.com/Jetup13/es-theme-art-book-3-2)                   | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/art-book.png)|Yes|Untested|Untested|Untested|Untested|
| [Art-Book-Next-ArkOS](https://github.com/nkahoang/es-theme-art-book-next-arkos)  | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/art-book-next-arkos.png)|Untested|Untested|Untested|Untested|Untested|
| [Base Text](https://github.com/Jetup13/es-theme-base-text)                     | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/base-text.png)|Yes|Yes|Yes|Yes|Yes|
| [BannerOGSMAX](https://github.com/Jetup13/es-theme-banner-ogsmax)              | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/bannerogsmax.png)|No |No |Yes|No|No|
| [ChicueloAP](https://github.com/Jetup13/es-theme-ChicueloAP)                   | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/chicueloap.png)|Yes|Untested|Untested|Untested|Untested|
| [CodyFlux](https://github.com/CodyV59/es-theme-CODY-FLUX)                      | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/codyflux.png)|No |Yes|Untested|Untested|Untested|
| [CodyFuckPlastic](https://github.com/CodyV59/es-theme-CODY-FUCKYPLASTICS)      | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/codyfuckplastic.png)|No |Yes|Untested|Untested|Untested|
| [CodyDarkteck](https://github.com/CodyV59/es-theme-CODY-DARKTECK)              | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/codydarkteck.png)|No |Yes|Untested|Untested|Untested|
| [CodyDestroy](https://github.com/CodyV59/es-theme-CODY-DESTROY-THE-RG351V)     | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/codydestroy.png)|No |Yes|Untested|Untested|Untested|
| [Custom-Box](https://github.com/Jetup13/es-theme-custom-box)                   | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/custom-box.png)|Yes|No|No|No|No|
| [Cyber2077](https://github.com/AeolusUX/es-theme-Cyber2077)                    | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/cyber2077.png)|Yes|Yes|Yes|Yes|Untested|
| [Elementerial](https://github.com/mluizvitor/es-theme-elementerial)            | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/elementerial.png)|Yes|Yes|Untested|Untested|Untested|
| [EpicAeolus](https://github.com/AeolusUX/es-theme-EpicAeolus)                  | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/epicaeolus.png)|Yes|Yes|Yes|Yes|Untested|
| [EpicNoir](https://github.com/Jetup13/es-theme-epicnoir)                       | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/epicnoir.png)|Yes|Yes|Untested|Untested|Untested|
| [EpicCody](https://github.com/CodyV59/es-theme-epic-cody-RG351P-M)             | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/epiccody.png)|Yes|Untested|Untested|Untested|Untested|
| [EpicCodyRG351V](https://github.com/CodyV59/es-theme-epic-cody-RG351V)         | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/epiccodyrg351v.png)|Untested|Yes|Untested|Untested|Untested|
| [EpicMax](https://github.com/CodyV59/es-theme-EPICMAX-CODY-RGB10MAX)           | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/epicmax.png)|Untested|Untested|Yes|Untested|Untested|
| [Farfenkugell_Columns](https://github.com/farfenkugell/es-theme-farfenkugell-columns)   | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/farfenkugell_columns.png)|No|No|Yes|Untested|Untested|
| [Farfenkugell_Crystal](https://github.com/farfenkugell/es-theme-farfenkugell_crystal)   | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/farfenkugell_crystal.png)|Yes|Yes|Yes|Untested|Untested|
| [Farfenkugell_EPICMAX](https://github.com/farfenkugell/es-theme-farfenkugell_EPICMAX)   | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/farfenkugell_epicmax.png)|Yes|No|No|Untested|Untested|
| [Farfenkugell Lazy](https://github.com/farfenkugell/es-theme-farfenkugell_lazy) | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/farfenkugell_lazy.png)|Yes|Yes|Yes|Untested|Untested|
| [Freeplay](https://github.com/Jetup13/es-theme-freeplay)                       | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/freeplay.png)|Yes|Yes|Untested|Untested|Untested|
| [GBZ35_Mod](https://github.com/Jetup13/es-theme-gbz35_mod)                     | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/gbz35_mod.png)|Yes|Yes|Untested|Untested|Untested|
| [Magical-Pixel](https://github.com/Jetup13/es-theme-magical-pixel)             | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/magical-pixel.png)|Yes|Yes|Untested|Untested|Untested|
| [Minimal-ArkOS](https://github.com/Jetup13/es-theme-minimal-arkos)             | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/minimal-arkos.png)|Yes|Yes|Yes|Yes|Untested|
| [MinUArk](https://github.com/Vidnez/es-theme-MinUArk)             | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/minuark.png)|Untested|Untested|Untested|Untested|Yes|
| [NES-Box](https://github.com/Jetup13/es-theme-nes-box)                         | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/nes-box.png)|Yes|Yes|Yes|Untested|No|
| [Pixel](https://github.com/Jetup13/es-theme-pixel)                             | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/pixel.png)|Yes|Yes|Yes|Untested|Untested|
| [Replica](https://github.com/dani7959/es-theme-replica/)                             | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/replica.png)|Untested|Yes|Yes|Yes|Untested|
| [RetroBenny-NesBox-BlackBG](https://github.com/TheBenny/es-theme-RG351V-RetroBenny-NesBox-BlackBG)      | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/retrobenny-nesbox-blackbg.png)|No|Yes|No|Untested|Untested|
| [RetroBenny-NesBox-Wood](https://github.com/TheBenny/es-theme-RG351V-RetroBenny-NesBox-Wood)            | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/retrobenny-nesbox-wood.png)|No|Yes|No|Untested|Untested|
| [RetroBenny-NesMini](https://github.com/TheBenny/es-theme-RG3551V-RetroBenny-NesMini)             | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/retrobenny-nesmini.png)|No |Yes|No|Untested|Untested|
| [RetroBenny-PS2](https://github.com/TheBenny/es-theme-RG351V-RetroBenny-PS2)            | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/retrobenny-ps2.png)|Yes|Yes|No|Untested|Untested|
| [RetroBenny-PS5](https://github.com/TheBenny/es-theme-RG351V-RetroBenny-PS5)            | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/retrobenny-ps5.png)|No|Yes|No|Untested|Untested|
| [RetroNeon](https://github.com/Akira-N28/es-theme-RetroNeon)                   | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/retroneon.png)|Yes|Yes|Yes|Yes|Untested|
| [SagaArtBook](https://github.com/Jetup13/es-theme-sagaartbook)                 | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/sagaartbook.png)|Yes|Yes|Yes|Yes|Yes|
| [SagaBox](https://github.com/Jetup13/es-theme-sagabox)                         | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/sagabox.png)|Yes|Yes|Yes|Yes|Yes|
| [SagaCrystal](https://github.com/Jetup13/es-theme-sagacrystal)                 | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/sagacrystal.png)|Yes|Yes|Yes|Yes|No|
| [SagaModern](https://github.com/Jetup13/es-theme-sagamodern)                   | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/sagamodern.png)|Yes|Yes|Yes|Yes|Yes|
| [SagaNX](https://github.com/Jetup13/es-theme-saganx)                           | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/saganx.png)|Yes|Yes|Yes|Yes|Yes|
| [SagaParagon](https://github.com/Jetup13/es-theme-sagaparagon)                 | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/sagaparagon.png)|Yes|Yes|Yes|Yes|No|
| [SagaSlice](https://github.com/Jetup13/es-theme-sagaslice)                     | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/sagaslice.png)|Yes|Yes|Yes|Yes|No|
| [SagaWorld](https://github.com/Jetup13/es-theme-sagaworld)                     | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/sagaworld.png)|Yes|Yes|Yes|Yes|No|
| [Solo-Horizontal](https://github.com/Jetup13/es-theme-solo-horizontal-arkos-ed)| ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/solo-horizontal.png)|Yes|Untested|Untested|Yes|No|
| [Switch](https://github.com/Jetup13/es-theme-switch)                           | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/switch.png)|Yes|Yes|Yes|Yes|Yes
| [WoodyCody](https://github.com/CodyV59/es-theme-WOODY-CODY-RG351V)             | ![](https://raw.githubusercontent.com/Jetup13/Emulationstation-OGA-Theme-Gallery/main/images/woodycody.png)|No |Yes|Untested|Yes|Untested|
