//-----------------------------------------------------
//	Datafile Pack Manager service
//	( No encryption for OpenHSP )
//			onion software 1996/6
//			Modified for win32 in 1997/8
//			Modified for HSP2.6 in 2000/7
//			Modified for HSP3.0 in 2004/11
//-----------------------------------------------------

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#ifdef HSPWIN
#include <windows.h>
#endif

#include "hsp3config.h"
#include "dpmread.h"
#include "supio.h"

#ifdef HSPIOS
#include "../Classes/iOSBridge.h"
#endif

#ifdef HSPNDK
#include "hsp3/hgio.h"
#endif

static int dpm_flag = 0;			// 0=none/1=packed
static int memf_flag = 0;			// 0=none/1=on memory
static unsigned char *mem_dpm = NULL;
static unsigned char *nameptr;
static unsigned char buf[0x80];
static char dpm_file[HSP_MAX_PATH];
static long dpm_ofs,optr,fs,fptr;
static int dpm_fenc, dpm_enc1, dpm_enc2;
static int dpm_opmode;
static int dent;
static int seed1, seed2;
static unsigned char dpm_lastchr;
static FILE *fp;

typedef struct MEMFILE {
	char	*pt;				// target ptr
	int		cur;				// current ptr
	int		size;				// size
} MEMFILE;
static	MEMFILE memfile = { NULL, 0, -1 };


#define	p_optr 0x04			// ���f�[�^�J�n�|�C���^
#define p_dent 0x08			// �f�B���N�g���G���g����
#define p_dnam 0x0c			// �l�[���X�y�[�X�m�ۃT�C�Y(ver2.6)

#define d_farc 0x08			// ���kflag(�擪��'\0'�̎��̂ݗL��)
#define d_fasz 0x0c			// ���k��size(�擪��'\0'�̎��̂ݗL��)
#define d_fnpt 0x10			// ���O�i�[�|�C���^(�擪��'\0'�̎��̂ݗL��)
#define d_fenc 0x14			// �Í���flag(�擪��'\0'�̎��̂ݗL��)
#define d_fent 0x18			// �t�@�C���i�[�|�C���^
#define d_fsiz 0x1c			// �t�@�C��size

/*----------------------------------------------------------------------------------*/

#define getdw( ofs ) ( *(unsigned long *)(buf+ofs) )

/*----------------------------------------------------------------------------------*/

static int dpmchk( char *fname )
{
	int a1,a2;
	char c1;
	char f1[HSP_MAX_PATH];
	char *ss;
	unsigned char *uc;

	dpm_opmode = 0;
	dpm_fenc = 0;
	dpm_enc1 = 0; dpm_enc2 = 0;

	a1=0;while(1) {
		c1=fname[a1];f1[a1]=tolower(c1);
		if (c1==0) break;
		a1++;
	}

	if ( mem_dpm == NULL ) return -1;
	a2 = -1;
	ss = (char *)(mem_dpm + 16);
	for(a1=0;a1<dent;a1++) {
   		if ( strcmp( ss, f1 )==0 ) {
			memcpy( buf,ss,32 );
			a2=a1;
			break;
		}
		ss += 32;
	}
	if (a2==-1) return -1;

	fs = getdw( d_fsiz );
	fptr = getdw( d_fent );
	fp=fopen( dpm_file,"rb" );if (fp==NULL) return -1;

	fseek( fp,fptr+optr,SEEK_SET );
	dpm_fenc = getdw( d_fenc );
	dpm_lastchr = 0;
	dpm_opmode = 1;
	return 0;
}


static int dpm_chkmemf( char *fname )
{
	//		�������X�g���[�����`�F�b�N
	//
	int i;
	char *p;
	char tmp[HSP_MAX_PATH];
	memf_flag=0;
	i = *(int *)fname;
	if (( i == 0x3a4d5044 )||( i == 0x3a6d7064 )) {			// 'DPM:'���`�F�b�N����
		p = strchr2( fname+4 , ':' );
		dpm_bye();
		if ( p != NULL ) {
			*p=0;
			strcpy( tmp, p+1 );
			dpm_ini( fname+4, 0, -1, -1 );
			strcpy( fname, tmp );
		}
		return 0;
	}
	if (( i == 0x3a4d454d )||( i == 0x3a6d656d )) {			// 'MEM:'���`�F�b�N����
		memf_flag = 1;
		return 1;
	}
	return 0;
}


FILE *dpm_open( char *fname )
{
//	dpm_chkmemf( fname );
//	if ( memf_flag ) {
//		memfile.cur = 0;
//		if ( memfile.size < 0 ) return NULL;
//		return (FILE *)&memfile;
//	}
	if ( dpm_flag ) {
		if ( dpmchk( fname )==0 ) {
			return fp;
		}
	}
	fp=fopen( fname,"rb" );
	return fp;
}


void dpm_close()
{
//	if ( memf_flag ) { return; }
	fclose(fp);
}


int dpm_fread( void *mem, int size, FILE *stream )
{
	int a;
	int len;
	unsigned char *p;
	unsigned char ch;
	int seed1x,seed2x;

//	if ( memf_flag ) {							// �������X�g���[����
//		len = size;
//		if (( memfile.cur + size ) >= memfile.size ) len = memfile.size - memfile.cur;
//		if ( len>0 ) {
//			memcpy( mem, memfile.pt + memfile.cur, len );
//			memfile.cur += len;
//		}
//		return len;
//	}
	len = (int)fread( mem, 1, size, stream );
	return len;
}

/*----------------------------------------------------------------------------------*/

int dpm_ini( char *fname, long dpmofs, int chksum, int deckey )
{
	//
	//		DPM�t�@�C���ǂݍ��݂̏�����
	//
	int hedsize;
	int namsize;
	int dirsize;
	int sum,sumseed,sumsize;
	int a1;
	char dpmfile[HSP_MAX_PATH];
	unsigned char *dec;

	optr=0;
	dpm_flag=0;
	memf_flag=0;
	dpm_ofs=dpmofs;
	mem_dpm = NULL;

#ifdef HSPWIN
	if ( *fname == 0 ) {
		GetModuleFileName( NULL,dpmfile,_MAX_PATH );
	} else {
		strcpy( dpmfile, fname );
	}
#endif
#ifdef HSPNDK
	strcpy( dpmfile, fname );
#endif
#ifdef HSPIOS
	strcpy( dpmfile, gb_filepath(fname) );
#endif

	fp=fopen( dpmfile,"rb" );
    if (fp==NULL) return -1;

	if (dpmofs>0) fseek( fp, dpmofs, SEEK_SET );

	fread( buf,16,1,fp );
	optr=getdw( p_optr )+dpmofs;
	dent=(int)getdw( p_dent );
	fclose(fp);

	buf[4]=0;if (strcmp((char *)buf,"DPMX")!=0) {
		return -1;
	}

	namsize = getdw( p_dnam );
	dirsize = 32 * dent;
	hedsize = 16 + namsize + dirsize;
	mem_dpm = (unsigned char *)malloc( hedsize );
	if ( mem_dpm==NULL ) return -1;

	//		�����o�b�t�@��DPM�w�b�_��ǂݍ���
	//
	fp=fopen( dpmfile,"rb" );
	if (dpmofs>0) fseek( fp, dpmofs, SEEK_SET );
	fread( mem_dpm, hedsize, 1, fp );
	fclose(fp);

	//		DPM�̃`�F�b�N�T�������؂���
	//
	sum = 0; sumsize = 0;
	sumseed = ((deckey>>24)&0xff)/7;
	if ( chksum != -1 ) {
		fp=fopen( dpmfile,"rb" );
		if (dpmofs>0) fseek( fp, dpmofs, SEEK_SET );
		while(1) {
			a1=fgetc(fp);if (a1<0) break;
			sum+=a1+sumseed;sumsize++;
		}
		fclose(fp);
		sum &= 0xffff;				// lower 16bit sum
		if ( chksum != sum ) return -2;
		sumsize -= hedsize;
	}

	//		DPM���[�h�ɂ���
	//
	dpm_flag = 1;
	strcpy(dpm_file,dpmfile);
	//Alertf( "Init:DPM ready(%s)",dpm_file );
	return 0;
}


void dpm_bye( void )
{
	if ( mem_dpm!=NULL ) free( mem_dpm );
	dpm_flag=0;
}


int dpm_read( char *fname, void *readmem, int rlen, int seekofs )
{
	char *lpRd;
	FILE *ff;
	int a1;
	int seeksize;
	int filesize;

	//dpm_chkmemf( fname );

	seeksize=seekofs;
	if (seeksize<0) seeksize=0;

	lpRd=(char *)readmem;
#if 0
	if ( memf_flag ) {							// �������X�g���[����
		dpm_open( fname );
		memfile.cur = seeksize;
		a1 = dpm_fread( lpRd, rlen, NULL );
		dpm_close();
		return a1;
	}
#endif
		
#ifdef HSPIOS
    filesize = gb_existdata( fname );
    if ( filesize > 0 ) {
        gb_loaddata( fname, lpRd, filesize, seekofs );
        return filesize;
    }
#endif

	if (dpm_flag) {
		if ( dpmchk( fname )==0 ) {
			filesize = fs;
			fclose(fp);

			//	Read DPM file

			ff = fopen( dpm_file,"rb" );
			if ( ff == NULL ) return -1;
			fseek( ff, optr+fptr+seeksize, SEEK_SET );
			if ( rlen < filesize ) filesize = rlen;
			a1 = dpm_fread( lpRd, filesize, ff );
			fclose( ff );
			return a1;
		}
	}

#ifdef HSPIOS
	ff = fopen( gb_filepath(fname), "rb" );
	if ( ff == NULL ) return -1;
	if ( seekofs>=0 ) fseek( ff, seeksize, SEEK_SET );
	a1 = (int)fread( lpRd, 1, rlen, ff );
	fclose( ff );
	return a1;
#endif

#ifdef HSPNDK
	return hgio_file_read( fname, readmem, rlen, seekofs );
#endif

	//	Read normal file
	ff = fopen( fname, "rb" );
	if ( ff == NULL ) return -1;
	if ( seekofs>=0 ) fseek( ff, seeksize, SEEK_SET );
	a1 = (int)fread( lpRd, 1, rlen, ff );
	fclose( ff );
	return a1;
}


int dpm_exist( char *fname )
{
	FILE *ff;
	int length;

#ifdef HSPIOS
    length = gb_existdata( fname );
    if ( length > 0 ) return length;
#endif
    
#if 0
	dpm_chkmemf( fname );
	if ( memf_flag ) {					// �������X�g���[����
		return memfile.size;
	}
#endif

	if (dpm_flag) {
		if ( dpmchk( fname )==0 ) {
			dpm_close();
			return fs;					// dpm file size
		}
	}

#ifdef HSPIOS
    ff=fopen( gb_filepath(fname),"rb" );
	if (ff==NULL) return -1;
	fseek( ff,0,SEEK_END );
	length=(int)ftell( ff );			// normal file size
	fclose(ff);
	return length;
#endif
    
#ifdef HSPNDK
	return hgio_file_exist( fname );
#endif

    ff=fopen( fname,"rb" );
	if (ff==NULL) return -1;
	fseek( ff,0,SEEK_END );
	length=(int)ftell( ff );			// normal file size
	fclose(ff);

	return length;
}


int dpm_filebase( char *fname )
{
	//		�w��t�@�C�����ǂ��ɂ��邩�𓾂�
	//		(-1:error/0=file/1=dpm/2=memory)
	//
	FILE *ff;
#if 0
	dpm_chkmemf( fname );
	if ( memf_flag ) {
		return 2;
	}
#endif

	if ( dpm_flag ) {
		if ( dpmchk( fname )==0 ) {
			dpm_close();
			return 1;
		}
	}

#ifdef HSPIOS
	ff=fopen( gb_filepath( fname ), "rb" );
	if (ff==NULL) return -1;
	fclose(ff);
#endif

#ifdef HSPNDK
	if ( hgio_file_exist( fname ) < 0 ) return -1;
	return 0;
#endif

	ff=fopen( fname, "rb" );
	if (ff==NULL) return -1;
	fclose(ff);
	return 0;
}


void dpm_getinf( char *inf )
{
	long a;
	a=dpm_ofs;
	if (dpm_flag==0) a=-1;
/*
	rev 43
	mingw : warning : ������:int ������:long
	�ɑΏ�
*/
	sprintf(inf,"%s,%d",dpm_file, static_cast< int >( a ) );
}


int dpm_filecopy( char *fname, char *sname )
{
	FILE *fp1;
	FILE *fp2;
	int fres;
	int flen;
	int xlen;
	int max=0x8000;
	char *mem;

	dpm_chkmemf( fname );
	flen=dpm_exist(fname);
	if (flen<0) return 1;

	fp2=fopen(sname,"wb");if (fp2==NULL) return 1;
	fp1=dpm_open(fname);

		mem=(char *)malloc(max);
		while(1) {
			if (flen==0) break;
			if (flen<max) xlen=flen; else xlen=max;
			dpm_fread( mem, xlen, fp1 );
			fres = (int)fwrite( mem, 1, xlen, fp2 );
			if (fres<xlen) break;
			flen-=xlen;
		}

	dpm_close();
	fclose(fp2);
	free(mem);

	if (flen!=0) return 1;
	return 0;
}


void dpm_memfile( void *mem, int size )
{
	memfile.pt = (char *)mem;
	memfile.cur = 0;
	memfile.size = size;
}


char *dpm_readalloc( char *fname )
{
	char *p;
	int len;
	len = dpm_exist( fname );
	if ( len < 0 ) return NULL;
	p = mem_ini( len );
	dpm_read( fname, p, len, 0 );
	return p;
}


/*----------------------------------------------------------------------------------*/