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

rp_module_id="hcl"
rp_module_desc="hcl - Hydra Castle Labyrinth - Metroidvania game"
rp_module_licence="GPL2 https://github.com/ptitSeb/hydracastlelabyrinth/blob/master/LICENSE"
rp_module_help="Make sure to set the language to English from the options menu before playing. If you are experiencing slowdowns in game, make sure the xBRZ shader is turned off in the options menu."
rp_module_section="prt"
rp_module_flags="!x86"

function depends_hcl() {
    getDepends libsdl1.2-dev libsdl-mixer1.2-dev cmake
	
	if isPlatform "odroid-n2"; then
	/home/aresuser/ARES-Setup/fixmali.sh
    elif isPlatform "rockpro64"; then
    /usr/lib/arm-linux-gnueabihf/install_mali.sh
	fi
}

function sources_hcl() {
     gitPullOrClone "$md_build" https://github.com/ptitSeb/hydracastlelabyrinth.git
}

function build_hcl() {
    cmake . -DCMAKE_INSTALL_PREFIX:PATH="$md_inst"
    make
    md_ret_require="$md_build/hcl"
}

function install_hcl() {
    cd "$md_build"
    md_ret_files=(
        'hcl'
        'data'
    )
}

function configure_hcl() {
    mkRomDir "ports"
    mkRomDir "ports/hcl"
    moveConfigDir "$home/.hydracastlelabyrinth" "$md_conf_root/hcl"
	local binary="XINIT:$md_inst/hcl"
	if isPlatform "rpi" || isPlatform "odroid-xu" || isPlatform "jetson-nano"; then
    addPort "$md_id" "hcl" "Hydra Castle Labrinth - Metroidvania Game" "pushd $md_inst; $md_inst/hcl -d; popd"
   	else
	addPort "$md_id" "hcl" "Hydra Castle Labrinth - Metroidvania Game" "pushd $md_inst; $md_inst/hcl -d; popd"
	fi
	}
