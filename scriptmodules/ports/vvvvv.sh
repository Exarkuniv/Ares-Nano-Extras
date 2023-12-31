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

rp_module_id="vvvvvv"
rp_module_desc="VVVVVV - 2D puzzle game by Terry Cavanagh"
rp_module_licence="NONCOM https://raw.githubusercontent.com/TerryCavanagh/VVVVVV/master/LICENSE.md"
rp_module_help="Copy data.zip from a purchased or Make and Play edition of VVVVVV to $romdir/ports/vvvvvv"
rp_module_section="prt"

function depends_vvvvvv() {
    getDepends cmake libsdl2-dev libsdl2-mixer-dev
	
	if isPlatform "odroid-n2"; then
	/home/aresuser/ARES-Setup/fixmali.sh
    elif isPlatform "rockpro64"; then
    /usr/lib/arm-linux-gnueabihf/install_mali.sh
	fi
}

function sources_vvvvvv() {
    gitPullOrClone "$md_build" https://github.com/TerryCavanagh/VVVVVV
    # default to fullscreen
    sed -i "s/fullscreen = false/fullscreen = true/" "$md_build/desktop_version/src/Game.cpp"
}

function build_vvvvvv() {
    cmake desktop_version
    rpSwap on 1500
    make clean
    make -j1
    rpSwap off
    md_ret_require="$md_build/VVVVVV"
}

function install_vvvvvv() {
    md_ret_files=(
        'LICENSE.md'
        'VVVVVV'
    )
}

function configure_vvvvvv() {
    addPort "$md_id" "vvvvvv" "VVVVVV" "$md_inst/VVVVVV"

    [[ "$md_mode" != "install" ]] && return

    moveConfigDir "$home/.local/share/VVVVVV" "$md_conf_root/vvvvvv"

    mkUserDir "$romdir/ports/$md_id"
    # symlink game data
    ln -snf "$romdir/ports/$md_id/data.zip" "$md_inst/data.zip"
}
