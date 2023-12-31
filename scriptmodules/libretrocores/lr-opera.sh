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

rp_module_id="lr-opera"
rp_module_desc="3DO emulator - fork of 4DO/FreeDO for libretro"
rp_module_help="ROM Extension: .iso\n\nCopy your 3do roms to $romdir/3do\n\nCopy the required BIOS file panazf10.bin to $biosdir"
rp_module_licence="LGPL https://raw.githubusercontent.com/libretro/opera-libretro/master/libfreedo/freedo_3do.c"
rp_module_section="lr"

function sources_lr-opera() {
    gitPullOrClone "$md_build" https://github.com/libretro/opera-libretro.git
}

function _update_hook_lr-opera() {
     renameModule "lr-4do" "lr-opera"
}

function build_lr-opera() {
    make clean
    make
    md_ret_require="$md_build/opera_libretro.so"
}

function install_lr-opera() {
    md_ret_files=(
        'opera_libretro.so'
    )
}

function configure_lr-opera() {
    mkRomDir "3do"
    ensureSystemretroconfig "3do"

    cp "$md_inst/opera_libretro.so" "/home/aresuser/.config/retroarch/cores"
}