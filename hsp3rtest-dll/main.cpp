/*--------------------------------------------------------
	HSP3 interpreter main
									  2015/06  zakki
  --------------------------------------------------------*/

#include <stdio.h>
#include <string.h>
#include <windows.h>
#include "hsp3dll.h"

/*----------------------------------------------------------*/

int WINAPI DllMain(HINSTANCE hInstance, DWORD fdwReason, PVOID pvReserved)
{
	if (fdwReason == DLL_PROCESS_ATTACH) {
		int res;

		res = hsp3dll_init(NULL);
		if (res) return FALSE;
		res = hsp3dll_exec();
	}
	return TRUE;
}
