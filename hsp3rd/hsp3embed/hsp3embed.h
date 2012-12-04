
//
//	hsp3embed.cpp header
//
#ifndef __hsp3embed_h
#define __hsp3embed_h

#ifdef __cplusplus
extern "C" {
#endif

int hsp3eb_init( void );
void hsp3eb_bye( void );
int hsp3eb_exec( void );
int hsp3eb_exectime( int time );
void hsp3eb_setstat( int stat );
struct HSPCTX *hsp3eb_getctx( void );
char *hsp3eb_stmp( char *str );
void hsp3eb_pause( void );
void hsp3eb_resume( void );

#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif
