
//
//			HSP3 script generator
//			onion software/onitama 2008/5
//
#include <stdio.h>
#include <string.h>

#include "supio.h"
#include "chsp3cpp.h"

/*------------------------------------------------------------*/

void CHsp3Cpp::MakeCPPVarName( char *outbuf, int varid )
{
	//		変数名をoutbufにコピーする
	//
	int i;
	unsigned char *mm;
	char *sptr;

	if ( mem_di_val == NULL ) {						// 変数名情報がない場合
		sprintf( outbuf, "%s%d", CPPHED_HSPVAR, varid );
		return;
	}

	mm = mem_di_val + ( varid * 6 );
	i = (mm[3]<<16)+(mm[2]<<8)+mm[1];
	sprintf( outbuf, "%s%s", CPPHED_HSPVAR,  GetDS( i ) );

	while(1) {
		sptr = strstr2( outbuf, "@" );
		if ( sptr == NULL ) break;
		*sptr = 'M';
	}
}


int CHsp3Cpp::MakeImmidiateCPPName( char *mes, int type, int val, char *opt )
{
	//		直値(int,double,str)を追加
	//		(追加できない型の場合は-1を返す)
	//
	int i;
	i = MakeImmidiateName( mes, type, val );
	if ( i == 0 ) return 0;
	switch( type ) {
	case TYPE_VAR:
		MakeCPPVarName( mes, val );
		//sprintf( mes, "%s%s", CPPHED_HSPVAR, GetHSPVarName(val) );
		if ( opt != NULL ) strcat( mes, opt );
		break;
	case TYPE_STRUCT:
		{
		STRUCTPRM *prm;
		prm = GetMInfo( val );
		switch( prm->mptype ) {
		case MPTYPE_LOCALVAR:
			sprintf( mes, "LocalPrm(%d)", prmcnv_locvar[val - curprmindex] );
			break;
		default:
			sprintf( mes, "FuncPrm(%d)", val - curprmindex + curprmlocal );
			break;
		}
		break;
		}
	case TYPE_LABEL:
		sprintf( mes, "*L%04d", val );
		break;
	default:
		strcpy( mes, GetHSPName( type, val ) );
		if ( opt != NULL ) strcat( mes, opt );
		if ( *mes == 0 ) return -1;
		break;
	}
	return 0;
}


void CHsp3Cpp::MakeCPPTask( char *funcdef, int nexttask )
{
	//		タスクの区切り
	//			funcdef=新しい関数定義
	//			nextttask=次のタスク(ラベルID)
	//
	if ( tasknum ) {
		if ( nexttask >= 0 ) {
			OutLine( "TaskSwitch(%d);\r\n", nexttask );
		}
		OutMes( "}\r\n\r\n" );
	}
	OutMes( "%s {\r\n", funcdef );
	tasknum++;
}


void CHsp3Cpp::MakeCPPTask( int nexttask )
{
	//		単純タスクの生成
	//
	char mes[256];
	sprintf( mes,"static void L%04d( void )", nexttask );
	MakeCPPTask( mes, nexttask );
}


void CHsp3Cpp::MakeCPPTask2( int nexttask, int newtask )
{
	//		単純タスクの生成
	//
	char mes[256];
	sprintf( mes,"static void L%04d( void )", newtask );
	MakeCPPTask( mes, nexttask );
}


void CHsp3Cpp::MakeCPPProgramInfoFuncParam( int structid )
{
	//		定義命令パラメーター生成
	//		structid : パラメーターID
	//
	STRUCTDAT *fnc;
	STRUCTPRM *prm;
	int i,max,locnum;
	fnc = GetFInfo( structid );
	prm = GetMInfo( fnc->prmindex );
	max = fnc->prmmax;
	curprmindex = fnc->prmindex;
	locnum = 0;

	for(i=0;i<max;i++) {
		prmcnv_locvar[i] = -1;
		switch( prm->mptype ) {
		case MPTYPE_VAR:
			//out->PutStr( "var" );
			break;
		case MPTYPE_STRING:
		case MPTYPE_LOCALSTRING:
			//out->PutStr( "str" );
			break;
		case MPTYPE_DNUM:
			//out->PutStr( "double" );
			break;
		case MPTYPE_INUM:
			//out->PutStr( "int" );
			break;
		case MPTYPE_LABEL:
			//out->PutStr( "label" );
			break;
		case MPTYPE_LOCALVAR:
			//out->PutStr( "local" );
			prmcnv_locvar[i] = locnum;
			locnum++;
			break;
		case MPTYPE_ARRAYVAR:
			//out->PutStr( "array" );
			break;
		case MPTYPE_SINGLEVAR:
			//out->PutStr( "var" );
			break;
		default:
			break;
		}
		prm++;
	}

	fnc->size = locnum;		// size項目にローカル変数の数を入れておく(runtimeで必要)
	curprmlocal = locnum;
}


void CHsp3Cpp::MakeCPPLabel( void )
{
	//		ラベルを生成
	//
	int otmax;
	int labindex;
	int myot;

	otmax = GetOTCount();
	if ( otmax == 0 ) return;
	myot = (int)(mcs_last - mcs_start);

	labindex = 0;
	while(1) {
		if ( labindex>=otmax ) break;
		if ( myot == GetOT( labindex ) ) {
			if ( GetOTInfo( labindex ) == -1 ) {
				MakeCPPTask( labindex );
			} else {
				MakeCPPTask( labindex );
				OutMes( "\t// " );
				MakeProgramInfoFuncParam( GetOTInfo( labindex ) );
				MakeCPPProgramInfoFuncParam( GetOTInfo( labindex ) );
			}
		}
		labindex++;
	}
}


int CHsp3Cpp::GetCPPExpressionSub( CMemBuf *eout )
{
	//		C/C++の計算式フォーマットでパラメーターを展開する(単項目)
	//		eout : 出力先
	//		ret  : vflag(変数項目の場合は1)
	//
	char mes[8192];								// 展開される式の最大文字数
	int op;
	int vflag;

	*mes = 0;
	vflag = 0;
	switch(cstype) {
		case TYPE_MARK:
			//		記号(スタックから取り出して演算)
			//
			op = csval;
			sprintf( mes,"Calc%s(); ", GetHSPOperator2(op) );
			eout->PutStr( mes );
			getCS();
			break;
		case TYPE_VAR:
			{
			//		変数をスタックに積む
			//
			CMemBuf arname;
			int va;
			char varname[256];
			MakeImmidiateCPPName( varname, cstype, csval );
			getCS();
			//		配列要素を付加する
			va = MakeCPPVarExpression( &arname );
			eout->PutStr( arname.GetBuffer() );
			sprintf( mes,"PushVar(%s,%d); ", varname, va );
			eout->PutStr( mes );
			vflag = 1;
			break;
			}
		case TYPE_DNUM:
			{
			//		直実数値をスタックに積む
			//
			sprintf( mes,"Push%s(%f); ", GetHSPCmdTypeName(cstype), GetDSf(csval) );
			eout->PutStr( mes );
			getCS();
			break;
			}
		case TYPE_INUM:
		case TYPE_LABEL:
			//		直値をスタックに積む
			//
			sprintf( mes,"Push%s(%d); ", GetHSPCmdTypeName(cstype), csval );
			eout->PutStr( mes );
			getCS();
			break;
		case TYPE_STRUCT:
			{
			//		パラメーターをスタックに積む
			//
			CMemBuf arname;
			int prmid;
			int va;
			STRUCTPRM *prm;
			prm = GetMInfo( csval );
			switch( prm->mptype ) {
			case MPTYPE_LOCALVAR:
				prmid = prmcnv_locvar[csval - curprmindex];
				getCS();
				va = MakeCPPVarExpression( &arname );
				eout->PutStr( arname.GetBuffer() );
				sprintf( mes,"PushFuncPrm(%d,%d); ", prmid, va );
				vflag = 1;
				break;
			case MPTYPE_VAR:
			case MPTYPE_ARRAYVAR:
			case MPTYPE_SINGLEVAR:
				prmid = csval - curprmindex + curprmlocal;
				getCS();
				va = MakeCPPVarExpression( &arname );
				eout->PutStr( arname.GetBuffer() );
				sprintf( mes,"PushFuncPrm(%d,%d); ", prmid, va );
				vflag = 1;
				break;
			case MPTYPE_DNUM:
				prmid = csval - curprmindex + curprmlocal;
				getCS();
				sprintf( mes,"PushFuncPrmD(%d); ", prmid );
				break;
			case MPTYPE_INUM:
				prmid = csval - curprmindex + curprmlocal;
				getCS();
				sprintf( mes,"PushFuncPrmI(%d); ", prmid );
				break;

			default:
				prmid = csval - curprmindex + curprmlocal;
				getCS();
				sprintf( mes,"PushFuncPrm(%d); ", prmid );
				break;
			}
			eout->PutStr( mes );
			break;
			}
		case TYPE_STRING:
			//		文字列をスタックに積む
			//
			sprintf( mes,"Push%s(\"%s\"); ", GetHSPCmdTypeName(cstype), GetDS( csval ) );
			eout->PutStr( mes );
			getCS();
			break;
		case TYPE_MODCMD:
			{
			//		モジュール関数呼び出し
			//
			int va;
			int fnctype;
			int fncval;
			CMemBuf arname;
			fnctype = cstype;
			fncval = csval;
			getCS();
			//		引数を付加する
			eout->PutStr( "PushFuncEnd(); " );
			va = MakeCPPVarExpression( &arname );
			eout->PutStr( arname.GetBuffer() );
			sprintf( mes, "Push%s(%d,%d); ", GetHSPCmdTypeName(fnctype), fncval, va );
			eout->PutStr( mes );
			break;
			}
		default:
			{
			//		関数として展開する
			//
			int va;
			int fnctype;
			int fncval;
			CMemBuf arname;
			fnctype = cstype;
			fncval = csval;
			getCS();
			//		引数を付加する
			eout->PutStr( "PushFuncEnd(); " );
			va = MakeCPPVarExpression( &arname );
			eout->PutStr( arname.GetBuffer() );
			sprintf( mes, "Push%s(%d,%d); ", GetHSPCmdTypeName(fnctype), fncval, va );
			eout->PutStr( mes );
			break;
			}
	}
	return vflag;
}


int CHsp3Cpp::GetCPPExpression( CMemBuf *eout, int *result )
{
	//		C/C++の計算式フォーマットでパラメーターを展開する
	//		eout : 出力先
	//		result : 結果の格納先(-2=解析なし/-1=複数項の計算式/other=単一のパラメーターtype)
	//
	int res;
	int tres;

	*result = -2;

	if (exflag&EXFLG_1) return 1;				// パラメーター終端
	if (exflag&EXFLG_2) {						// パラメーター区切り(デフォルト時)
		exflag^=EXFLG_2;
		return -1;
	}
	if ( cstype == TYPE_MARK ) {
		if ( csval == 63 ) {					// パラメーター省略時('?')
			getCS();
			exflag&=~EXFLG_2;
			return -1;
		}
		if ( csval == ')' ) {					// 関数内のパラメーター省略時
			exflag&=~EXFLG_2;
			return 2;
		}
	}

	res = 0;
	tres = cstype;

	while(1) {
		if ( mcs > mcs_end ) {
			res = 1;			// データ終端チェック
			break;
		}
		if ( tres >= 0 ) {
			if ( tres != cstype ) { tres = -1; }
		}

		switch(cstype) {
		case TYPE_MARK:
			//		記号(スタックから取り出して演算)
			//
			if ( csval == ')' ) {					// 引数の終了マーク
				exflag |= EXFLG_2;
				res = 2;
				break;
			}
		default:
			if ( GetCPPExpressionSub( eout ) == 0 ) { tres = -1; }
			break;
		}

		if ( exflag ) {								// パラメーター終端チェック
			exflag&=~EXFLG_2;
			break;
		}
	}
	*result = tres;
	return res;
}


int CHsp3Cpp::MakeCPPParam( int addprm )
{
	//		パラメーターのトレース
	//
	int i;
	int prm;
	int len;
	int result;
	int curidx;
	CMemBuf tmpbuf;
	char *p;

	prm = 0;
	tmpbuf.AddIndexBuffer();

	int j;
	for(j=0;j<addprm;j++) {
		if ( exflag & EXFLG_1) break;		// パラメーター列終端
		if ( mcs > mcs_end ) break;			// データ終端チェック
		if ( prm ) {
			tmpbuf.Put(0);
		}
		tmpbuf.RegistIndex( tmpbuf.GetSize() );
		GetCPPExpressionSub( &tmpbuf );
		prm++;
	}

	while(1) {
		if ( exflag & EXFLG_1) break;		// パラメーター列終端
		if ( mcs > mcs_end ) break;			// データ終端チェック
		if ( prm ) {
			tmpbuf.Put(0);
		}
		curidx = tmpbuf.GetIndexBufferSize();
		tmpbuf.RegistIndex( tmpbuf.GetSize() );
		i = GetCPPExpression( &tmpbuf, &result );
		if ( i > 0 ) break;
		if ( i < -1 ) return i;
		if ( i == -1 ) {
			tmpbuf.PutStr( "PushDefault();" );
		}
		switch( result ) {
		case TYPE_VAR:
			p = tmpbuf.GetBuffer() + tmpbuf.GetIndex( curidx );
			p = strstr2( p, "PushVar" );
			p[5] = 'A'; p[6] = 'P';			// PushVar -> PushVAPに直す
			break;
		case TYPE_STRUCT:
			p = tmpbuf.GetBuffer() + tmpbuf.GetIndex( curidx );
			p = strstr2( p, "PushFuncPrm" );
			p[9] = 'A'; p[10] = 'P';		// PushFuncPrm -> PushFuncPAPに直す
			break;
		default:
			break;
		}
		prm++;
	}

	//		パラメーターを逆順で登録する
	//		(stackをpopして正常な順番になるように)
	//
	i=tmpbuf.GetIndexBufferSize();
	while(1) {
		if ( i == 0 ) break;
		i--;
		p = tmpbuf.GetBuffer() + tmpbuf.GetIndex(i);
		len = (int)strlen( p );
		if ( len ) {
			int a1;
			char lnbuf[4096];
			strsp_ini();
			while(1) {
				a1 = strsp_get( p, lnbuf, 0, 4090 );
				OutLine( "%s\r\n", lnbuf );
				if ( a1 == 0 ) break;
			}
		}
	}

	return prm;
}


int CHsp3Cpp::MakeCPPVarForHSP( void )
{
	//		コメント用にHSP形式の代入を作成
	//		(同時に代入の種類を識別して返す)
	//		(retval:-1=通常代入、-2,-3=++or--、その他=演算子)
	//
	int i;
	int op;
	char arbuf[VAREXP_BUFFER_MAX];
	i = GetHSPVarExpression( arbuf );
	if ( i ) { out->PutStr( arbuf ); }
	if ( cstype == TYPE_MARK ) {
		if ( csval == CALCCODE_EQ ) {
			out->PutStr( "=" );
			getCS();
			MakeProgramInfoParam2();
			return -1;
		}
		op = csval;
		getCS();
		if ( exflag & EXFLG_1) {		// ++ or --
			out->PutStr( GetHSPOperator(op) );
			out->PutStr( GetHSPOperator(op) );
			MakeProgramInfoParam2();
			if ( op == CALCCODE_ADD ) return -2;
			return -3;
		}
		out->PutStr( GetHSPOperator(op) );
		out->PutStr( "=" );
		//getCS();
		MakeProgramInfoParam2();
		return op;
	}
	Alert( "CHsp3:Var Syntax unknown." );
	return -4;
}


int CHsp3Cpp::MakeCPPVarExpression( CMemBuf *arname )
{
	//	変数名直後に続くパラメーター(配列)を展開する
	//	arname : 配列設定展開用のバッファ
	//	ret : 0=配列なし/1〜=配列あり
	//
	int i;
	int prm;
	int len;
	int result;
	int curidx;
	CMemBuf tmpbuf;
	char *p;
	tmpbuf.AddIndexBuffer();

	if ( cstype == TYPE_MARK ) {
		if ( csval == '(' ) {
			getCS();
			prm = 1;
			while(1) {
				if ( exflag & EXFLG_1) break;		// パラメーター列終端
				if ( mcs > mcs_end ) break;			// データ終端チェック
				if ( prm > 1 ) {
					tmpbuf.Put(0);
				}
				curidx = tmpbuf.GetIndexBufferSize();
				tmpbuf.RegistIndex( tmpbuf.GetSize() );
				i = GetCPPExpression( &tmpbuf, &result );
				if ( i > 0 ) break;
				if ( i < -1 ) return i;
				if ( i == -1 ) {
					tmpbuf.PutStr( "PushDefault();" );
				}
				//if ( result == TYPE_VAR ) {			// 単一項で変数が指定されていた場合
				//	p = tmpbuf.GetBuffer() + tmpbuf.GetIndex( curidx );
				//	p[5] = 'A'; p[6] = 'P';			// PushVar -> PushVAPに直す
				//}
				prm++;
			}
			getCS();

			//		パラメーターを逆順で登録する
			//		(stackをpopして正常な順番になるように)
			//
			i=tmpbuf.GetIndexBufferSize();
			while(1) {
				if ( i == 0 ) break;
				i--;
				p = tmpbuf.GetBuffer() + tmpbuf.GetIndex(i);
				len = (int)strlen( p );
				if ( len ) {
					OutLineBuf( arname, "%s\r\n", p );
				}
			}
			return prm;
		}
	}
	return 0;
}


/*------------------------------------------------------------*/

void CHsp3Cpp::MakeCPPSubModCmd( int cmdtype, int cmdval )
{
	//		定義命令とパラメーターを展開
	//
	int pnum;					// パラメータースタック数
	MCSCONTEXT ctxbak;

	OutLine( "// %s ", GetHSPName( cmdtype, cmdval ) );
	getCS();
	GetContext( &ctxbak );
	MakeProgramInfoParam2();
	SetContext( &ctxbak );

	pnum = MakeCPPParam();
	OutLine( "PushLabel(%d);\r\n", curot );
	OutLine( "%s(%d,%d);\r\n", GetHSPCmdTypeName(cmdtype), cmdval, pnum );
}


void CHsp3Cpp::MakeCPPSub( int cmdtype, int cmdval )
{
	//		通常命令とパラメーターを展開
	//
	int pnum;
	MCSCONTEXT ctxbak;

	OutLine( "// %s ", GetHSPName( cmdtype, cmdval ) );
	getCS();
	GetContext( &ctxbak );
	MakeProgramInfoParam2();
	SetContext( &ctxbak );
	pnum = MakeCPPParam();
	OutLine( "%s(%d,%d);\r\n", GetHSPCmdTypeName(cmdtype), cmdval, pnum );
}


int CHsp3Cpp::MakeCPPMain( void )
{
	//		プログラムのトレース
	//
	int i;
	int op;
	int cmdtype, cmdval;
	char mes[4096];
	MCSCONTEXT ctxbak;
	int maxvar;

	//		初期化
	//
	tasknum = 0;
	MakeCPPTask( "void __HspEntry( void )" );

	OutMes( "\t// Var initalize\r\n" );
	maxvar = hsphed->max_val;
	for(i=0;i<maxvar;i++) {
		MakeCPPVarName( mes, i );
		OutMes( "\t%s = &mem_var[%d];\r\n", mes, i );
	}
	OutMes( "\r\n" );

	//		コードの変換
	//
	while(1) {
		if ( mcs > mcs_end ) break;

		//		endifのチェック
		//
		if ( ifmode[iflevel]>=2 ) {		// if end
			if ( mcs_last>=ifptr[iflevel] ) {
				ifmode[iflevel] = 0;
				if ( iflevel == 0 ) { Alert( "Invalid endif." ); return -1; }
				i = iftaskid[iflevel];
				iflevel--;
				//SetIndent( iflevel );
				//OutLine( "}\n" );
				MakeCPPTask( i );
				continue;
			}
		}

		//		ラベルチェック
		//
		MakeCPPLabel();

		//		行頭のコード
		//
		cmdtype = cstype;
		cmdval = csval;
		//MakeProgramInfoHSPName();
		//printf( "#%06x:CSTYPE%d VAL%d\n", mcs_last - mcs_start, cstype, csval );
		//Alert( mes );
		//out->PutStr( mes );

		//		パラメーター
		//
		switch( cmdtype ) {
		case TYPE_STRUCT:						// 代替変数(struct)
		case TYPE_VAR:							// 変数代入
			{
			CMemBuf arname;
			int va,pnum;
			MakeImmidiateHSPName( mes, cmdtype, cmdval );
			OutLine( "// %s ", mes );
			getCS();
			GetContext( &ctxbak );
			op = MakeCPPVarForHSP();
			SetContext( &ctxbak );
			MakeImmidiateCPPName( mes, cmdtype, cmdval );
			va = MakeCPPVarExpression( &arname );
			getCS();

			switch( op ) {
			case -1:		// 通常の代入
				pnum = MakeCPPParam();
				OutMes( arname.GetBuffer() );
				if ( pnum <= 1 ) {
					OutLine( "VarSet(%s,%d);\r\n", mes, va );
				} else {
					OutLine( "VarSet(%s,%d,%d);\r\n", mes, va, pnum );
				}
				break;
			case -2:		// ++
				OutMes( arname.GetBuffer() );
				OutLine( "VarInc(%s,%d);\r\n", mes, va );
				break;
			case -3:		// --
				OutMes( arname.GetBuffer() );
				OutLine( "VarDec(%s,%d);\r\n", mes, va );
				break;
			case -4:		// エラー
				break;
			default:		// 演算子付き代入
				pnum = MakeCPPParam();
				if ( pnum > 1 ) {
					Alert( "Too much parameters(VarCalc)." );
				}
				OutMes( arname.GetBuffer() );
				OutLine( "VarCalc(%s,%d,%d);\r\n", mes, va, op );
				break;
			}
			break;
			}
		case TYPE_CMPCMD:						// 比較命令
			//	HSPソースコメント
			if ( cmdval == 0 ) {
				GetContext( &ctxbak );
				OutLine( "// if " );
				mcs++;
				getCS();
				MakeProgramInfoParam2();
				SetContext( &ctxbak );
			}
			// C形式の出力
			if ( cmdval == 0 ) {
				iflevel++;
				sprintf( mes, "if (HspIf()) { TaskSwitch(%d); return; }\r\n", curot );
				if ( iflevel >= MAX_IFLEVEL ) {
					Alert( "Stack(If) overflow." );
					return -2;
				}
				ifmode[iflevel] = 1;
				iftaskid[iflevel] = curot;
				i = (int)*mcs;
				ifptr[iflevel] = mcs + i + 1;
				ifmode[iflevel]++;
				curot++;
			} else {
				strcpy( mes, "// else\r\n" );
				ifmode[iflevel] = 3;
				i = (int)*mcs;
				ifptr[iflevel] = mcs + i + 1;
				//SetIndent( iflevel-1 );
				i = iftaskid[iflevel];
				MakeCPPTask2( curot, i );
				iftaskid[iflevel] = curot;
				curot++;
			}
			mcs++;
			getCS();
			MakeCPPParam();
			OutLine( mes );
			//SetIndent( iflevel );
			break;
		case TYPE_PROGCMD:						// プログラム制御命令
			switch( cmdval ) {
			case 0x00:								// goto
			case 0x02:								// return
			case 0x03:								// break
			case 0x05:								// loop
			case 0x06:								// continue
			case 0x0b:								// foreach
			case 0x0c:								// (hidden)foreach check
			case 0x10:								// end
			case 0x1b:								// assert
			case 0x11:								// stop
			case 0x19:								// on
				//		後にreturnを付ける
				//
				MakeCPPSub( cmdtype, cmdval );
				OutLine( "return;\r\n" );
				break;
			case 0x01:								// gosub
			case 0x18:								// exgoto
				//		gosubの展開
				//
				{
				int pnum;
				OutLine( "// %s\r\n", GetHSPName(cmdtype,cmdval) );
				getCS();
				pnum = MakeCPPParam();
				OutLine( "PushLabel(%d); %s(%d,%d); return;\r\n", curot, GetHSPCmdTypeName(cmdtype), cmdval, pnum+1 );
				MakeCPPTask2( -1, curot );
				curot++;
				break;
				}
			case 0x04:								// repeat
				//		repeatの展開
				//
				{
				int pnum;
				OutLine( "// repeat\r\n" );
				getCS();
				pnum = MakeCPPParam(1);
				OutLine( "PushLabel(%d); %s(%d,%d); return;\r\n", curot, GetHSPCmdTypeName(cmdtype), cmdval, pnum+1 );
				MakeCPPTask( curot );
				curot++;
				break;
				}

			case 0x07:								// wait
			case 0x08:								// await
			case 0x17:								// run
				//		タスクを区切る
				//
				MakeCPPSub( cmdtype, cmdval );
				MakeCPPTask( curot );
				curot++;
				break;
			default:
				MakeCPPSub( cmdtype, cmdval );
				break;
			}
			break;
		case TYPE_MODCMD:							// 定義命令
			MakeCPPSubModCmd( cmdtype, cmdval );
			OutLine( "return;\r\n" );
			MakeCPPTask2( -1, curot );
			curot++;
			break;
		default:
			//		通常命令
			//
			MakeCPPSub( cmdtype, cmdval );
			break;
		}
	}

	OutMes( "}\r\n\r\n" );
	OutMes( "//-End of Source-------------------------------------------\r\n" );
	return 0;
}

/*------------------------------------------------------------*/


int CHsp3Cpp::MakeSource( int option, void *ref )
{
	//		C/C++ソースを出力する
	//
	int i;
	int otmax;
	int labindex;
	int maxvar;
	char mes[4096];
	makeoption = option;

	OutMes( "//\r\n//\thsp3cnv generated source\r\n//\t[%s]\r\n//\r\n", orgname );
	OutMes( "#include \"hsp3r.h\"\r\n" );
	OutMes( "\r\n#define _HSP3CNV_DATE %s\n#define _HSP3CNV_TIME %s\r\n", localinfo.CurrentDate(), localinfo.CurrentTime() );
	OutMes( "#define _HSP3CNV_MAXVAR %d\r\n", hsphed->max_val );
	OutMes( "#define _HSP3CNV_MAXHPI %d\r\n", hsphed->max_hpi );
	OutMes( "#define _HSP3CNV_VERSION 0x%x\r\n", hsphed->version );
	OutMes( "#define _HSP3CNV_BOOTOPT %d\r\n", hsphed->bootoption );
	OutMes( "\r\n/*-----------------------------------------------------------*/\r\n\r\n" );

	maxvar = hsphed->max_val;
	for(i=0;i<maxvar;i++) {
		MakeCPPVarName( mes, i );
		OutMes( "static PVal *%s;\r\n", mes );
	}

	OutMes( "\r\n/*-----------------------------------------------------------*/\r\n\r\n" );

	otmax = GetOTCount();
	curot = otmax;

	i = MakeCPPMain();
	if ( i ) return i;

	//		タスク(ラベル)テーブルを作成する
	//
	OutMes( "\r\nCHSP3_TASK __HspTaskFunc[]={\r\n" );

	labindex = 0;
	while(1) {
		if ( labindex>=otmax ) break;
		if ( GetOTInfo( labindex ) == -1 ) {
			OutMes( "(CHSP3_TASK) L%04d,\r\n", labindex );
		} else {
		STRUCTDAT *fnc;
			fnc = GetFInfo( GetOTInfo( labindex ) );
			switch( fnc->index ) {
			case STRUCTDAT_INDEX_FUNC:					// 定義命令
			case STRUCTDAT_INDEX_CFUNC:					// 定義関数
				OutMes( "(CHSP3_TASK) L%04d,\t// %s\r\n", labindex,  GetDS(fnc->nameidx) );
				break;
			default:
				OutMes( "(CHSP3_TASK) 0,\r\n" );
				break;
			}

		}
		labindex++;
	}
	while(1) {
		if ( labindex>=curot ) break;
		OutMes( "(CHSP3_TASK) L%04d,\r\n", labindex );
		labindex++;
	}
	OutMes( "\r\n};\r\n" );

	OutMes( "\r\n/*-----------------------------------------------------------*/\r\n\r\n" );

	//		モジュール(関数)テーブルを作成する
	//
	int stmax;
	STRUCTDAT *st;
	CMemBuf fncname;

	stmax = GetFInfoCount();
	if ( stmax ) {
		OutMes( "STRUCTDAT __HspFuncInfo[]={\r\n" );

		for(i=0;i<stmax;i++) {
			st = GetFInfo( i );
			sprintf( mes, "\t\"%s\",\r\n", GetDS(st->nameidx) );
			fncname.PutData( mes, strlen(mes) );
			OutMes( "\t{ %d,%d, %d,%d,%d,%d,%d, (void *)%d },\r\n",
				st->index, st->subid, st->prmindex, st->prmmax, st->nameidx, st->size, st->otindex, st->funcflag );
		}
		fncname.Put( (int)0 );

		OutMes( "};\r\n\r\n" );

		OutMes( "char *__HspFuncName[]={\r\n%s};\r\n\r\n", fncname.GetBuffer() );
	}

	OutMes( "\r\n/*-----------------------------------------------------------*/\r\n\r\n" );

	//		初期化ファンクションを作成する
	//
	OutMes( "void __HspInit( Hsp3r *hsp3 ) {\r\n" );
	OutMes( "\thsp3->Reset( _HSP3CNV_MAXVAR, _HSP3CNV_MAXHPI );\r\n" );
	if ( stmax ) {
		OutMes( "\thsp3->SetFInfo( __HspFuncInfo, %d );\r\n", stmax * sizeof(STRUCTDAT) );
	} else {
		OutMes( "\thsp3->SetFInfo( 0, 0 );\r\n" );
	}
	OutMes( "}\r\n" );

	OutMes( "\r\n/*-----------------------------------------------------------*/\r\n\r\n" );

	return 0;
}
