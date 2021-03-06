meta-intel-axxia/meta-intel-snr
===============================

This is the official layer for Intel Snowridge BSP.


Supported MACHINES
==================

Boards Supported by this layer (Please refer to the associate .conf
for more information):

	* axxiax86-64 - Axxia x86 Mobile & Enterprise Communication 
                        Processors family (64-bit)

Reference Boards
================

Snowridge - based on x86_64 architecture - hardware is not available
yet, just the simulator.


Dependencies
============

Intel Meta Layer
URI: git://git.yoctoproject.org/meta-intel
branch: rocko
revision: HEAD


Building with Yocto poky
========================

For building the SNR BSP layer using Yocto poky layer, please refer
to the README file from the main layer meta-intel-axxia.


Building with Wind River Linux 17
=================================

In order to build SNR BSP layer with olter yocto-compatible layers,
such as Wind River Linux 17 layers, the following additional steps
are required:

    bitbake-layers add-layer <path-to-layer>/meta-intel
    bitbake-layers add-layer <path-to-layer>/meta-intel-snr

In local.conf, set axxiax86-64 machine and add to the white list the
following packages:

    PNWHITELIST_intel += "rmc-db rmc rmc-efi thermald intel-microcode \
		          iucode-tool"


Maintenance
===========

Maintainers: Daniel Dragomir <daniel.dragomir@windriver.com>
	     John Jacques <john.jacques@intel.com>

Please see the meta-intel-axxia/MAINTAINERS file for more details.


License
=======

All metadata (except simicsfs module) is MIT licensed unless otherwise stated.
Souce code included in tree for individual recipes is under the LICENSE stated
in each recipe (.bb file) unless otherwise stated.

The simicsfs external module is licensed under the GPLv2 (licence file included
meta-intel-axxia layer).
