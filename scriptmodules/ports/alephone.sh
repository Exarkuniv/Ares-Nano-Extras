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

rp_module_id="alephone"
rp_module_desc="AlephOne - Marathon Engine"
rp_module_help="To get the games running on the Raspberry Pi/Odroid, make sure to set each game to use the software renderer and disable the enhanced HUD from the Plugins menu. For Marathon 1, disable both HUDs from the Plugins menu, start a game, quit back to the title screen and enable Enhanced HUD and it will work and properly."
rp_module_licence="GPL3 https://raw.githubusercontent.com/Aleph-One-Marathon/alephone/master/COPYING"
rp_module_section="prt"
rp_module_flags=""

function depends_alephone() {
    local depends=(libboost-all-dev libspeexdsp-dev libzzip-dev libavcodec-dev libavformat-dev libavutil-dev libswscale-dev autoconf automake libboost-system-dev libcurl4-openssl-dev autoconf-archive libsndfile1-dev)
    if compareVersions "$__os_debian_ver" ge 9 || [[ -n "$__os_ubuntu_ver" ]]; then
        depends+=(libsdl2-dev libsdl2-net-dev libsdl2-image-dev libsdl2-ttf-dev libglu1-mesa-dev libgl1-mesa-dev)
    else
        depends+=(libsdl1.2-dev libsdl-net1.2-dev libsdl-image1.2-dev libsdl-ttf2.0-dev)
    fi
    getDepends "${depends[@]}"
	
	if isPlatform "odroid-n2"; then
	/home/aresuser/ARES-Setup/fixmali.sh
    elif isPlatform "rockpro64"; then
    /usr/lib/arm-linux-gnueabihf/install_mali.sh
	fi
	
}

function sources_alephone() {
    gitPullOrClone "$md_build" "https://github.com/Aleph-One-Marathon/alephone.git"
}

function build_alephone() {
    autoreconf -i
    ./configure
    make clean
    make -j4
    md_ret_require="$md_build/Source_Files/alephone"
}

function install_alephone() {
    make install
}

function game_data_alephone() {
    local release_url="https://github.com/Aleph-One-Marathon/alephone/releases/download/release-20150620"

    if [[ ! -f "$romdir/ports/$md_id/Marathon/Shapes.shps" ]]; then
        downloadAndExtract "$release_url/Marathon-20150620-Data.zip" "$romdir/ports/$md_id"
    fi

    if [[ ! -f "$romdir/ports/$md_id/Marathon 2/Shapes.shpA" ]]; then
        downloadAndExtract "$release_url/Marathon2-20150620-Data.zip" "$romdir/ports/$md_id"
    fi

    if [[ ! -f "$romdir/ports/$md_id/Marathon Infinity/Shapes.shpA" ]]; then
        downloadAndExtract "$release_url/MarathonInfinity-20150620-Data.zip" "$romdir/ports/$md_id"
    fi

    chown -R $user:$user "$romdir/ports/$md_id"
}

function configure_alephone() {
    addPort "$md_id" "marathon" "Aleph One Engine - Marathon" "'/usr/local/bin/alephone' '$romdir/ports/$md_id/Marathon/'"
    addPort "$md_id" "marathon2" "Aleph One Engine - Marathon 2" "'/usr/local/bin/alephone' '$romdir/ports/$md_id/Marathon 2/'"
    addPort "$md_id" "marathoninfinity" "Aleph One Engine - Marathon Infinity" "'/usr/local/bin/alephone' '$romdir/ports/$md_id/Marathon Infinity/'"

    mkRomDir "ports/$md_id"

    moveConfigDir "$home/.alephone" "$md_conf_root/alephone"
    # fix for wrong config location
    if [[ -d "/alephone" ]]; then
        cp -R /alephone "$md_conf_root/"
        rm -rf /alephone
        chown $user:$user "$md_conf_root/alephone"
    fi

    [[ "$md_mode" == "install" ]] && game_data_alephone
}
