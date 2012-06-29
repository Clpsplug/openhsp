
//
//		Configure for HSP3
//
#ifndef __hsp3config_h
#define __hsp3config_h

//		�V�X�e���֘A���x��
//
#define HSPTITLE "Hot Soup Processor ver."
#define hspver "3.31beta2"
#define mvscode 2		// minor version code
#define vercode 0x3311	// version code

#define HSPERR_HANDLE		// HSP�G���[��O��L���ɂ��܂�
#define SYSERR_HANDLE		// �V�X�e���G���[��O��L���ɂ��܂�


//
//		�ڐA�p�̃��x��
//
#define JPN			// IME use flag
#define JPNMSG		// japanese message flag

//
//	Debug mode functions
//
#define HSPDEBUGLOG	// Debug Log Version

//		Debug Window Message Buffer Size
//
#define dbsel_size 0x10000
#define dbmes_size 0x10000

//
//		���t���O:�ȉ��̃��x���̓R���p�C���I�v�V�����Őݒ肳��܂�
//
//#define HSPWIN		// Windows(WIN32) version flag
//#define HSPMAC		// Macintosh version flag
//#define HSPLINUX		// Linux(CLI) version flag
//#define HSPIOS		// iOS version flag
//#define HSPNDK		// android NDK version flag
//#define HSPDISH		// HSP3Dish flag
#define HSPEMBED		// HSP3 Embed runtime flag

//
//		���t���O�ɕt�������I�v�V����
//
//#define HSPWINGUI		// Windows/GUI (WIN32) version flag
//#define HSPWINDISH	// Windows/DISH (WIN32) version flag
//#define HSPLINUXGUI	// Linux(GUI) version flag

//#define HSPDEBUG	// Debug version flag

//		HSP���g�p��������^
//
#define HSPREAL double

//
//		gcc�g�p�̃`�F�b�N
//
#if defined(HSPMAC)|defined(HSPIOS)|defined(HSPNDK)|defined(HSPLINUX)
#define HSPGCC			// GCC�g�p�t���O
#define HSPUTF8			// UTF8�g�p�t���O
#endif


//
//		�ڐA�p�̒萔
//
#ifdef HSPWIN
#define HSP_MAX_PATH	260
#define HSP_PATH_SEPARATOR '\\'
#else
#define HSP_MAX_PATH	256
#define HSP_PATH_SEPARATOR '/'
#endif

#endif