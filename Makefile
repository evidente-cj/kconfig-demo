# This makefile is just for convenience to avoid writing longer/more verbose commands.
# Because of some bug in NCS (nrf connect sdk) with the python environment, every west command
# needs to be prefixed with `nrfutil toolchain-manager launch -- <west ...>`. Hence, this makefile
# serves as a wrapper for those longer commands.

BOARD=nrf52840dk_nrf52840
VID_PID=1366:1015
NCS_VERSION=v2.6.0

# specify default target
all: build

# debug build
build:
	nrfutil toolchain-manager launch --ncs-version $(NCS_VERSION) -- west build -p auto -b $(BOARD) .

pristine:
	nrfutil toolchain-manager launch --ncs-version $(NCS_VERSION) -- west build -p always -b $(BOARD) .

attach:
	usbipd.exe attach -w -i $(VID_PID)

flash:
	nrfutil toolchain-manager launch --ncs-version $(NCS_VERSION) -- west flash

flash-erase:
	nrfutil toolchain-manager launch --ncs-version $(NCS_VERSION) -- west flash --erase

flash-recover:
	nrfutil toolchain-manager launch --ncs-version $(NCS_VERSION) -- west flash --recover

debug:
	nrfutil toolchain-manager launch --ncs-version $(NCS_VERSION) -- west debug


menuconfig:
	nrfutil toolchain-manager launch --ncs-version $(NCS_VERSION) -- west build -b $(BOARD) -t menuconfig .

guiconfig:
	nrfutil toolchain-manager launch --ncs-version $(NCS_VERSION) -- west build -b $(BOARD) -t guiconfig .

clean:
	rm -rf build

# Declare the 'all' and 'clean' targets as phony to avoid conflicts with files of the same name
.PHONY: all attach clean flash debug tests build pristine flash-erase
