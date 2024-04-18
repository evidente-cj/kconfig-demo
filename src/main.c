/*
 * Copyright (c) 2021 Nordic Semiconductor ASA
 * SPDX-License-Identifier: Apache-2.0
 */

#include <zephyr/kernel.h>

int main(void)
{

#ifdef CONFIG_USR_FUN
	usr_fun();
#endif

	while (1) {
		printk("Hello, World!\n");
		k_sleep(K_MSEC(1000));
	}

	return 0;
}

