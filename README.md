# RetroPie-Extras-Nano
RetroPie Extras install scripts for Jetson Nano

This is all WIP right now. 

I still have a handfull of edits i need to get done, but as of 9-20-23 all the scripts do install. and almost all do play
there are a few i have not tested yet as i dont have the game files (yet)

if you want background music i have figured that out also
all you need to do is add a ``music`` folder here 

``/opt/ares/configs/all/emulationstation``

ALSO
as of right now, you do need to install the runcommand to get the ports to work. 
possiable that will be fixed but i dont know how

Fix to get sound on Quake 2. for whatever reason the control panel will swith to the analog output for the sound, 
you will have to switch it to HDMI if thats what you have.

i install the ``PulseAudio Volume Control`` app and just disable analog output, since using command line was abit confusing. 
