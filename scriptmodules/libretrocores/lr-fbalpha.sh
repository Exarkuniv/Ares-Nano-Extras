#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="lr-fbalpha"
rp_module_desc="Arcade emu - Final Burn Alpha (v0.2.97.43) port for libretro"
rp_module_help="Previously called lr-fba-next\n\ROM Extension: .zip\n\nCopy your FBA roms to\n$romdir/fba or\n$romdir/neogeo or\n$romdir/arcade\n\nFor NeoGeo games the neogeo.zip BIOS is required and must be placed in the same directory as your FBA roms."
rp_module_licence="NONCOM https://raw.githubusercontent.com/libretro/fbalpha/master/src/license.txt"
rp_module_section="lr"

function _update_hook_lr-fbalpha() {
    # move from old location and update emulators.cfg
    renameModule "lr-fba-next" "lr-fbalpha"
}

function sources_lr-fbalpha() {
    gitPullOrClone "$md_build" https://github.com/libretro/fbalpha.git
}

function build_lr-fbalpha() {
    local params=()
    isPlatform "arm" && params+=(USE_CYCLONE=1)
    isPlatform "neon" && params+=(HAVE_NEON=1)
    make -f makefile.libretro clean
    make -f makefile.libretro "${params[@]}"
    md_ret_require="$md_build/fbalpha_libretro.so"
}

function install_lr-fbalpha() {
    md_ret_files=(
        'fba.chm'
        'fbalpha_libretro.so'
        'gamelist.txt'
        'whatsnew.html'
        'preset-example.zip'
        'metadata'
        'dats'
    )
}

function configure_lr-fbalpha() {
    local dir
    for dir in arcade fba neogeo; do
        mkRomDir "$dir"
        ensureSystemretroconfig "$dir"
    done

    # Create samples directory
    mkUserDir "$biosdir/fba"
    mkUserDir "$biosdir/fba/samples"
    cp "$md_inst/fbalpha_libretro.so" "/home/aresuser/.config/retroarch/cores"
    # copy hiscore.dat
    cp "$md_inst/metadata/hiscore.dat" "$biosdir/fba/"
    chown $user:$user "$biosdir/fba/hiscore.dat"

    # Set core options
    setRetroArchCoreOption "fba-diagnostic-input" "Hold Start"
}