JSC = jsc

TESTFILE = shader_test.vs
TESTOKFILE = shader_test_good_decomment.vs

all: decommentUTF16 decommentUTF8 decommentOCaml tests

clean:
	rm decommentUTF16 decommentUTF8 decommentOCaml decomment.o decomment.cm? out/o_*

decommentUTF16: decomment.cc
	g++ -DUTF16=1 -o $@ $^

decommentUTF8: decomment.cc
	g++ -DUTF16=0 -o $@ $^

decommentOCaml: decomment.ml
	ocamlopt -o $@ $^

tests: out/o_cpp_utf8 out/o_cpp_utf16 out/o_perl out/o_js out/o_ml


out/o_cpp_utf8: $(TESTFILE) decommentUTF8
	cat $(TESTFILE) | ./decommentUTF8 > $@ 
	- diff $(TESTOKFILE) $@ && echo "--good--"

out/o_cpp_utf16: $(TESTFILE) decommentUTF16
	./utf8toutf16LE.pl $(TESTFILE) | ./decommentUTF16 > $@
	- diff $(TESTOKFILE) $@ && echo "--good--"

out/o_perl: $(TESTFILE) decomment.pl
	./decomment.pl $(TESTFILE) > $@
	- diff $(TESTOKFILE) $@ && echo "--good--"

out/o_js: $(TESTFILE) decomment.js
	$(JSC) decomment.js -- "`cat $(TESTFILE)`" > $@
	- diff $(TESTOKFILE) $@ && echo "--good--"

out/o_ml: $(TESTFILE) decommentOCaml
	./decommentOcaml < $(TESTFILE) > $@
	- diff $(TESTOKFILE) $@ && echo "--good--"
