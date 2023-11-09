#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="gzdoom-system"
rp_module_desc="GZDoom System - Yes the real GZDoom on Pi, running in GLES"
rp_module_licence="GPL3 https://raw.githubusercontent.com/drfrag666/gzdoom/master/LICENSE"
rp_module_repo="git https://github.com/Exarkuniv/gzdoom-Pi.git master"
rp_module_section="prt"
rp_module_flags=""

function depends_gzdoom-system() {
     getDepends g++ make cmake libsdl2-dev git zlib1g-dev libbz2-dev libjpeg-dev libfluidsynth-dev libgme-dev libopenal-dev libmpg123-dev libsndfile1-dev libgtk-3-dev timidity nasm libgl1-mesa-dev tar libsdl1.2-dev libglew-dev libvpx-dev libvulkan-dev

}

function sources_gzdoom-system() {
    gitPullOrClone "$md_build" https://github.com/ZDoom/gzdoom.git master
}

function build_gzdoom-system() {
       if [ ! -f "/usr/lib/arm-linux-gnueabihf/libzmusic.so" ]; then
	gitPullOrClone "$md_build/zmusic" https://github.com/coelckers/ZMusic.git
    cd $md_build/zmusic
    mkdir build
    cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr 
    make
    make install
    rm -r $md_build/zmusic

    fi

    mkdir $md_build/build
    cd $md_build/build
    Tag="$(git tag -l | grep -v 9999 | grep -E '^g[0-9]+([.][0-9]+)*$' |
    sed 's/^g//' | sort -n -t . -k 1,1 -k 2,2 -k 3,3 -k 4,4 |
    tail -n 1 | sed 's/^/g/')" &&
    git checkout --detach refs/tags/$Tag
    c="$(lscpu -p | grep -v '#' | sort -u -t , -k 2,4 | wc -l)" ; [ "$c" -eq 0 ] && c=1
    rm -f output_sdl/liboutput_sdl.so &&
    if [ -d ../fmodapi44464linux ]; then
    f="-DFMOD_LIBRARY=../fmodapi44464linux/api/lib/libfmodex${a}-4.44.64.so \
    -DFMOD_INCLUDE_DIR=../fmodapi44464linux/api/inc"; else
    f='-UFMOD_LIBRARY -UFMOD_INCLUDE_DIR'; fi &&
    cmake .. -DCMAKE_BUILD_TYPE=Release
    make -j4

}

function install_gzdoom-system() {
    md_ret_files=(
        'build/brightmaps.pk3'
        'build/gzdoom'
        'build/gzdoom.pk3'
        'build/lights.pk3'
        'build/game_support.pk3'
	'build/soundfonts'
        'build/game_widescreen_gfx.pk3'
        'README.md'
    )
}

function game_data_gzdoom-system() {
    mkRomDir "doom"
    if [[ ! -f "$romdir/doom/doom1.wad" ]]; then
        wget "$__archive_url/doom1.wad" -O "$romdir/doom/doom1.wad"
    fi

    if [[ ! -f "$romdir/doom/freedoom1.wad" ]]; then
        wget "https://github.com/freedoom/freedoom/releases/download/v0.12.1/freedoom-0.12.1.zip"
        unzip freedoom-0.12.1.zip
        mv freedoom-0.12.1/*.wad "$romdir/doom"
        rm -rf freedoom-0.12.1
        rm freedoom-0.12.1.zip
    fi
}

function configure_gzdoom-system() {
    mkUserDir "$home/.config"
    setConfigRoot ""
    addEmulator 1 "gzdoom" "doom" "$md_inst/gzdoom -iwad %ROM%"
    addSystem "doom" "DOOM" ".pk3 .wad"

    moveConfigDir "$home/.config/gzdoom" "$md_conf_root/gzdoom"

    [[ "$md_mode" == "install" ]] && game_data_gzdoom-system
    [[ "$md_mode" == "remove" ]] && return

}