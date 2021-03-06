FILESEXTRAPATHS_prepend := "\
:${THISDIR}/patches/${KV}\
:${THISDIR}/conf/yocto-${KV}/${RUNTARGET}/${LINUX_KERNEL_TYPE}:"

KV = "4.9"
LINUX_VERSION_axxiax86-64 = "4.9.71"
KBRANCH_axxiax86-64 = "standard/axxia/base"
SRCREV_machine_axxiax86-64 = "95fe699e8a23c05858255c17b92816b67c37b5ce"
SRCREV_meta_axxiax86-64 = "688a904c38ecfdc36c23eafc8e93aadc2c537535"

# "simics" for simulation system or "frio" for FPGA emulation system
RUNTARGET ?= "simics"

SIMICS_PATCHES = " \
file://SIMICS-0001-intel_th-pci-Add-Cedar-Fork-PCH-support.patch \
file://SIMICS-0002-spi-nor-Add-support-for-Intel-SPI-serial-flash-contr.patch \
file://SIMICS-0003-pinctrl-intel-set-default-handler-to-be-handle_bad_i.patch \
file://SIMICS-0004-pinctrl-intel-Convert-to-use-devm_gpiochip_add_data.patch \
file://SIMICS-0005-pinctrl-intel-Add-support-for-hardware-debouncer.patch \
file://SIMICS-0006-pinctrl-intel-Add-support-for-1k-additional-pull-dow.patch \
file://SIMICS-0007-pinctrl-intel-unlock-on-error-in-intel_config_set_pu.patch \
file://SIMICS-0008-pinctrl-intel-Add-support-for-variable-size-pad-grou.patch \
file://SIMICS-0009-pinctrl-intel-Make-it-possible-to-specify-mode-per-p.patch \
file://SIMICS-0010-mtd-spi-nor-intel-spi-Add-support-for-Intel-Denverto.patch \
file://SIMICS-0011-pinctrl-intel-Add-Intel-Denverton-pin-controller-sup.patch \
file://SIMICS-0012-i2c-i801-Add-support-for-Intel-Cedar-Fork.patch \
file://SIMICS-0013-pinctrl-intel-Make-offset-to-interrupt-status-regist.patch \
file://SIMICS-0014-pinctrl-intel-Add-Intel-Cedar-Fork-PCH-pin-controlle.patch \
file://SIMICS-0015-mtd-spi-nor-intel-spi-Add-support-for-Intel-Cedar-Fo.patch \
"

FRIO_PATCHES = " \
file://FRIO-0001-PCI-ASPM-Don-t-retrain-link.patch \
file://FRIO-0002-pci-driver-HACK-reassign-Altera-FPGAs-if-they-have-n.patch \
file://FRIO-0003-pci-driver-HACK-hardcode-size-of-bridge-window-to-NC.patch \
file://FRIO-0004-pci-driver-HACK-don-t-allocate-additional-bridge-win.patch \
file://FRIO-0005-pci-driver-HACK-merge-for-Altera.patch \
"

SRC_URI_append_axxiax86-64 = " \
	${@base_conditional('RUNTARGET', 'frio', '${FRIO_PATCHES}', '', d)} \
	${@base_conditional('RUNTARGET', 'simics', '${SIMICS_PATCHES}', '', d)} \
	file://defconfig \
	"

COMPATIBLE_MACHINE_axxiax86-64 = "${MACHINE}"
INSANE_SKIP_kernel-dev_axxiax86-64 = "debug-files"