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

rp_module_id="supertux"
rp_module_desc="SuperTux 2d scrolling platform"
rp_module_licence="GPL3 https://raw.githubusercontent.com/SuperTux/supertux/master/LICENSE.txt"
rp_module_section="prt"
rp_module_flags=""

function _update_hook_supertux() {
    # to show as installed in retropie-setup 4.x
    hasPackage supertux && mkdir -p "$md_inst"
}

function install_bin_supertux() {
    aptInstall supertux
	
	if isPlatform "odroid-n2"; then
	/home/aresuser/ARES-Setup/fixmali.sh
    elif isPlatform "rockpro64"; then
    /usr/lib/arm-linux-gnueabihf/install_mali.sh
	fi
}

function remove_supertux() {
    aptRemove supertux
	
	if isPlatform "odroid-n2"; then
	/home/aresuser/ARES-Setup/fixmali.sh
    elif isPlatform "rockpro64"; then
    /usr/lib/arm-linux-gnueabihf/install_mali.sh
	fi
}

function configure_supertux() {
    addPort "$md_id" "supertux" "SuperTux" "supertux2"
}
