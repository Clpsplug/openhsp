
//
//	hsp3rdll header
//
#ifndef __hsp3rdll_h
#define __hsp3rdll_h

#define HSP_DLL_EXPORT extern "C"  __declspec(dllexport)
#ifndef HSP_DLL_IMPORT
#  define HSP_DLL_IMPORT __declspec(dllimport)
#endif

#endif
