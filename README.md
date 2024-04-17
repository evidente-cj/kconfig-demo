# Kconfig demo application

Just a simple hello-world ncs-workspace application as a base for a Kconfig demo.

## Getting started

Before getting started, make sure you have a proper nRF Connect SDK development environment.
Follow the official
[Installation guide](https://developer.nordicsemi.com/nRF_Connect_SDK/doc/latest/nrf/installation/install_ncs.html).

### Initialization

The first step is to initialize the workspace folder (``my-workspace``) where
the ``kconfig-demo application`` and all nRF Connect SDK modules will be cloned. Run the following
command:

```shell
# initialize my-workspace for the kconfig-demo application (main branch)
west init -m https://github.com/evidente-cj/kconfig-demo --mr main my-workspace
# update nRF Connect SDK modules
cd my-workspace
west update
```

### Building and running

Start by changing the BOARD variable in the Makefile to whatever you are using.

To build the application, run the following command:

```shell
make
```

For pristine build:

```shell
make pristine
```

Flashing you board:

```shell
make flash
```

