/*
 * retarget.h
 *
 *  Created on: Dec 14, 2020
 *      Author: 2021_ECE212
 */
// All credit to Carmine Noviello for this code
// https://github.com/cnoviello/mastering-stm32/blob/master/nucleo-f030R8/system/include/retarget/retarget.h

#ifndef INC_RETARGET_H_
#define INC_RETARGET_H_

/*---------------------Add this stuff here-----------------------*/
#include "stm32l4xx_hal.h"
#include <sys/stat.h>

void RetargetInit(UART_HandleTypeDef *huart);
int _isatty(int fd);
int _write(int fd, char* ptr, int len);
int _close(int fd);
int _lseek(int fd, int ptr, int dir);
int _read(int fd, char* ptr, int len);
int _fstat(int fd, struct stat* st);
/*---------------------------------------------------------------*/



#endif /* INC_RETARGET_H_ */
