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

rp_module_id="dxx-rebirth"
rp_module_desc="DXX-Rebirth (Descent & Descent 2) source port"
rp_module_licence="NONCOM https://raw.githubusercontent.com/dxx-rebirth/dxx-rebirth/master/COPYING.txt"
rp_module_section="prt"
rp_module_flags="!mali !odroid-xu"

function depends_dxx-rebirth() {
    local depends=(libpng-dev libphysfs-dev libsdl1.2-dev libsdl-mixer1.2-dev scons)
    if isPlatform "videocore"; then
        depends+=(libraspberrypi-dev)
    elif isPlatform "gles" && ! isPlatform "mesa"; then
        depends+=(libgles2-mesa-dev)
    else
        depends+=(libgl1-mesa-dev libglu1-mesa-dev libsdl2-dev libsdl2-mixer-dev)
    fi

    getDepends "${depends[@]}"
	
	if isPlatform "odroid-n2"; then
	/home/aresuser/ARES-Setup/fixmali.sh
    elif isPlatform "rockpro64"; then
    /usr/lib/arm-linux-gnueabihf/install_mali.sh
	fi
}

function sources_dxx-rebirth() {
    gitPullOrClone "$md_build" https://github.com/dxx-rebirth/dxx-rebirth "master"
}

function build_dxx-rebirth() {
    local params=()
    isPlatform "arm" && params+=("words_need_alignment=1")
    if isPlatform "videocore"; then
        params+=("raspberrypi=1")
    elif isPlatform "mesa"; then
        # GLES is limited to ES 1 and blocks SDL2; GL works at fullspeed on Pi 3.
        params+=("raspberrypi=mesa" "opengl=1" "opengles=0" "sdl2=1")
    elif isPlatform "gles";  then
        params+=("opengl=0" "opengles=1")
    else
        params+=("opengl=1" "opengles=0" "sdl2=1")
    fi

    scons -c
    scons "${params[@]}"
    md_ret_require=(
        "$md_build/build/d1x-rebirth/d1x-rebirth"
        "$md_build/build/d2x-rebirth/d2x-rebirth"
    )
}

function install_dxx-rebirth() {
    # Rename generic files
    mv -f "$md_build/d1x-rebirth/INSTALL.txt" "$md_build/d1x-rebirth/D1X-INSTALL.txt"
    mv -f "$md_build/d1x-rebirth/RELEASE-NOTES.txt" "$md_build/d1x-rebirth/D1X-RELEASE-NOTES.txt"
    mv -f "$md_build/d2x-rebirth/INSTALL.txt" "$md_build/d2x-rebirth/D2X-INSTALL.txt"
    mv -f "$md_build/d2x-rebirth/RELEASE-NOTES.txt" "$md_build/d2x-rebirth/D2X-RELEASE-NOTES.txt"

    md_ret_files=(
        'COPYING.txt'
        'GPL-3.txt'
        'd1x-rebirth/README.RPi'
        'build/d1x-rebirth/d1x-rebirth'
        'd1x-rebirth/d1x.ini'
        'd1x-rebirth/D1X-INSTALL.txt'
        'd1x-rebirth/D1X-RELEASE-NOTES.txt'
        'build/d2x-rebirth/d2x-rebirth'
        'd2x-rebirth/d2x.ini'
        'd2x-rebirth/D2X-INSTALL.txt'
        'd2x-rebirth/D2X-RELEASE-NOTES.txt'
    )
}

function game_data_dxx-rebirth() {
    local D1X_SHARE_URL='http://www.dxx-rebirth.com/download/dxx/content/descent-pc-shareware.zip'
    local D2X_SHARE_URL='http://www.dxx-rebirth.com/download/dxx/content/descent2-pc-demo.zip'
    local D1X_HIGH_TEXTURE_URL='http://www.dxx-rebirth.com/download/dxx/res/d1xr-hires.dxa'
    local D1X_OGG_URL='http://www.dxx-rebirth.com/download/dxx/res/d1xr-sc55-music.dxa'
    local D2X_OGG_URL='http://www.dxx-rebirth.com/download/dxx/res/d2xr-sc55-music.dxa'

    cd "$__tmpdir"

    # Download / unpack / install Descent shareware files
    if [[ ! -f "$romdir/ports/descent1/descent.hog" ]]; then
        downloadAndExtract "$D1X_SHARE_URL" "$romdir/ports/descent1"
    fi

    # High Res Texture Pack
    if [[ ! -f "$romdir/ports/descent1/d1xr-hires.dxa" ]]; then
        wget -nv -P "$romdir/ports/descent1" "$D1X_HIGH_TEXTURE_URL"
    fi

    # Ogg Sound Replacement (Roland Sound Canvas SC-55 MIDI)
    if [[ ! -f "$romdir/ports/descent1/d1xr-sc55-music.dxa" ]]; then
        wget -nv -P "$romdir/ports/descent1" "$D1X_OGG_URL"
    fi

    # Download / unpack / install Descent 2 shareware files
    if [[ ! -f "$romdir/ports/descent2/D2DEMO.HOG" ]]; then
        downloadAndExtract "$D2X_SHARE_URL" "$romdir/ports/descent2"
    fi

    # Ogg Sound Replacement (Roland Sound Canvas SC-55 MIDI)
    if [[ ! -f "$romdir/ports/descent2/d2xr-sc55-music.dxa" ]]; then
        wget -nv -P "$romdir/ports/descent2" "$D2X_OGG_URL"
    fi

    chown -R $user:$user "$romdir/ports/descent1" "$romdir/ports/descent2"
}

function configure_dxx-rebirth() {
    local config
    local ver
    local name="Descent Rebirth"
    for ver in 1 2; do
        mkRomDir "ports/descent${ver}"
        [[ "$ver" -eq 2 ]] && name="Descent 2 Rebirth"
        addPort "$md_id" "descent${ver}" "$name" "$md_inst/d${ver}x-rebirth -hogdir $romdir/ports/descent${ver}"

        # copy any existing configs from ~/.d1x-rebirth and symlink the config folder to $md_conf_root/descent1/
        moveConfigDir "$home/.d${ver}x-rebirth" "$md_conf_root/descent${ver}/"
        if isPlatform "kms"; then
            config="$md_conf_root/descent${ver}/descent.cfg"
            iniConfig "=" '' "$config"
            iniSet "VSync" "1"
            chown $user:$user "$config"
        fi
    done

    [[ "$md_mode" == "install" ]] && game_data_dxx-rebirth
}
