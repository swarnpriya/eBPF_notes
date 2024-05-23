; ModuleID = 'hash_map_example.bpf.c'
source_filename = "hash_map_example.bpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon = type { [1 x i32]*, [10240 x i32]*, i64*, i64* }

@bpf_get_current_uid_gid = internal global i64 ()* inttoptr (i64 15 to i64 ()*), align 8, !dbg !0
@bpf_map_lookup_elem = internal global i8* (i8*, i8*)* inttoptr (i64 1 to i8* (i8*, i8*)*), align 8, !dbg !28
@counter_table = dso_local global %struct.anon zeroinitializer, section ".maps", align 8, !dbg !5
@bpf_map_update_elem = internal global i64 (i8*, i8*, i8*, i64)* inttoptr (i64 2 to i64 (i8*, i8*, i8*, i64)*), align 8, !dbg !37
@llvm.compiler.used = appending global [2 x i8*] [i8* bitcast (i32 (i8*)* @hello to i8*), i8* bitcast (%struct.anon* @counter_table to i8*)], section "llvm.metadata"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @hello(i8* noundef %0) #0 section "ksyscall/execve" !dbg !57 {
  %2 = alloca i8*, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64*, align 8
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !61, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.declare(metadata i64* %3, metadata !63, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.declare(metadata i64* %4, metadata !65, metadata !DIExpression()), !dbg !66
  store i64 0, i64* %4, align 8, !dbg !66
  call void @llvm.dbg.declare(metadata i64** %5, metadata !67, metadata !DIExpression()), !dbg !68
  %6 = load i64 ()*, i64 ()** @bpf_get_current_uid_gid, align 8, !dbg !69
  %7 = call i64 %6(), !dbg !69
  %8 = and i64 %7, 4294967295, !dbg !70
  store i64 %8, i64* %3, align 8, !dbg !71
  %9 = load i8* (i8*, i8*)*, i8* (i8*, i8*)** @bpf_map_lookup_elem, align 8, !dbg !72
  %10 = bitcast i64* %3 to i8*, !dbg !73
  %11 = call i8* %9(i8* noundef bitcast (%struct.anon* @counter_table to i8*), i8* noundef %10), !dbg !72
  %12 = bitcast i8* %11 to i64*, !dbg !72
  store i64* %12, i64** %5, align 8, !dbg !74
  %13 = load i64*, i64** %5, align 8, !dbg !75
  %14 = icmp ne i64* %13, null, !dbg !77
  br i1 %14, label %15, label %18, !dbg !78

15:                                               ; preds = %1
  %16 = load i64*, i64** %5, align 8, !dbg !79
  %17 = load i64, i64* %16, align 8, !dbg !81
  store i64 %17, i64* %4, align 8, !dbg !82
  br label %18, !dbg !83

18:                                               ; preds = %15, %1
  %19 = load i64, i64* %4, align 8, !dbg !84
  %20 = add i64 %19, 1, !dbg !84
  store i64 %20, i64* %4, align 8, !dbg !84
  %21 = load i64 (i8*, i8*, i8*, i64)*, i64 (i8*, i8*, i8*, i64)** @bpf_map_update_elem, align 8, !dbg !85
  %22 = bitcast i64* %3 to i8*, !dbg !86
  %23 = bitcast i64* %4 to i8*, !dbg !87
  %24 = call i64 %21(i8* noundef bitcast (%struct.anon* @counter_table to i8*), i8* noundef %22, i8* noundef %23, i64 noundef 0), !dbg !85
  ret i32 0, !dbg !88
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!49, !50, !51, !52, !53, !54, !55}
!llvm.ident = !{!56}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "bpf_get_current_uid_gid", scope: !2, file: !30, line: 378, type: !46, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !4, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "hash_map_example.bpf.c", directory: "/home/swarnp/research/eBPF_notes/eBPF_Koka/bpf_maps", checksumkind: CSK_MD5, checksum: "ff8e1b13a6c82f083a0de047af1297db")
!4 = !{!5, !0, !28, !37}
!5 = !DIGlobalVariableExpression(var: !6, expr: !DIExpression())
!6 = distinct !DIGlobalVariable(name: "counter_table", scope: !2, file: !3, line: 12, type: !7, isLocal: false, isDefinition: true)
!7 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 7, size: 256, elements: !8)
!8 = !{!9, !15, !20, !27}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !7, file: !3, line: 8, baseType: !10, size: 64)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 32, elements: !13)
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !{!14}
!14 = !DISubrange(count: 1)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !7, file: !3, line: 9, baseType: !16, size: 64, offset: 64)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 327680, elements: !18)
!18 = !{!19}
!19 = !DISubrange(count: 10240)
!20 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !7, file: !3, line: 10, baseType: !21, size: 64, offset: 128)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !23, line: 27, baseType: !24)
!23 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "", checksumkind: CSK_MD5, checksum: "2bf2ae53c58c01b1a1b9383b5195125c")
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !25, line: 45, baseType: !26)
!25 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!26 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !7, file: !3, line: 11, baseType: !21, size: 64, offset: 192)
!28 = !DIGlobalVariableExpression(var: !29, expr: !DIExpression())
!29 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !30, line: 55, type: !31, isLocal: true, isDefinition: true)
!30 = !DIFile(filename: "/usr/include/bpf/bpf_helper_defs.h", directory: "", checksumkind: CSK_MD5, checksum: "32b0945df61015e3dd6be9ac5ea42778")
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!32 = !DISubroutineType(types: !33)
!33 = !{!34, !34, !35}
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 64)
!36 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!37 = !DIGlobalVariableExpression(var: !38, expr: !DIExpression())
!38 = distinct !DIGlobalVariable(name: "bpf_map_update_elem", scope: !2, file: !30, line: 77, type: !39, isLocal: true, isDefinition: true)
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 64)
!40 = !DISubroutineType(types: !41)
!41 = !{!42, !34, !35, !35, !43}
!42 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !44, line: 31, baseType: !45)
!44 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "", checksumkind: CSK_MD5, checksum: "b810f270733e106319b67ef512c6246e")
!45 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = !DISubroutineType(types: !48)
!48 = !{!43}
!49 = !{i32 7, !"Dwarf Version", i32 5}
!50 = !{i32 2, !"Debug Info Version", i32 3}
!51 = !{i32 1, !"wchar_size", i32 4}
!52 = !{i32 7, !"PIC Level", i32 2}
!53 = !{i32 7, !"PIE Level", i32 2}
!54 = !{i32 7, !"uwtable", i32 1}
!55 = !{i32 7, !"frame-pointer", i32 2}
!56 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!57 = distinct !DISubprogram(name: "hello", scope: !3, file: !3, line: 16, type: !58, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !60)
!58 = !DISubroutineType(types: !59)
!59 = !{!12, !34}
!60 = !{}
!61 = !DILocalVariable(name: "ctx", arg: 1, scope: !57, file: !3, line: 16, type: !34)
!62 = !DILocation(line: 16, column: 17, scope: !57)
!63 = !DILocalVariable(name: "uid", scope: !57, file: !3, line: 17, type: !22)
!64 = !DILocation(line: 17, column: 14, scope: !57)
!65 = !DILocalVariable(name: "counter", scope: !57, file: !3, line: 18, type: !22)
!66 = !DILocation(line: 18, column: 14, scope: !57)
!67 = !DILocalVariable(name: "p", scope: !57, file: !3, line: 19, type: !21)
!68 = !DILocation(line: 19, column: 15, scope: !57)
!69 = !DILocation(line: 21, column: 11, scope: !57)
!70 = !DILocation(line: 21, column: 37, scope: !57)
!71 = !DILocation(line: 21, column: 9, scope: !57)
!72 = !DILocation(line: 24, column: 9, scope: !57)
!73 = !DILocation(line: 24, column: 45, scope: !57)
!74 = !DILocation(line: 24, column: 7, scope: !57)
!75 = !DILocation(line: 25, column: 9, scope: !76)
!76 = distinct !DILexicalBlock(scope: !57, file: !3, line: 25, column: 9)
!77 = !DILocation(line: 25, column: 10, scope: !76)
!78 = !DILocation(line: 25, column: 9, scope: !57)
!79 = !DILocation(line: 26, column: 20, scope: !80)
!80 = distinct !DILexicalBlock(scope: !76, file: !3, line: 25, column: 16)
!81 = !DILocation(line: 26, column: 19, scope: !80)
!82 = !DILocation(line: 26, column: 17, scope: !80)
!83 = !DILocation(line: 27, column: 5, scope: !80)
!84 = !DILocation(line: 29, column: 12, scope: !57)
!85 = !DILocation(line: 30, column: 5, scope: !57)
!86 = !DILocation(line: 30, column: 41, scope: !57)
!87 = !DILocation(line: 30, column: 47, scope: !57)
!88 = !DILocation(line: 31, column: 5, scope: !57)
