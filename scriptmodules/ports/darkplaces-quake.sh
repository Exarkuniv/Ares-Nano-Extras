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

rp_module_id="darkplaces-quake"
rp_module_desc="Quake 1 engine - Darkplaces Quake port with GLES rendering"
rp_module_licence="GPL2 https://raw.githubusercontent.com/xonotic/darkplaces/master/COPYING"
rp_module_section="prt"
rp_module_flags=""

function depends_darkplaces-quake() {
    local depends=(libsdl2-dev libjpeg-dev)
    isPlatform "videocore" && depends+=(libraspberrypi-dev)
    isPlatform "mesa" && depends+=(libgles2-mesa-dev)
    getDepends "${depends[@]}"
	
	if isPlatform "odroid-n2"; then
	/home/aresuser/ARES-Setup/fixmali.sh
    elif isPlatform "rockpro64"; then
    /usr/lib/arm-linux-gnueabihf/install_mali.sh
	fi
}

function sources_darkplaces-quake() {
    gitPullOrClone "$md_build" https://github.com/xonotic/darkplaces.git div0-stable
    if isPlatform "rpi"; then
        applyPatch "$md_data/01_rpi_fixes.diff"
    fi
}

function build_darkplaces-quake() {
    make clean
    if isPlatform "videocore"; then
        make sdl-release DP_MAKE_TARGET=rpi
    else
        make sdl-release
    fi
}

function install_darkplaces-quake() {
    md_ret_files=(
        'darkplaces.txt'
        'darkplaces-sdl'
        'COPYING'
    )
}

function add_games_darkplaces-quake() {
    local params=()
    isPlatform "kms" && params+=("+vid_vsync 1")
    _add_games_lr-tyrquake "$md_inst/darkplaces-sdl -basedir $romdir/ports/quake -game %QUAKEDIR% ${params[*]}"
}

function configure_darkplaces-quake() {
    mkRomDir "ports/quake"

    [[ "$md_mode" == "install" ]] && game_data_lr-tyrquake

    add_games_darkplaces-quake

    moveConfigDir "$home/.darkplaces" "$md_conf_root/quake/darkplaces"
}
