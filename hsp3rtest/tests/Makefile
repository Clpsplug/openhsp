LIBS=comctl32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib

HSP3CNV=../../hsp3cnv/Release/hsp3cnv.exe

TESTS= \
	memcpy.exe \
	modfunc.exe \
	modtest3.exe \
	modtest4.exe \
	modvar.exe \
	strtrim.exe \
	split.exe \
	foreach.exe

BASE=$(basename $(TESTS))

all: $(TESTS)
#	cl /c ..\\test.cpp
#	link /out:test.exe /SUBSYSTEM:CONSOLE test.obj ..\\Release\\hsp3rtest-cl.lib $(LIBS) /LTCG
	echo $(BASE)
	rm -rf out
	mkdir out
	BASE="$(BASE)";\
	for T in $$BASE; do \
	  ./$$T > out/$$T; \
	  diff -u ref/$$T out/$$T > $$T.log; \
	  cat $$T.log; \
	done

%.cpp: %.ax $(HSP3CNV)
	$(HSP3CNV) $<

%.obj: %.cpp
	cl /c /I .. $<

%.exe: %.obj ../Release/hsp3rtest-cl.lib
	link /out:$@ /SUBSYSTEM:CONSOLE $< ..\\Release\\hsp3rtest-cl.lib $(LIBS) /LTCG

clean:
	rm *.exe *.out *.log *.obj
