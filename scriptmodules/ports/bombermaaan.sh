#!/usr/bin/env bash

# This file is part of ARES by The RetroArena
#
# ARES is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/Retro-Arena/RetroArena-Setup/master/LICENSE.md
#
# Core script functionality is based upon The RetroPie Project https://retropie.org.uk Script Modules
#

rp_module_id="bombermaaan"
rp_module_desc="Bombermaaan - Classic bomberman game"
rp_module_licence="GPL3 https://raw.githubusercontent.com/bjaraujo/Bombermaaan/master/LICENSE.txt"
rp_module_section="prt"
rp_module_flags="!odroid-n2"

function depends_bombermaaan() {
    getDepends cmake libsdl1.2-dev libsdl-mixer1.2-dev build-essential
	
	if isPlatform "odroid-n2"; then
	/home/aresuser/ARES-Setup/fixmali.sh
    elif isPlatform "rockpro64"; then
    /usr/lib/arm-linux-gnueabihf/install_mali.sh
	fi
}

function sources_bombermaaan() {
    gitPullOrClone "$md_build" https://github.com/bjaraujo/Bombermaaan.git v1.9.7.2126
}

function build_bombermaaan() {
    cd trunk
    cmake . -DCMAKE_INSTALL_PREFIX="$md_inst" -DLOAD_RESOURCES_FROM_FILES:BOOL=ON
    make
    mv bin/Bombermaaan bombermaaan
    md_ret_require="$md_build/trunk/bombermaaan"
}

function install_bombermaaan() {
    md_ret_files=(        
        'trunk/bombermaaan'
        'trunk/levels'
        'trunk/res/images'
        'trunk/res/sounds'
    )
}

function configure_bombermaaan() {
     if  isPlatform "odroid-xu"; then
	 addPort "$md_id" "bombermaaan" "Bombermaaan" "$md_inst/bombermaaan"
	 else
	 addPort "$md_id" "bombermaaan" "Bombermaaan" "$md_inst/bombermaaan"
     fi
    setDispmanx "$md_id" 1

    local file="$romdir/ports/Bombermaaan.sh"
    cat >"$file" << _EOF_
#!/bin/bash
pushd "$md_inst"
"$rootdir/supplementary/runcommand/runcommand.sh" 0 _PORT_ bombermaaan ""
popd
_EOF_
    chown $user:$user "$file"
    chmod +x "$file"
}

