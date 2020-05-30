TARGET:=x86-64
LLVM_VERSION := 8.0
CLANG := clang-$(LLVM_VERSION)
LLC := llc-$(LLVM_VERSION)
IN_FILES=$(wildcard tests/*.in)
LLVM_FILES=$(IN_FILES:.in=.llvm)
ASSEMBLY_FILES=$(LLVM_FILES:.llvm=.S)
EXE_FILES=$(ASSEMBLY_FILES:.S=.exe)
OUT_FILES=$(OUTFILES:.exe=.out)
OCAMLBUILDFLAGS:=-classic-display -j 0 -cflags -w,@a-4


default: main.byte

clean:
	rm -f main.byte
	rm -fr _build/
	rm -rf tests/*.S
	rm -fr tests/*.llvm
	rm -fr tests/*.exe
	rm -rf tests/*.out
	rm -rf tests/*.llvm.s

cleantests: 
	rm -fr tests/*.llvm
	rm -fr tests/*.exe
	rm -rf tests/*.S
	rm -rf tests/*.out

main.byte:
	ocamlbuild -use-menhir -use-ocamlfind main.byte -package llvm -package llvm.analysis -package llvm.executionengine -package llvm.scalar_opts -package llvm_X86 -package llvm.all_backends -package   
tests/%.llvm: tests/%.in main.byte
	./main.byte $< > $@

tests: main.byte $(LLVM_FILES)
	@echo "LLVM IR code generated "

tests/%.S: tests/%.llvm
	llc -O3 $< -mcpu=$(TARGET) -o $@

tests/%.exe: tests/%.S
	gcc -no-pie $< -o  $@

tests/%.out: tests/%.exe
	./$<  > $@

compile: $(ASSEMBLY_FILES)
	

compile2: $(EXE_FILES)
		

run: ./$(EXE_FILES) 

all: tests
	compile
	compile2
	run