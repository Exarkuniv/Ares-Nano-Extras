#!/usr/bin/env bash

# This file is part of RetroPie-Extra, a supplement to RetroPie.
# For more information, please visit:
#
# https://github.com/RetroPie/RetroPie-Setup
# https://github.com/Exarkuniv/RetroPie-Extra
#
# See the LICENSE file distributed with this source and at
# https://raw.githubusercontent.com/Exarkuniv/RetroPie-Extra/master/LICENSE
#

rp_module_id="nblood"
rp_module_desc="Nblood - Blood source port"
rp_module_licence="GPL3 https://github.com/OpenMW/osg/blob/3.4/LICENSE.txt"
rp_module_help="you need to put the \n\BLOOD.INI, \n\BLOOD.RFF, \n\BLOOD000.DEM, ..., BLOOD003.DEM (optional), \n\GUI.RFF, \n\SOUNDS.RFF, \n\SURFACE.DAT, \n\TILES000.ART, ..., TILES017.ART, \n\VOXEL.DAT in $romdir/ports/Nblood
,\n\Cryptic Passage,\n\
CP01.MAP, ..., CP09.MAP,\n\CPART07.AR_,\n\CPART15.AR_,\n\CPBB01.MAP, ..., CPBB04.MAP,\n\CPSL.MAP,\n\CRYPTIC.INI\n\CRYPTIC.SMK \n\CRYPTIC.WAV"
rp_module_section="prt"
rp_module_flags=""


function depends_nblood() {
   getDepends nasm libgl1-mesa-dev libglu1-mesa-dev libsdl1.2-dev libsdl-mixer1.2-dev libsdl2-dev libsdl2-mixer-dev flac libflac-dev libvorbis-dev libvpx-dev libgtk2.0-dev freepats

}

function sources_nblood() {
	gitPullOrClone "$md_build"  https://github.com/nukeykt/NBlood.git "master"
}

function build_nblood() {
    cd $md_build
   make blood STARTUP_WINDOW=0
	md_ret_require="$md_build"
}

function install_nblood() {
    md_ret_files=('nblood'
		'nblood.pk3'
    )
}

function configure_nblood() {
	mkdir "$home/.config/nblood"

	cp -v nblood.cfg "$home/.config/nblood"
	chown -R pi:pi "$home/.config/nblood"

	mkRomDir "ports/nblood"
	#mkRomDir "ports/nblood/CP"

	addPort "$md_id" "nblood" "Nblood - Blood source port" "$md_inst/nblood  -j=$romdir/ports/nblood"
	#addPort "$md_id" "nbloodcp" "Nblood - Cryptic Passage "$md_inst/nblood -ini CRYPTIC.INI -j=$romdir/ports/nblood/CP"

}