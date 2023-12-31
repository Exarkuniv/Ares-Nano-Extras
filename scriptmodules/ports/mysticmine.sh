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

rp_module_id="mysticmine"
rp_module_desc="Mystic Mine - Rail game for up to six players on one keyboard"
rp_module_licence="MIT https://raw.githubusercontent.com/dewitters/MysticMine/master/LICENSE.txt"
rp_module_section="prt"
rp_module_flags=""

function depends_mysticmine() {
    getDepends python-pyrex python-numpy python-pygame
	
	if isPlatform "odroid-n2"; then
	/home/aresuser/ARES-Setup/fixmali.sh
    elif isPlatform "rockpro64"; then
    /usr/lib/arm-linux-gnueabihf/install_mali.sh
	fi
	
}

function sources_mysticmine() {
    gitPullOrClone "$md_build" https://github.com/dewitters/MysticMine.git master
}

function build_mysticmine() {
    make
}

function install_mysticmine() {
    python2 setup.py install --prefix "$md_inst"
}

function configure_mysticmine() {
    addPort "$md_id" "mysticmine" "MysticMine" "XINIT:pushd $md_inst; PYTHONPATH=$PYTHONPATH:${md_inst}/lib/python2.7/site-packages ./bin/MysticMine; popd"
}
