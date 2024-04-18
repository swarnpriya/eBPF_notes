	.text
	.file	"packet_count.bpf.c"
	.file	0 "/home/swarnp/research/eBPF_notes/eBPF_Koka/packet_count" "packet_count.bpf.c" md5 0x1b25969ca71830d9c99a37fac7c3e67f
	.file	1 "/usr/include/asm-generic" "int-ll64.h" md5 0xb810f270733e106319b67ef512c6246e
	.file	2 "/usr/include/bpf" "bpf_helper_defs.h" md5 0x32b0945df61015e3dd6be9ac5ea42778
	.file	3 "/usr/include/linux" "bpf.h" md5 0x03bc76f18af37c3e4503ca6e7a7f78a9
	.section	xdp,"ax",@progbits
	.globl	packet_count                    # -- Begin function packet_count
	.p2align	4, 0x90
	.type	packet_count,@function
packet_count:                           # @packet_count
.Lfunc_begin0:
	.loc	0 7 0                           # packet_count.bpf.c:7:0
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
.Ltmp0:
	.loc	0 8 5 prologue_end              # packet_count.bpf.c:8:5
	movq	bpf_trace_printk(%rip), %rcx
	movl	counter(%rip), %edx
	leaq	packet_count.____fmt(%rip), %rdi
	movl	$3, %esi
	movb	$0, %al
	callq	*%rcx
	movq	%rax, -16(%rbp)
.Ltmp1:
	.loc	0 9 12                          # packet_count.bpf.c:9:12
	movl	counter(%rip), %eax
	addl	$1, %eax
	movl	%eax, counter(%rip)
	.loc	0 10 5                          # packet_count.bpf.c:10:5
	movl	$2, %eax
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Ltmp2:
.Lfunc_end0:
	.size	packet_count, .Lfunc_end0-packet_count
	.cfi_endproc
                                        # -- End function
	.type	counter,@object                 # @counter
	.bss
	.globl	counter
	.p2align	2
counter:
	.long	0                               # 0x0
	.size	counter, 4

	.type	packet_count.____fmt,@object    # @packet_count.____fmt
	.section	.rodata,"a",@progbits
packet_count.____fmt:
	.asciz	"%d"
	.size	packet_count.____fmt, 3

	.type	bpf_trace_printk,@object        # @bpf_trace_printk
	.data
	.p2align	3
bpf_trace_printk:
	.quad	6
	.size	bpf_trace_printk, 8

	.type	LICENSE,@object                 # @LICENSE
	.section	license,"aw",@progbits
	.globl	LICENSE
LICENSE:
	.asciz	"Dual BSD/GPL"
	.size	LICENSE, 13

	.section	.debug_abbrev,"",@progbits
	.byte	1                               # Abbreviation Code
	.byte	17                              # DW_TAG_compile_unit
	.byte	1                               # DW_CHILDREN_yes
	.byte	37                              # DW_AT_producer
	.byte	37                              # DW_FORM_strx1
	.byte	19                              # DW_AT_language
	.byte	5                               # DW_FORM_data2
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	114                             # DW_AT_str_offsets_base
	.byte	23                              # DW_FORM_sec_offset
	.byte	16                              # DW_AT_stmt_list
	.byte	23                              # DW_FORM_sec_offset
	.byte	27                              # DW_AT_comp_dir
	.byte	37                              # DW_FORM_strx1
	.byte	17                              # DW_AT_low_pc
	.byte	27                              # DW_FORM_addrx
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	115                             # DW_AT_addr_base
	.byte	23                              # DW_FORM_sec_offset
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	2                               # Abbreviation Code
	.byte	52                              # DW_TAG_variable
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	2                               # DW_AT_location
	.byte	24                              # DW_FORM_exprloc
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	3                               # Abbreviation Code
	.byte	36                              # DW_TAG_base_type
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	62                              # DW_AT_encoding
	.byte	11                              # DW_FORM_data1
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	4                               # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	17                              # DW_AT_low_pc
	.byte	27                              # DW_FORM_addrx
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	64                              # DW_AT_frame_base
	.byte	24                              # DW_FORM_exprloc
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	39                              # DW_AT_prototyped
	.byte	25                              # DW_FORM_flag_present
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	5                               # Abbreviation Code
	.byte	52                              # DW_TAG_variable
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	2                               # DW_AT_location
	.byte	24                              # DW_FORM_exprloc
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	6                               # Abbreviation Code
	.byte	5                               # DW_TAG_formal_parameter
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	24                              # DW_FORM_exprloc
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	7                               # Abbreviation Code
	.byte	1                               # DW_TAG_array_type
	.byte	1                               # DW_CHILDREN_yes
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	8                               # Abbreviation Code
	.byte	33                              # DW_TAG_subrange_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	55                              # DW_AT_count
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	9                               # Abbreviation Code
	.byte	38                              # DW_TAG_const_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	10                              # Abbreviation Code
	.byte	36                              # DW_TAG_base_type
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	62                              # DW_AT_encoding
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	11                              # Abbreviation Code
	.byte	15                              # DW_TAG_pointer_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	12                              # Abbreviation Code
	.byte	21                              # DW_TAG_subroutine_type
	.byte	1                               # DW_CHILDREN_yes
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	39                              # DW_AT_prototyped
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	13                              # Abbreviation Code
	.byte	5                               # DW_TAG_formal_parameter
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	14                              # Abbreviation Code
	.byte	24                              # DW_TAG_unspecified_parameters
	.byte	0                               # DW_CHILDREN_no
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	15                              # Abbreviation Code
	.byte	22                              # DW_TAG_typedef
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	16                              # Abbreviation Code
	.byte	4                               # DW_TAG_enumeration_type
	.byte	1                               # DW_CHILDREN_yes
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	5                               # DW_FORM_data2
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	17                              # Abbreviation Code
	.byte	40                              # DW_TAG_enumerator
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	28                              # DW_AT_const_value
	.byte	15                              # DW_FORM_udata
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	18                              # Abbreviation Code
	.byte	15                              # DW_TAG_pointer_type
	.byte	0                               # DW_CHILDREN_no
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	0                               # EOM(3)
	.section	.debug_info,"",@progbits
.Lcu_begin0:
	.long	.Ldebug_info_end0-.Ldebug_info_start0 # Length of Unit
.Ldebug_info_start0:
	.short	5                               # DWARF version number
	.byte	1                               # DWARF Unit Type
	.byte	8                               # Address Size (in bytes)
	.long	.debug_abbrev                   # Offset Into Abbrev. Section
	.byte	1                               # Abbrev [1] 0xc:0xce DW_TAG_compile_unit
	.byte	0                               # DW_AT_producer
	.short	12                              # DW_AT_language
	.byte	1                               # DW_AT_name
	.long	.Lstr_offsets_base0             # DW_AT_str_offsets_base
	.long	.Lline_table_start0             # DW_AT_stmt_list
	.byte	2                               # DW_AT_comp_dir
	.byte	4                               # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.long	.Laddr_table_base0              # DW_AT_addr_base
	.byte	2                               # Abbrev [2] 0x23:0xb DW_TAG_variable
	.byte	3                               # DW_AT_name
	.long	46                              # DW_AT_type
                                        # DW_AT_external
	.byte	0                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
	.byte	2                               # DW_AT_location
	.byte	161
	.byte	0
	.byte	3                               # Abbrev [3] 0x2e:0x4 DW_TAG_base_type
	.byte	4                               # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	4                               # Abbrev [4] 0x32:0x26 DW_TAG_subprogram
	.byte	4                               # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	86
	.byte	19                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	7                               # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	46                              # DW_AT_type
                                        # DW_AT_external
	.byte	5                               # Abbrev [5] 0x41:0xb DW_TAG_variable
	.byte	5                               # DW_AT_name
	.long	88                              # DW_AT_type
	.byte	0                               # DW_AT_decl_file
	.byte	8                               # DW_AT_decl_line
	.byte	2                               # DW_AT_location
	.byte	161
	.byte	1
	.byte	6                               # Abbrev [6] 0x4c:0xb DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	120
	.byte	20                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	7                               # DW_AT_decl_line
	.long	216                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	7                               # Abbrev [7] 0x58:0xc DW_TAG_array_type
	.long	100                             # DW_AT_type
	.byte	8                               # Abbrev [8] 0x5d:0x6 DW_TAG_subrange_type
	.long	109                             # DW_AT_type
	.byte	3                               # DW_AT_count
	.byte	0                               # End Of Children Mark
	.byte	9                               # Abbrev [9] 0x64:0x5 DW_TAG_const_type
	.long	105                             # DW_AT_type
	.byte	3                               # Abbrev [3] 0x69:0x4 DW_TAG_base_type
	.byte	6                               # DW_AT_name
	.byte	6                               # DW_AT_encoding
	.byte	1                               # DW_AT_byte_size
	.byte	10                              # Abbrev [10] 0x6d:0x4 DW_TAG_base_type
	.byte	7                               # DW_AT_name
	.byte	8                               # DW_AT_byte_size
	.byte	7                               # DW_AT_encoding
	.byte	2                               # Abbrev [2] 0x71:0xb DW_TAG_variable
	.byte	8                               # DW_AT_name
	.long	124                             # DW_AT_type
                                        # DW_AT_external
	.byte	0                               # DW_AT_decl_file
	.byte	13                              # DW_AT_decl_line
	.byte	2                               # DW_AT_location
	.byte	161
	.byte	2
	.byte	7                               # Abbrev [7] 0x7c:0xc DW_TAG_array_type
	.long	105                             # DW_AT_type
	.byte	8                               # Abbrev [8] 0x81:0x6 DW_TAG_subrange_type
	.long	109                             # DW_AT_type
	.byte	13                              # DW_AT_count
	.byte	0                               # End Of Children Mark
	.byte	5                               # Abbrev [5] 0x88:0xb DW_TAG_variable
	.byte	9                               # DW_AT_name
	.long	147                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.byte	176                             # DW_AT_decl_line
	.byte	2                               # DW_AT_location
	.byte	161
	.byte	3
	.byte	11                              # Abbrev [11] 0x93:0x5 DW_TAG_pointer_type
	.long	152                             # DW_AT_type
	.byte	12                              # Abbrev [12] 0x98:0x11 DW_TAG_subroutine_type
	.long	169                             # DW_AT_type
                                        # DW_AT_prototyped
	.byte	13                              # Abbrev [13] 0x9d:0x5 DW_TAG_formal_parameter
	.long	173                             # DW_AT_type
	.byte	13                              # Abbrev [13] 0xa2:0x5 DW_TAG_formal_parameter
	.long	178                             # DW_AT_type
	.byte	14                              # Abbrev [14] 0xa7:0x1 DW_TAG_unspecified_parameters
	.byte	0                               # End Of Children Mark
	.byte	3                               # Abbrev [3] 0xa9:0x4 DW_TAG_base_type
	.byte	10                              # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	8                               # DW_AT_byte_size
	.byte	11                              # Abbrev [11] 0xad:0x5 DW_TAG_pointer_type
	.long	100                             # DW_AT_type
	.byte	15                              # Abbrev [15] 0xb2:0x8 DW_TAG_typedef
	.long	186                             # DW_AT_type
	.byte	12                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	27                              # DW_AT_decl_line
	.byte	3                               # Abbrev [3] 0xba:0x4 DW_TAG_base_type
	.byte	11                              # DW_AT_name
	.byte	7                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	16                              # Abbrev [16] 0xbe:0x1a DW_TAG_enumeration_type
	.long	186                             # DW_AT_type
	.byte	18                              # DW_AT_name
	.byte	4                               # DW_AT_byte_size
	.byte	3                               # DW_AT_decl_file
	.short	5433                            # DW_AT_decl_line
	.byte	17                              # Abbrev [17] 0xc8:0x3 DW_TAG_enumerator
	.byte	13                              # DW_AT_name
	.byte	0                               # DW_AT_const_value
	.byte	17                              # Abbrev [17] 0xcb:0x3 DW_TAG_enumerator
	.byte	14                              # DW_AT_name
	.byte	1                               # DW_AT_const_value
	.byte	17                              # Abbrev [17] 0xce:0x3 DW_TAG_enumerator
	.byte	15                              # DW_AT_name
	.byte	2                               # DW_AT_const_value
	.byte	17                              # Abbrev [17] 0xd1:0x3 DW_TAG_enumerator
	.byte	16                              # DW_AT_name
	.byte	3                               # DW_AT_const_value
	.byte	17                              # Abbrev [17] 0xd4:0x3 DW_TAG_enumerator
	.byte	17                              # DW_AT_name
	.byte	4                               # DW_AT_const_value
	.byte	0                               # End Of Children Mark
	.byte	18                              # Abbrev [18] 0xd8:0x1 DW_TAG_pointer_type
	.byte	0                               # End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_str_offsets,"",@progbits
	.long	88                              # Length of String Offsets Set
	.short	5
	.short	0
.Lstr_offsets_base0:
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"Ubuntu clang version 14.0.0-1ubuntu1.1" # string offset=0
.Linfo_string1:
	.asciz	"packet_count.bpf.c"            # string offset=39
.Linfo_string2:
	.asciz	"/home/swarnp/research/eBPF_notes/eBPF_Koka/packet_count" # string offset=58
.Linfo_string3:
	.asciz	"counter"                       # string offset=114
.Linfo_string4:
	.asciz	"int"                           # string offset=122
.Linfo_string5:
	.asciz	"____fmt"                       # string offset=126
.Linfo_string6:
	.asciz	"char"                          # string offset=134
.Linfo_string7:
	.asciz	"__ARRAY_SIZE_TYPE__"           # string offset=139
.Linfo_string8:
	.asciz	"LICENSE"                       # string offset=159
.Linfo_string9:
	.asciz	"bpf_trace_printk"              # string offset=167
.Linfo_string10:
	.asciz	"long"                          # string offset=184
.Linfo_string11:
	.asciz	"unsigned int"                  # string offset=189
.Linfo_string12:
	.asciz	"__u32"                         # string offset=202
.Linfo_string13:
	.asciz	"XDP_ABORTED"                   # string offset=208
.Linfo_string14:
	.asciz	"XDP_DROP"                      # string offset=220
.Linfo_string15:
	.asciz	"XDP_PASS"                      # string offset=229
.Linfo_string16:
	.asciz	"XDP_TX"                        # string offset=238
.Linfo_string17:
	.asciz	"XDP_REDIRECT"                  # string offset=245
.Linfo_string18:
	.asciz	"xdp_action"                    # string offset=258
.Linfo_string19:
	.asciz	"packet_count"                  # string offset=269
.Linfo_string20:
	.asciz	"ctx"                           # string offset=282
	.section	.debug_str_offsets,"",@progbits
	.long	.Linfo_string0
	.long	.Linfo_string1
	.long	.Linfo_string2
	.long	.Linfo_string3
	.long	.Linfo_string4
	.long	.Linfo_string5
	.long	.Linfo_string6
	.long	.Linfo_string7
	.long	.Linfo_string8
	.long	.Linfo_string9
	.long	.Linfo_string10
	.long	.Linfo_string11
	.long	.Linfo_string12
	.long	.Linfo_string13
	.long	.Linfo_string14
	.long	.Linfo_string15
	.long	.Linfo_string16
	.long	.Linfo_string17
	.long	.Linfo_string18
	.long	.Linfo_string19
	.long	.Linfo_string20
	.section	.debug_addr,"",@progbits
	.long	.Ldebug_addr_end0-.Ldebug_addr_start0 # Length of contribution
.Ldebug_addr_start0:
	.short	5                               # DWARF version number
	.byte	8                               # Address size
	.byte	0                               # Segment selector size
.Laddr_table_base0:
	.quad	counter
	.quad	packet_count.____fmt
	.quad	LICENSE
	.quad	bpf_trace_printk
	.quad	.Lfunc_begin0
.Ldebug_addr_end0:
	.ident	"Ubuntu clang version 14.0.0-1ubuntu1.1"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym packet_count
	.addrsig_sym counter
	.addrsig_sym packet_count.____fmt
	.addrsig_sym bpf_trace_printk
	.addrsig_sym LICENSE
	.section	.debug_line,"",@progbits
.Lline_table_start0:
