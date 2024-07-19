	.text
	.file	"simple.bpf.c"
	.globl	simple                          # -- Begin function simple
	.p2align	3
	.type	simple,@function
simple:                                 # @simple
# %bb.0:
	r0 = 0
	exit
.Lfunc_end0:
	.size	simple, .Lfunc_end0-simple
                                        # -- End function
	.addrsig
