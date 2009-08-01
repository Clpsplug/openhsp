;
;	HSP help manager用 HELPソースファイル
;	(先頭が「;」の行はコメントとして処理されます)
;

%type
拡張命令
%ver
3.2
%note
llmod3.hspをインクルードする。必要に応じてlistview.hsp,progbox.hsp,trackbox.hsp,treebox.hsp,udbtn.hspをインクルードする

%date
2009/08/01
%author
tom
%dll
llmod3
%url
http://www5b.biglobe.ne.jp/~diamond/hsp/hsp2file.htm



%index
listview
リストビューの作成
%group
オブジェクト制御命令
%prm
n1,n2,n3
n1 : 幅
n2 : 高さ
n3 : スタイル

%inst
リストビューを作成します。
リストビューは、Explorerの右側にある様なオブジェクトです。
この命令を呼び出した後、statにリストビューのIDが代入されます。
^p
スタイル
スタイルは以下の値を足して、複数のスタイルを指定することができます。
0           大きいアイコン表示
1           詳細表示
2           小さいアイコン表示
3           リスト表示
4           複数選択できないようにする
8           listviewが選択されていないときでも、選択されているアイテムの色を変える
$10         昇順でアイテムをソートする
$20         降順でアイテムをソートする
$40         セットしたイメージリストをlistview消去時に消去しない(複数のlistviewで同じイメージを使う場合に指定する)
$80         アイコン表示のとき、アイテムのテキストを折り返さない(デフォルトではテキストは長いと折り返される)
$100        ?
$800        ?
$2000       スクロールバーがつかない
$4000       欄の名前を表示する部分を付けない
^
以下のスタイルはcomctl32.dllのバージョンによっては有効にならない場合があります。
$10000      リスト表示時に罫線を付ける
$40000      チェックボックスを付ける
$100000     欄の名前を表示する所をドラッグ&ドロップできる
$200000     リスト表示時にアイテムが選択されたときサブアイテムも色を変える
$400000     アイテムの上にマウスポインタが来たときカーソルを指の形にする
$800000     アイテムクリックされたときカーソルを指の形にする
$1000000    スクロールバーを平らなスタイルに変える
$8000000    $400000,$800000のスタイルを指定したとき、アイテムの上にマウスポインタが来ると下線がつく
$10000000   $400000,$800000のスタイルを指定したとき、下線がつく
^p
^
※チェックボックスを付けたときのスタイルで、アイテムがチェックされているかを調べるときは以下のようにしてください
^
	;list_id : listviewのID
	;idx : アイテムのインデックス
	prm=list_id,4140,idx,61440
	sendmsg prm
	chk=stat>>12-1
	if chk : dialog ""+idx+"番目のアイテムはチェックされています"
^
チェックをはずしたり、つけたりしたいときは以下のようにします。
^
	dim lvi,9
	idx = 0			;idx番目のアイテム
	if uncheck != 0 {
		lvi = 8,0,0,1<<12,$f000
	} else {
		lvi = 8,0,0,2<<12,$f000
	}
	prm = list_id,4139,idx : getptr prm.3,lvi : sendmsg prm
^
※listviewはHSP標準命令のclsやscreen命令では消去されません。_clsまたは_clrobjを使用してください。

%href
listadd
listdel
listaddcl
listdelcl
listsel
listget
listmax
listicon
listhit
sel_listview




%index
listadd
リストビューにアイテムを追加
%group
オブジェクト制御命令
%prm
n1,"s2",n3,n4,n5,n6
n1 : アイテムの位置
s2 : アイテムのテキスト
n3 : 欄の番号
n4 : アイコン番号
n5 : アイテムの状態
n6 : アイテムに持たせる数値

%inst
リストビューのn1番目の位置にアイテムをつけ加えます。
n3には何番目の欄に追加するかを指定するインデックス、n4にはアイコン番号、n5にはアイテムの状態を入れます。
^
欄への追加は、listaddclで欄を追加しているときのみ有効です。
またアイコン番号は、listiconでアイコンを追加している場合のみ有効になり、欄へ追加するときはアイコン番号は無視されます。
^
n6に値を入れてアイテムにその数値を持たせることができます。
この命令を呼び出した後、statに追加したアイテムのインデックスが代入されます。(-1ならエラー)
^
アイテムの状態
listviewのアイテムの状態には、以下のものがあります。
^p
状態                     数値
フォーカスがあっている   1
選択されている           2
切り取られた状態         4
ハイライト               8
^p
※ハイライトはlistselで選択状態を解除しないと元に戻りません。

%href
listdel
listsel
listaddcl
listdelcl
listview
%sample
listadd 3,"new item",0,15
^
listadd 0,"new sub item",1,0,1




%index
listdel
リストビューのアイテムを消去
%group
オブジェクト制御命令
%prm
n1
n1 : アイテムのインデックス

%inst
n1番目のアイテムを消去します。
n1を-1にすると全てのアイテムを消去します。

%href
listadd
listview




%index
listaddcl
リストビューに欄を追加
%group
オブジェクト制御命令
%prm
n1,"s2",n3,n4
n1 : 欄のインデックス
s2 : 欄の名前
n3 : 欄の幅
n4 : 欄の名前の位置

%inst
欄を追加します。
n3を省略したときのデフォルト値は100です。
^
^p
n4の値
0    左寄せ
1    右寄せ
2    中央

%href
listdelcl
listview




%index
listdelcl
欄を消去
%group
オブジェクト制御命令
%prm
n1
n1 : 欄のインデックス

%inst
n1番目の欄を消去します。

%href
listaddcl
listview




%index
listsel
リストビューのアイテムを選択
%group
オブジェクト制御命令
%prm
n1,n2
n1 : アイテムのインデックス
n2 : 選択状態のタイプ

%inst
n1番目のアイテムを選択します。
n2を-1にすると選択状態を解除します。
n2を省略するとフォーカスをあわせて、選択状態にします。
^
^p
状態                     数値
フォーカスがあっている   1
選択されている           2
切り取られた状態         4
ハイライト               8
^p

%href
listadd
listview




%index
listget
リストビューのアイテムを取得
%group
オブジェクト制御命令
%prm
v1,n2,n3,n4
v1 : 取得したものを入れる変数
n2 : アイテムのインデックス
n3 : 取得するもの
n4 : 取得するアイテムの状態

%inst
主にアイテムのインデックスを取得します。
n3で以下の値を代入すると取得するものが変わってきます。
^
^p
n3の値                               n4の値
1   n2の上のアイテムのindexを取得    0 or 取得するアイテムの状態
2   n2の下のアイテムのindexを取得    0 or 取得するアイテムの状態
3   n2の左のアイテムのindexを取得    0 or 取得するアイテムの状態
4   n2の右のアイテムのindexを取得    0 or 取得するアイテムの状態
5   n2のテキスト取得                 変数のサイズ or -1
6   n2のアイテムに持たせた値を取得   0 or 1
^p
^
n3を5にしたときはstatにアイテムに持たせた値が入ります。
n3を5にしたときn4を-1にすると、v1に入っている文字列を使ってアイテムのテキストを再設定できます。
n3を6にしたときn4を1にすると、v1に入っている値を使ってアイテムに持たせた値を再設定できます。
^
n4を以下の値にするとn4で指定した状態のアイテムを(n2+1)番目のアイテムからn3で指定した方向に向かって検索します。(n3を0にすると方向は指定しません)
n4の状態のアイテムが見つかればv1にアイテムのインデックスが代入されます。
見つからなかった場合はv1に-1が代入されます。
n2を-1にすると先頭のアイテムから検索します。
^
^p
n4の値
0    状態は指定しない
1    フォーカスがあっている
2    選択されている
4    切り取られた状態
8    ハイライト
^p

%href
listadd
listview

%sample
	#include "llmod3.hsp"
	#include "listview.hsp"
	listview winx-6,winy/2,1
	lv=stat
	listaddcl 0,"name"
	repeat 30 : listadd cnt,"アイテム No."+cnt : loop
	button "check",*check
	alloc bf,1024*32 : bf=""
	mesbox bf,winx-6,winy-csry-26
	_objsel lv
	stop
*check
	bf="" : notesel bf : start=-1	;先頭から検索
	repeat -1
		listget chk,start,0,2	;選択状態のアイテムを探す
		if chk=-1 : break	;見つからない場合-1が代入される
		listget s,chk,5		;見つかったアイテムのテキストを取得
		noteadd s+"は選択されています"
		start=chk
	loop
	objprm 1,bf
	stop




%index
listicon
リストビューのアイコンを設定
%group
オブジェクト制御命令
%prm
v1,n2,n3
v1 : アイコンが入った数値変数(get_iconで取得したもの)
n2 : アイコンの数
n3 : セットするアイコンの大小
%inst
リストビューのアイテムのアイコンを設定します。
アイコンをセットするには、imgモジュールが必要です。
^
※必ず、listview.hspより先にimg.hspをインクルードしてください。
^
n3を0にすると大きいアイコンを表示するときのアイコンをセットし、n3を1にすると小さいアイコンを表示するときのアイコンをセットします。
^
この命令を呼び出した後、のstatにセットしたアイコンについての情報が入った特別な値が代入されます。(イメージリストと呼ばれるものです。)
^
listviewはtreeboxと違って、_clrobjなどでlistviewが消去されると、アイコンをセットして消費したメモリを自動的に開放するので、
	destroy_imglist 'listicon実行後にstatに代入された値'
を実行する必要はありません。
ただし、listviewのスタイルに'セットしたイメージリストをlistview消去時に消去しない'を指定している場合は、メモリは自動的に開放されません。このときは、
	destroy_imglist 'listicon実行後にstatに代入された値'
を実行してください。

%href
listadd
listview

%sample
	#include "llmod3.hsp"
	#include "img.hsp"	;listiconを使う時は必要(listview.hspより前に)
	#include "listview.hsp"
	;まずリストビューを作成
	listview 300,200,1|2|4|$20
^
	;shell32.dllの3番目と4番目のアイコン(小さい方)を使う
	;(*get_iconについてはimg.hspの説明を読んでください。)
	filename="shell32.dll"
	get_icon icons.0,filename,3,1
	get_icon icons.1,filename,4,1
^
	listicon icons,2
	img_id=stat	;セットしたアイコンについての情報が入った特別な値
^
	;アイテムを追加
	;0行目の0番目の欄にアイコン番号1のアイコンを付けたアイテムを追加
	listadd 0,"folder 1",0,1
	itm1=stat




%index
listmax
リストビューのアイテムの数を取得
%group
オブジェクト制御命令
%prm
v1,n2
v1 : リストビュー内のアイテムの数を入れる数値変数
n2 : フラグ

%inst
リストビュー内のアイテムの数を取得します。
n2を1にするとリストビュー内に完全に見えているアイテムの数を取得します。

%href
listview




%index
listhit
マウスの下にあるアイテムを取得
%group
オブジェクト制御命令
%inst
マウスの下にあるアイテムのインデックスを取得します。
^
statにマウスの下にあるアイテムのインデックスが代入されます。
マウスの下にアイテムが無ければ-1が代入されます。

%href
listadd
listview




%index
sel_listview
操作するリストビューを選択
%group
オブジェクト制御命令
%prm
n1
n1 : リストビューのID

%inst
この命令使用後はn1で指定したリストビューに対して各操作を行います。
リストビュー新規に作成すると、自動的にそのリストビューが各操作の対象になります。
複数のリストビューを作成したときは、この命令で操作するリストビューを選択してください。

%href
listview


%index
progbox
プログレスボックスの作成
%group
拡張入出力制御命令
%prm
n1,n2,n3
n1 : 幅
n2 : 高さ
n3 : スタイル

%inst
プログレスボックスを作成します。
プログレスボックスは、進捗状況を表示するのに便利です。
^
スタイル(comctl32.dllのバージョンが4.70以上でなければ無効です)
^p
n4の値
1    進み方がスムーズになります。
4    垂直に目盛りが進みます。
^p
この命令を呼び出した後、statにプログレスボックスのIDが代入されます。
^
※progboxはHSP標準命令のclsやscreen命令では消去されません。_clsまたは_clrobjを使用してください。

%href
progbox
progrng
progset
sel_progbox




%index
sel_progbox
操作するプログレスボックスを選択
%group
オブジェクト制御命令
%prm
n1
n1 : プログレスボックスのID
%inst
この命令使用後はn1で指定したプログレスボックスに対して各操作を行います。
プログレスボックス新規に作成すると、自動的にそのプログレスボックスが各操作の対象になります。
複数のプログレスボックスを作成したときは、この命令で操作するプログレスボックスを選択してください。

%href
progbox



%index
progrng
プログレスボックスの範囲を設定
%group
オブジェクト制御命令
%prm
n1,n2,n3
n1 : 最小値
n2 : 最大値
n3 : 最大値の拡張フラグ

%inst
プログレスボックスの範囲の設定をします。
設定できる値は、最小値が0以上、最大値は65535以下です。
n3に1を代入すると最大値が$ffffffffまでになります。ただしこの設定はcomctl32.dllのバージョンが4.70以上でなければ無効です。
^
この命令を呼び出した後のstatの値
以前セットしていた範囲 [ 最小値 | (最大値<<16)]の形式 (n3=0のときのみ)

%href
progbox



%index
progset
プログレスボックスの各設定
%group
オブジェクト制御命令
%prm
n1,n2
n1 : セットする値
n2 : セットするタイプ

%inst
プログレスボックスの各設定を行います。
セットするタイプは以下の通りです。
^p
目的                 n1の値          n2の値   progset実行後のstatの値
進ませる             0               0        進ませる前の位置
進ませる量のセット   進ませる量      0        以前セットした進ませる量
位置をセット         セットする位置  1        セットする前の位置
特定の量を増加させる 増加させる量    2        増加させる前の位置
^
(以下のものはcomctl32.dllのバージョンが4.70以上でなければ無効です)
目盛りの色           色              3        セットする前の色
目盛りの後ろの色     色              4        セットする前の色
(色は   r|(g<<8)|(g<<16)   の形式)
(値が 0 になっている所は省略できる)
^p
statの値が'セットする前の色'となっている所は、セットする前の色がシステムのデフォルトの色だった場合 -16777216($ff000000)がstatに代入されます。また、色をセットするときに$ff000000を使うとシステムのデフォルトの色に設定できます。

%href
progrng
progbox
%sample
	progbox 300,20		;幅300,高さ20のプログレスボックスを作る
	progrng 0,200		;範囲は0から200
^
*lp
	progset			;目盛りを進ませる
		;
		;
	goto lp


%index
trackbox
トラックボックスの作成
%group
命令概要
%prm
n1,n2,n3
n1 : 幅
n2 : 高さ
n3 : スタイル

%inst
トラックボックスを作成します。
トラックボックスとはつまみを持ったオブジェクトです。
決まった選択範囲の中から数値を得たいときなどに使うのに便利です。
^
この命令を呼び出した後、statにトラックボックスのIDが代入されます。
^
trackboxのスタイル(n4)は以下の値を組み合わせて持つことができます。
例えば、
	n4=2|8|$100	;または n4=2+8+$100
	trackbox 200,70,n4
なら垂直で両側に目盛りが付き、ツールチップを持つスタイルになります。
^p
n4の値
0       水平
1       自動で目盛りを付ける
2       垂直
4       '水平'のとき  目盛りを上側に付ける
        '垂直'のとき  目盛りを左側に付ける
8       目盛りを両側に付ける
$10     目盛りを付けない
$20     つまみの部分に選択領域を付ける
$40     $20 のスタイルのとき、つまみが動いても選択領域を固定したままにする
$80     つまみなし
$100    つまみがクリックされているときツールチップを付ける(このスタイルは
        comctl32.dllのバージョンによっては効果がない場合があります。)
^p
^
※trackboxはHSP標準命令のclsやscreen命令では消去されません。_clsまたは_clrobjを使用してください。

%href
trackpos
trackrng
trackmrk
tracksel
sel_trackbox




%index
sel_trackbox
操作するトラックボックスを選択
%group
命令概要
%prm
n1
n1 : トラックボックスのID
%inst
この命令使用後はn1で指定したトラックボックスに対して各操作を行います。
トラックボックス新規に作成すると、自動的にそのトラックボックスが各操作の対象になります。
複数のトラックボックスを作成したときは、この命令で操作するトラックボックスを選択してください。

%href
trackbox



%index
trackpos
トラックボックスのつまみの位置の設定と取得
%group
命令概要
%prm
n1,n2
n1 : 設定する位置
n2 : 位置を取得するフラグ

%inst
トラックボックスのつまみの位置を設定します。
n2を1にするとつまみの位置を取得します。
^
この命令を呼び出した後のstatの値
n2を1にするとstatにつまみの位置が代入されます。
それ以外はstatは0になります。

%href
trackrng
trackbox



%index
trackrng
トラックボックスの範囲の設定と取得
%group
命令概要
%prm
n1,n2,n3
n1 : 最小値
n2 : 最大値
n3 : 範囲を取得するフラグ

%inst
トラックボックスの範囲を設定、取得します。
n3を1にすると設定範囲の値を取得します。
^
この命令を呼び出した後のstatの値
n3を1にして、n1を1にするとtrackboxの最小位置、n2を1にすると最大位置がstatに代入されます。
それ以外はstatは0になります。

%href
trackpos
trackbox



%index
trackmrk
トラックボックスの目盛りの設定と取得
%group
命令概要
%prm
n1,n2
n1 : 目盛りをつける位置
n2 : フラグ

%inst
トラックボックスの目盛りの位置を設定、取得します。
^
n2の値  機能
0       n1で指定した位置に目盛りを付けます。
1       付けられている目盛りの数を取得します。
2       間隔をn1で指定した値にして目盛り付けます。ただし、トラックボックスのスタイルを'自動で目盛りを付ける'(1)にしたときのみ有効です。
3       n1番目の目盛りの位置を取得します。
4       付けられている目盛りをすべてクリアします。

%href
trackbox




%index
tracksel
トラックボックスの選択範囲の設定と取得
%group
命令概要
%prm
n1,n2,n3
n1 : 最小値
n2 : 最大値
n3 : フラグ

%inst
トラックボックスの選択範囲を設定、取得します。
ただし、トラックボックス作成時に'つまみの部分に選択領域を付ける'($20)という
スタイルを指定している場合に限ります。
^p
n3を0にするとn1-n2の範囲を選択します。
n3を1にすると開始位置(n1の値)のみをセットします。
n3を2にすると終了位置(n2の値)のみをセットします。
n3を3にすると選択範囲をクリアします。
^p
この命令を呼び出した後のstatの値
n1、n2をともに0すると選択開始位置がstatに代入されます。
n1、n2をともに1すると選択終了位置がstatに代入されます。

%href
trackbox


%index
treemax
ツリーボックスのアイテムの数を取得
%group
オブジェクト制御命令
%prm
v1,n2
v1 : ツリーボックス内のアイテムの数を入れる数値変数
n2 : フラグ

%inst
ツリーボックス内のアイテムの数を取得します。
n2を1にするとツリーボックス内に完全に見えているアイテムの数を取得します。

%href
treebox



%index
treesel
ツリーボックスのアイテムを選択
%group
オブジェクト制御命令
%prm
n1,n2
n1 : アイテムのID
n2 : 選択状態のタイプ

%inst
n1で指定したアイテムを選択します。
n2に$10を足すとアイテムが子をもっているとき、そのアイテムを収縮します。
n2に$20を足すとアイテムが子をもっているとき、そのアイテムを展開します。
^
^p
n2の値   選択状態
0        普通のタイプ
1        DragDropのtargetのようなタイプ
2        itemを先頭に持っていって選択(家の環境ではならないような... tom)
+$10     展開
+$20     収縮
+$30     逆の状態にする
^p

%href
treebox
treeadd




%index
treedel
ツリーボックスのアイテムを消去
%group
オブジェクト制御命令
%prm
n1
n1 : アイテムのID

%inst
n1で指定したアイテムを消去します。

%href
treeadd
treebox




%index
treesort
ツリーボックスのアイテムをソート
%group
オブジェクト制御命令
%prm
n1
n1 : アイテムのID

%inst
n1で指定したアイテムの子をソートします。
n1を省略するとトップのアイテムをソートします。

%href
treeadd
treebox



%index
treeicon
ツリーボックスのアイコンを設定
%group
オブジェクト制御命令
%prm
v1,n2
v1 : アイコンが入った数値変数(get_iconで取得したもの)
n2 : アイコンの数

%inst
ツリーボックスのアイテムのアイコンを設定します。
アイコンをセットするには、imgモジュールが必要です。
^
※必ず、treebox.hspより先にimg.hspをインクルードしてください。
^
この命令実行後にstatにセットしたアイコンについての情報が入った特別な値が返されます。(イメージリストと呼ばれるものです。)
treeboxがいらなくなってtreeboxを消去したときはなるべく
	destroy_imglist 'treeicon実行後にstatに代入された値'
を実行してください。
(アイコンをセットするとメモリを消費します。destroy_imglistを実行することでセットして消費したメモリを開放します。)
treeboxがまだあるうちにdestroy_imglistを実行すると、セットされたアイコンは無効になります。

%href
treeadd
treebox
%sample
#include "llmod3.hsp"
#include "img.hsp"	;treeiconを使う時は必要(treebox.hspより前に)
#include "treebox.hsp"
^
treebox 300,200,1|2|4|$20
^
filename="shell32.dll"
get_icon icons.0,filename,3,1
get_icon icons.1,filename,4,1
treeicon icons,2
img_id=stat	;セットしたアイコンについての情報が入った特別な値
^
treeadd 0,"folder 1",,0,1
itm1=stat




%index
treehit
マウスの下にあるアイテムを取得
%group
オブジェクト制御命令
%inst
マウスの下にあるアイテムのIDを取得します。
^
statにマウスの下にあるアイテムのIDが代入されます。
マウスの下にアイテムが無ければ0が代入されます。

%href
treebox



%index
sel_treebox
操作するツリーボックスを選択
%group
オブジェクト制御命令
%prm
n1
n1 : ツリーボックスのID

%inst
この命令使用後はn1で指定したツリーボックスに対して各操作を行います。
新規にツリーボックスを作成すると、自動的にそのツリーボックスが各操作の対象になります。
複数のツリーボックスを作成したときは、この命令で操作するツリーボックスを選択してください。

%href
treebox




%index
treeget
ツリーボックスの各情報を取得
%group
オブジェクト制御命令
%prm
v1,n2,n3,n4
v1 : 取得したものを入れる変数
n2 : 取得するタイプ
n3 : n2によって変わる
n4 : n2によって変わる

%inst
主にアイテムのIDを取得します。
n2で以下の値を代入すると取得するものが変わってきます。
^
^p
n2の値                               n3の値        n4の値
0   選択されているｱｲﾃﾑのIDを取得     0             0
1   次のｱｲﾃﾑのID(同じレベル)を取得   アイテムのID  0
2   前のｱｲﾃﾑのID(同じレベル)を取得   アイテムのID  0
3   親ｱｲﾃﾑのIDを取得                 アイテムのID  0
4   一番目の子どもｱｲﾃﾑのIDを取得     アイテムのID  0
5   最初に見えているｱｲﾃﾑのIDを取得   アイテムのID  0
6   アイテムのテキスト取得           アイテムのID  変数のサイズ or -1
7   アイテムに持たせた値を取得       アイテムのID  0 or 1
-1  ルートを取得                     0             0
^p
^
値が0の所は省略できます。
n2が6の場合、n4に何文字まで取得するか指定します。63文字以内なら省略できます。
n2が6のときはstatにtreeaddでアイテムに持たせた値が代入されます。
^
n2を6にしたときn4を-1にすると、v1に入っている文字列を使ってアイテムのテキストを再設定できます。
n2を7にしたときn4を1にすると、v1に入っている値を使ってアイテムに持たせた値を再設定できます。

%href
treeadd
treebox



%index
treeadd
treeboxにアイテムを追加
%group
オブジェクト制御命令
%prm
n1,"s2",n3,n4,n5,n6
n1 : 親アイテムのID
s2 : アイテムのテキスト
n3 : アイテムの追加の仕方
n4 : アイテムが収縮している時のアイコン番号
n5 : アイテムが展開している時のアイコン番号
n6 : アイテムに持たせる数値

%inst
ツリーボックスにn1を親にしてアイテムを加えます。
n1に0を代入すると一番目のアイテムになります。
n3にはどのようにアイテムを追加するか、n4には収縮している時のアイコン番号(0から)、n5には展開しているときのアイコン番号(0から)を入れます。
^
どのように追加するかは、1で先頭の子として追加、0または2で一番最後の子として追加、3でソートして追加、となります。
アイコンはtreeiconでセットします。
^
n6に値を入れてアイテムにその数値を持たせることができます。
n6で設定した数値はtreegetで取得できます。
^
この命令を呼び出した後、statに追加したアイテムのIDが代入されます。(0ならエラー)

%href
treedel
treeicon
treeget
treesel
treebox

%sample
treeadd itm3,"new item",3,0,1
new_itm_id=stat




%index
treebox
treeboxの作成
%group
オブジェクト制御命令
%prm
n1,n2,n3
n1 : 幅
n2 : 高さ
n3 : スタイル

%inst
ツリーボックスを作成します。
ツリーボックスとはエクスプローラーの左側にあるようなものです。
スタイルは以下の値を組み合わせて使うことができます。
^p
n3の値
1       アイテムが子を持つとき'+','-'のマークが付く
2       アイテムとアイテムを繋ぐ線がつく
4       最初のアイテムに線が付く(2が指定されているときのみ)
8       ※この数字は使わないで下さい。
$10     ※この数字は使わないで下さい。
$20     ツリーボックスが選択されていないときにも選択されているアイテムが分かるように色が付く
$40     ※よく分からない(tom)
$80     アイテムがツリーボックスからはみ出ていてもツールチップがつかない
※以下のスタイルはcomctl32.dllのバージョンによっては使用できないものもあります。
$100    項目にチェックボックスが付く
$200    マウスがアイテムの上に来ると下線が付く
$400    マウスでクリックされたアイテムのみが展開される
$800    ※よく分からない(tom)
$1000   スタイル2 が指定されていないとき、選択されたアイテムの背景が変わる
$2000   アイテムがツリーボックス内に収まらない時でも、スクロールバーが付かない
$4000   ※よく分からない(tom)
$8000   水平スクロールバーが付かない
^p
^
この命令を呼び出した後、statにツリーボックスのIDが代入されます。
^
※treeboxはHSP標準命令のclsやscreen命令では消去されません。_clsまたは_clrobjを使用してください。

%href
treeadd
treedel
treesel
treeget
treemax
treesort
treeicon
treehit
sel_treebox


%index
udbtn
アップダウンボタンの作成
%group
命令概要
%prm
n1,n2,n3,n4
n1 : 幅
n2 : 高さ
n3 : スタイル
n4 : アップダウンボタンを付けるオブジェクトのID

%inst
アップダウンボタンを作成します。
アップダウンボタンとは矢印ボタンを持ったオブジェクトです。
input等の入力ボックスから数値を得たいときなどに使うと便利です。
(一応button等にも付けることはできます。)
n4にはbuttonなどのオブジェクトのIDを入れます。
^
この命令を呼び出した後、statにアップダウンボタンのIDが代入されます。

udbtnのスタイル(n4)は以下の値を組み合わせて持つことができます。
^p
n4の値  スタイル
1       最小、最大値に達したときに折り返す
4       オブジェクトの右側に付ける
8       オブジェクトの左側に付ける
$20     方向キーで数値を変えられるようにする
$40     水平タイプ
$80     数字をカンマで区切らない
^
※udbtnはHSP標準命令のclsやscreen命令では消去されません。_clsまたは_clrobjを使用してください。

%href
udset
udget
sel_udbtn




%index
sel_udbtn
操作するアップダウンボタンの選択
%group
命令概要
%prm
n1
n1 : アップダウンボタンのID
%inst
この命令使用後はn1で指定したアップダウンボタンに対して各操作を行います。
アップダウンボタン新規に作成すると、自動的にそのアップダウンボタンが各操作の対象になります。
複数のアップダウンボタンを作成したときは、この命令で操作するアップダウンボックスを選択してください。

%href
udbtn



%index
udset
アップダウンボタンの設定
%group
命令概要
%prm
n1,n2,n3
n1 : セットするタイプ
n2 : n1によって変わる
n3 : n1によって変わる

%inst
アップダウンボタンの設定をします。
設定するものはn1の値によって異なります。
^p
n1の値
0       アップダウンボタンの相手を設定します。
       n2にオブジェクトのIDを指定します。
^
1       アップダウンボタンの範囲を設定します。
       n2に最小値(0から$7FFFまで),n3に最大値(0から$7FFFまで)を指定します。
^
2       アップダウンボタンの位置を設定します。
       n2にアップダウンボタンの位置を指定します。
^
3       アップダウンボタンの数値を16進で表示します。
       n2を省略すると16進になり、0以外の値を入れると10進に戻ります。
^
4       アップダウンボタンの増加量を変化させる時間を設定します。
       n2に設定する数、n3に設定する時間、増加量が入った数値変数のポインタを指定します。
	(例)
		udbtn 100,100
		;最初は1ずつ、3秒後に10ずつ、6秒後に50ずつ増加させるようにする
		a=0,1,	3,10,  6,50
		getptr p,a
		udset 4,3,p		;設定する時間は3つ
^p
この命令を呼び出した後のstatの値
n1の値    statの値
 0        セットする前の相手のID
 1        0
 2        セットする前の位置
 3        セットする前の表示タイプ
 4        セットが成功した場合は1、失敗した場合は0

%href
udget
udbtn



%index
udget
アップダウンボタンの各種情報の取得
%group
命令概要
%prm
n1
n1 : 取得するタイプ
%inst
アップダウンボタンの各種情報を取得します。
取得するものはn1の値によって異なります。
各情報はstatに代入されます。
^p
n1の値
0       アップダウンボタンの相手を取得します。
1       アップダウンボタンの範囲を取得します。
       statの値は ' 最小値 | (最大値<<16) ' の形式になっています。
2       アップダウンボタンの位置を取得します。
3       アップダウンボタンの数値の表示の仕方を取得します。
^p
%href
udset
udbtn


