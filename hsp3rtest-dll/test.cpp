//
//	hsp3cnv(3.5b2) generated source
//	[test.ax]
//
#include "hsp3r.h"
#include "hsp3rdll.h"

#define _HSP3CNV_DATE "2015/06/28"
#define _HSP3CNV_TIME "19:47:51"
#define _HSP3CNV_MAXVAR 0
#define _HSP3CNV_MAXHPI 0
#define _HSP3CNV_VERSION 0x350
#define _HSP3CNV_BOOTOPT 8192

/*-----------------------------------------------------------*/


/*-----------------------------------------------------------*/

void __HspEntry( void ) {
	// Var initalize

	// goto *L0000
	TaskSwitch(0);
	return;
	TaskSwitch(1);
}

static void L0001( void ) {
	// #defcfunc funca int _prm0, double _prm1, local _prm2
	// mes _prm0
	PushFuncPrmI(1); 
	Extcmd(15,1);
	// return _prm1*2
	PushFuncPrmD(2); PushInt(2); CalcMulI(); 
	Prgcmd(2,1);
	return;
	TaskSwitch(2);
}

static void L0002( void ) {
	// #defcfunc funcb str _prm3
	// return strlen(_prm3)
	PushFuncEnd(); 	PushFuncPrm(0); 
	PushIntfunc(2,1); 
	Prgcmd(2,1);
	return;
	TaskSwitch(0);
}

static void L0000( void ) {
	// mes "a"
	PushStr("a"); 
	Extcmd(15,1);
	// mes "> "+funca(2, 2.510000)
	PushStr("> "); PushFuncEnd(); 	PushDouble(2.510000); 
		PushInt(2); 
	PushModcmd(0,2); CalcAddI(); 
	Extcmd(15,1);
	// mes "ok"
	PushStr("ok"); 
	Extcmd(15,1);
	TaskSwitch(3);
}

static void L0003( void ) {
	// stop 
	Prgcmd(17,0);
	return;
	// goto *L0003
	TaskSwitch(3);
	return;
}

//-End of Source-------------------------------------------

CHSP3_TASK __HspTaskFunc[]={
(CHSP3_TASK) L0000,
(CHSP3_TASK) L0001,	// funca
(CHSP3_TASK) L0002,	// funcb
(CHSP3_TASK) L0003,
(CHSP3_TASK) 0,

};

/*-----------------------------------------------------------*/

STRUCTDAT __HspFuncInfo[]={
	{ -2,0, 0,3,0,1,1, (void *)0 },
	{ -2,1, 3,1,6,0,2, (void *)0 },
};

STRUCTPRM __HspPrmInfo[]={
	{ 4, -1, 0 },
	{ 3, -1, 4 },
	{ -1, -1, 12 },
	{ -6, -1, 0 },
};

char __HspDataName[]="funca\0"\
"funcb\0"\
;


/*-export----------------------------------------------------*/


HSP_DLL_EXPORT int funca(int prm0, double prm1) {
	PushFuncEnd();
	PushDouble(prm1);//3
	PushInt(prm0);//4
	PushModcmd(0, 2);
	return PopInt();
}

HSP_DLL_EXPORT int funcb(char* prm0) {
	PushFuncEnd();
	PushStr(prm0);//-6
	PushModcmd(1, 1);
	return PopInt();
}


/*-----------------------------------------------------------*/

void __HspInit( Hsp3r *hsp3 ) {
	hsp3->Reset( _HSP3CNV_MAXVAR, _HSP3CNV_MAXHPI );
	hsp3->SetDataName( __HspDataName );
	hsp3->SetFInfo( __HspFuncInfo, 56 );
	hsp3->SetLInfo( 0, 0 );
	hsp3->SetMInfo( __HspPrmInfo, 32 );
}

/*-----------------------------------------------------------*/

