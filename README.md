# Test OpenMPI with Valgrind

Spoiler alert: it fails.

Source:

```cpp
#include <mpi.h>

int main(int argc, char **argv)
{
    MPI_Init(&argc, &argv);
    MPI_Finalize();
    return 0;
}
```

Run test:

```bash
bash zscripts/run.bash
```

## Output (Ubuntu GNU/Linux 20.04.1 LTS)

```
==221582== Memcheck, a memory error detector
==221582== Copyright (C) 2002-2017, and GNU GPL'd, by Julian Seward et al.
==221582== Using Valgrind-3.15.0 and LibVEX; rerun with -h for copyright info
==221582== Command: ./project
==221582==
==221582==
==221582== HEAP SUMMARY:
==221582==     in use at exit: 11,743 bytes in 71 blocks
==221582==   total heap usage: 26,871 allocs, 26,800 frees, 5,516,327 bytes allocated
==221582==
==221582== 1 bytes in 1 blocks are definitely lost in loss record 1 of 58
==221582==    at 0x483B7F3: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==221582==    by 0x4C4B50E: strdup (strdup.c:42)
==221582==    by 0x92514B6: ???
==221582==    by 0x922A373: ???
==221582==    by 0x4ECEB9B: mca_base_framework_components_register (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libopen-pal.so.40.20.3)
==221582==    by 0x4ECEF35: mca_base_framework_register (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libopen-pal.so.40.20.3)
==221582==    by 0x4ECEF93: mca_base_framework_open (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libopen-pal.so.40.20.3)
==221582==    by 0x4960734: ompi_mpi_init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so.40.20.3)
==221582==    by 0x4904072: PMPI_Init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so.40.20.3)
==221582==    by 0x11562E: main (in /home/dorival/01-Code/cpp/test-openmpi-valgrind/build/project)
==221582==
==221582== 8 bytes in 1 blocks are definitely lost in loss record 8 of 58
==221582==    at 0x483DD99: calloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==221582==    by 0x928AB6F: ???
==221582==    by 0x9239DED: ???
==221582==    by 0x4EE79C8: mca_btl_base_select (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libopen-pal.so.40.20.3)
==221582==    by 0x7389527: ???
==221582==    by 0x492070A: mca_bml_base_init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so.40.20.3)
==221582==    by 0x4960714: ompi_mpi_init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so.40.20.3)
==221582==    by 0x4904072: PMPI_Init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so.40.20.3)
==221582==    by 0x11562E: main (in /home/dorival/01-Code/cpp/test-openmpi-valgrind/build/project)
==221582==
==221582== 11 bytes in 1 blocks are definitely lost in loss record 13 of 58
==221582==    at 0x483B7F3: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==221582==    by 0x4C4B50E: strdup (strdup.c:42)
==221582==    by 0x930855C: ???
==221582==    by 0x4011B89: call_init.part.0 (dl-init.c:72)
==221582==    by 0x4011C90: call_init (dl-init.c:30)
==221582==    by 0x4011C90: _dl_init (dl-init.c:119)
==221582==    by 0x4D0C914: _dl_catch_exception (dl-error-skeleton.c:182)
==221582==    by 0x401642C: dl_open_worker (dl-open.c:758)
==221582==    by 0x4D0C8B7: _dl_catch_exception (dl-error-skeleton.c:208)
==221582==    by 0x40155F9: _dl_open (dl-open.c:837)
==221582==    by 0x513D34B: dlopen_doit (dlopen.c:66)
==221582==    by 0x4D0C8B7: _dl_catch_exception (dl-error-skeleton.c:208)
==221582==    by 0x4D0C982: _dl_catch_error (dl-error-skeleton.c:227)
==221582==
==221582== 16 bytes in 1 blocks are definitely lost in loss record 16 of 58
==221582==    at 0x483B7F3: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==221582==    by 0x9239BEB: ???
==221582==    by 0x4EE79C8: mca_btl_base_select (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libopen-pal.so.40.20.3)
==221582==    by 0x7389527: ???
==221582==    by 0x492070A: mca_bml_base_init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so.40.20.3)
==221582==    by 0x4960714: ompi_mpi_init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so.40.20.3)
==221582==    by 0x4904072: PMPI_Init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so.40.20.3)
==221582==    by 0x11562E: main (in /home/dorival/01-Code/cpp/test-openmpi-valgrind/build/project)
==221582==
==221582== 16 bytes in 1 blocks are definitely lost in loss record 17 of 58
==221582==    at 0x483B7F3: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==221582==    by 0x9239C66: ???
==221582==    by 0x4EE79C8: mca_btl_base_select (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libopen-pal.so.40.20.3)
==221582==    by 0x7389527: ???
==221582==    by 0x492070A: mca_bml_base_init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so.40.20.3)
==221582==    by 0x4960714: ompi_mpi_init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so.40.20.3)
==221582==    by 0x4904072: PMPI_Init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so.40.20.3)
==221582==    by 0x11562E: main (in /home/dorival/01-Code/cpp/test-openmpi-valgrind/build/project)
==221582==
==221582== 16 bytes in 1 blocks are definitely lost in loss record 18 of 58
==221582==    at 0x483B7F3: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==221582==    by 0x9239CDA: ???
==221582==    by 0x4EE79C8: mca_btl_base_select (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libopen-pal.so.40.20.3)
==221582==    by 0x7389527: ???
==221582==    by 0x492070A: mca_bml_base_init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so.40.20.3)
==221582==    by 0x4960714: ompi_mpi_init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so.40.20.3)
==221582==    by 0x4904072: PMPI_Init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so.40.20.3)
==221582==    by 0x11562E: main (in /home/dorival/01-Code/cpp/test-openmpi-valgrind/build/project)
==221582==
==221582== 30 bytes in 1 blocks are definitely lost in loss record 20 of 58
==221582==    at 0x483B7F3: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==221582==    by 0x975F59B: ???
==221582==    by 0x4011B89: call_init.part.0 (dl-init.c:72)
==221582==    by 0x4011C90: call_init (dl-init.c:30)
==221582==    by 0x4011C90: _dl_init (dl-init.c:119)
==221582==    by 0x4D0C914: _dl_catch_exception (dl-error-skeleton.c:182)
==221582==    by 0x401642C: dl_open_worker (dl-open.c:758)
==221582==    by 0x4D0C8B7: _dl_catch_exception (dl-error-skeleton.c:208)
==221582==    by 0x40155F9: _dl_open (dl-open.c:837)
==221582==    by 0x513D34B: dlopen_doit (dlopen.c:66)
==221582==    by 0x4D0C8B7: _dl_catch_exception (dl-error-skeleton.c:208)
==221582==    by 0x4D0C982: _dl_catch_error (dl-error-skeleton.c:227)
==221582==    by 0x513DB58: _dlerror_run (dlerror.c:170)
==221582==
==221582== 32 bytes in 1 blocks are definitely lost in loss record 22 of 58
==221582==    at 0x483B7F3: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==221582==    by 0x5F673EB: ???
==221582==    by 0x5F691C1: ???
==221582==    by 0x5F3A78C: ???
==221582==    by 0x5E4C05A: ???
==221582==    by 0x5E4DFE8: ???
==221582==    by 0x5E4EE4D: ???
==221582==    by 0x5DDC5EB: ???
==221582==    by 0x559EEA3: ???
==221582==    by 0x4E4B2FB: orte_init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libopen-rte.so.40.20.3)
==221582==    by 0x4960322: ompi_mpi_init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so.40.20.3)
==221582==    by 0x4904072: PMPI_Init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so.40.20.3)
==221582==
==221582== 32 bytes in 1 blocks are definitely lost in loss record 23 of 58
==221582==    at 0x483B7F3: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==221582==    by 0x5F673EB: ???
==221582==    by 0x5F691C1: ???
==221582==    by 0x5F3A78C: ???
==221582==    by 0x5E4C05A: ???
==221582==    by 0x5E4DFE8: ???
==221582==    by 0x5E4EE4D: ???
==221582==    by 0x5DDC5EB: ???
==221582==    by 0x559F02F: ???
==221582==    by 0x4E4B2FB: orte_init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libopen-rte.so.40.20.3)
==221582==    by 0x4960322: ompi_mpi_init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so.40.20.3)
==221582==    by 0x4904072: PMPI_Init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so.40.20.3)
==221582==
==221582== 32 bytes in 1 blocks are definitely lost in loss record 24 of 58
==221582==    at 0x483B7F3: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==221582==    by 0x5F673EB: ???
==221582==    by 0x5F691C1: ???
==221582==    by 0x5F3A78C: ???
==221582==    by 0x5E4C05A: ???
==221582==    by 0x5E4DFE8: ???
==221582==    by 0x5E4EE4D: ???
==221582==    by 0x5DDC5EB: ???
==221582==    by 0x559F0F8: ???
==221582==    by 0x4E4B2FB: orte_init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libopen-rte.so.40.20.3)
==221582==    by 0x4960322: ompi_mpi_init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so.40.20.3)
==221582==    by 0x4904072: PMPI_Init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so.40.20.3)
==221582==
==221582== 34 (32 direct, 2 indirect) bytes in 1 blocks are definitely lost in loss record 27 of 58
==221582==    at 0x483B7F3: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==221582==    by 0x5F4EBD8: ???
==221582==    by 0x5F56F4B: ???
==221582==    by 0x5E4AA0D: ???
==221582==    by 0x5EBD9C1: ???
==221582==    by 0x5106FDD: ??? (in /usr/lib/x86_64-linux-gnu/libevent-2.1.so.7.0.0)
==221582==    by 0x510787E: event_base_loop (in /usr/lib/x86_64-linux-gnu/libevent-2.1.so.7.0.0)
==221582==    by 0x5E83D55: ???
==221582==    by 0x4DA6608: start_thread (pthread_create.c:477)
==221582==    by 0x4CCB292: clone (clone.S:95)
==221582==
==221582== 40 bytes in 1 blocks are definitely lost in loss record 31 of 58
==221582==    at 0x483B7F3: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==221582==    by 0x746196F: ???
==221582==    by 0x7460B88: ???
==221582==    by 0x73EC249: ???
==221582==    by 0x73C9C0E: ???
==221582==    by 0x6FB4465: ???
==221582==    by 0x5099020: ??? (in /usr/lib/x86_64-linux-gnu/libhwloc.so.15.1.0)
==221582==    by 0x508C478: ??? (in /usr/lib/x86_64-linux-gnu/libhwloc.so.15.1.0)
==221582==    by 0x4EEFFCF: opal_hwloc_base_get_topology (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libopen-pal.so.40.20.3)
==221582==    by 0x4E14E54: orte_ess_base_proc_binding (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libopen-rte.so.40.20.3)
==221582==    by 0x559FEF2: ???
==221582==    by 0x4E4B2FB: orte_init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libopen-rte.so.40.20.3)
==221582==
==221582== 40 bytes in 1 blocks are definitely lost in loss record 32 of 58
==221582==    at 0x483B7F3: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==221582==    by 0x746196F: ???
==221582==    by 0x7408000: ???
==221582==    by 0x73EC26A: ???
==221582==    by 0x73C9C0E: ???
==221582==    by 0x6FB4465: ???
==221582==    by 0x5099020: ??? (in /usr/lib/x86_64-linux-gnu/libhwloc.so.15.1.0)
==221582==    by 0x508C478: ??? (in /usr/lib/x86_64-linux-gnu/libhwloc.so.15.1.0)
==221582==    by 0x4EEFFCF: opal_hwloc_base_get_topology (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libopen-pal.so.40.20.3)
==221582==    by 0x4E14E54: orte_ess_base_proc_binding (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libopen-rte.so.40.20.3)
==221582==    by 0x559FEF2: ???
==221582==    by 0x4E4B2FB: orte_init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libopen-rte.so.40.20.3)
==221582==
==221582== 40 (32 direct, 8 indirect) bytes in 1 blocks are definitely lost in loss record 33 of 58
==221582==    at 0x483B7F3: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==221582==    by 0x5F673EB: ???
==221582==    by 0x5F691C1: ???
==221582==    by 0x5F3A78C: ???
==221582==    by 0x5E4C05A: ???
==221582==    by 0x5E4DFE8: ???
==221582==    by 0x5E4EE4D: ???
==221582==    by 0x5DDC767: ???
==221582==    by 0x48B5CD6: ompi_comm_init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so.40.20.3)
==221582==    by 0x496094D: ompi_mpi_init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so.40.20.3)
==221582==    by 0x4904072: PMPI_Init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so.40.20.3)
==221582==    by 0x11562E: main (in /home/dorival/01-Code/cpp/test-openmpi-valgrind/build/project)
==221582==
==221582== 56 bytes in 1 blocks are definitely lost in loss record 44 of 58
==221582==    at 0x483B7F3: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==221582==    by 0x928F008: ???
==221582==    by 0x929D654: ???
==221582==    by 0x9239D3E: ???
==221582==    by 0x4EE79C8: mca_btl_base_select (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libopen-pal.so.40.20.3)
==221582==    by 0x7389527: ???
==221582==    by 0x492070A: mca_bml_base_init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so.40.20.3)
==221582==    by 0x4960714: ompi_mpi_init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so.40.20.3)
==221582==    by 0x4904072: PMPI_Init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so.40.20.3)
==221582==    by 0x11562E: main (in /home/dorival/01-Code/cpp/test-openmpi-valgrind/build/project)
==221582==
==221582== 56 bytes in 1 blocks are definitely lost in loss record 45 of 58
==221582==    at 0x483B7F3: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==221582==    by 0x92F9008: ???
==221582==    by 0x97D9017: ???
==221582==    by 0x97D0FD8: ???
==221582==    by 0x9796E15: ???
==221582==    by 0x9797624: ???
==221582==    by 0x92A1910: ???
==221582==    by 0x4944C53: ompi_mtl_base_select (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so.40.20.3)
==221582==    by 0x9222E4D: ???
==221582==    by 0x4953673: mca_pml_base_select (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so.40.20.3)
==221582==    by 0x4960789: ompi_mpi_init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so.40.20.3)
==221582==    by 0x4904072: PMPI_Init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so.40.20.3)
==221582==
==221582== 79 (64 direct, 15 indirect) bytes in 1 blocks are definitely lost in loss record 47 of 58
==221582==    at 0x483B7F3: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==221582==    by 0x738112E: ???
==221582==    by 0x4EC48FC: mca_base_framework_components_open (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libopen-pal.so.40.20.3)
==221582==    by 0x4EF2C25: ??? (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libopen-pal.so.40.20.3)
==221582==    by 0x4ECF008: mca_base_framework_open (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libopen-pal.so.40.20.3)
==221582==    by 0x49606D5: ompi_mpi_init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so.40.20.3)
==221582==    by 0x4904072: PMPI_Init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so.40.20.3)
==221582==    by 0x11562E: main (in /home/dorival/01-Code/cpp/test-openmpi-valgrind/build/project)
==221582==
==221582== 88 bytes in 1 blocks are definitely lost in loss record 48 of 58
==221582==    at 0x483B7F3: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==221582==    by 0x517DA8C: lt__malloc (in /usr/lib/x86_64-linux-gnu/libltdl.so.7.3.1)
==221582==    by 0x517DABD: lt__zalloc (in /usr/lib/x86_64-linux-gnu/libltdl.so.7.3.1)
==221582==    by 0x517FD09: ??? (in /usr/lib/x86_64-linux-gnu/libltdl.so.7.3.1)
==221582==    by 0x5180636: lt_dlopenadvise (in /usr/lib/x86_64-linux-gnu/libltdl.so.7.3.1)
==221582==    by 0x6F897C9: ???
==221582==    by 0x508B6D0: ??? (in /usr/lib/x86_64-linux-gnu/libhwloc.so.15.1.0)
==221582==    by 0x5082A4C: ??? (in /usr/lib/x86_64-linux-gnu/libhwloc.so.15.1.0)
==221582==    by 0x4EEFFAB: opal_hwloc_base_get_topology (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libopen-pal.so.40.20.3)
==221582==    by 0x4E14E54: orte_ess_base_proc_binding (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libopen-rte.so.40.20.3)
==221582==    by 0x559FEF2: ???
==221582==    by 0x4E4B2FB: orte_init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libopen-rte.so.40.20.3)
==221582==
==221582== 88 (24 direct, 64 indirect) bytes in 1 blocks are definitely lost in loss record 49 of 58
==221582==    at 0x483B7F3: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==221582==    by 0x508DF8F: hwloc_bitmap_alloc (in /usr/lib/x86_64-linux-gnu/libhwloc.so.15.1.0)
==221582==    by 0x4E150C9: orte_ess_base_proc_binding (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libopen-rte.so.40.20.3)
==221582==    by 0x559FEF2: ???
==221582==    by 0x4E4B2FB: orte_init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libopen-rte.so.40.20.3)
==221582==    by 0x4960322: ompi_mpi_init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so.40.20.3)
==221582==    by 0x4904072: PMPI_Init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so.40.20.3)
==221582==    by 0x11562E: main (in /home/dorival/01-Code/cpp/test-openmpi-valgrind/build/project)
==221582==
==221582== 104 bytes in 1 blocks are definitely lost in loss record 50 of 58
==221582==    at 0x483B7F3: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==221582==    by 0x7461A3F: ???
==221582==    by 0x74CC1C4: ???
==221582==    by 0x4DAF47E: __pthread_once_slow (pthread_once.c:116)
==221582==    by 0x7461D33: ???
==221582==    by 0x746130C: ???
==221582==    by 0x73EC24E: ???
==221582==    by 0x73C9C0E: ???
==221582==    by 0x6FB4465: ???
==221582==    by 0x5099020: ??? (in /usr/lib/x86_64-linux-gnu/libhwloc.so.15.1.0)
==221582==    by 0x508C478: ??? (in /usr/lib/x86_64-linux-gnu/libhwloc.so.15.1.0)
==221582==    by 0x4EEFFCF: opal_hwloc_base_get_topology (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libopen-pal.so.40.20.3)
==221582==
==221582== 231 bytes in 12 blocks are definitely lost in loss record 51 of 58
==221582==    at 0x483B7F3: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==221582==    by 0x4C4B50E: strdup (strdup.c:42)
==221582==    by 0x92484B3: ???
==221582==    by 0x924885C: ???
==221582==    by 0x9248BD7: ???
==221582==    by 0x9239AAC: ???
==221582==    by 0x4EE79C8: mca_btl_base_select (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libopen-pal.so.40.20.3)
==221582==    by 0x7389527: ???
==221582==    by 0x492070A: mca_bml_base_init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so.40.20.3)
==221582==    by 0x4960714: ompi_mpi_init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so.40.20.3)
==221582==    by 0x4904072: PMPI_Init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so.40.20.3)
==221582==    by 0x11562E: main (in /home/dorival/01-Code/cpp/test-openmpi-valgrind/build/project)
==221582==
==221582== 910 (400 direct, 510 indirect) bytes in 1 blocks are definitely lost in loss record 53 of 58
==221582==    at 0x483B7F3: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==221582==    by 0x73C4F41: ???
==221582==    by 0x73EC274: ???
==221582==    by 0x73C9C0E: ???
==221582==    by 0x6FB4465: ???
==221582==    by 0x5099020: ??? (in /usr/lib/x86_64-linux-gnu/libhwloc.so.15.1.0)
==221582==    by 0x508C478: ??? (in /usr/lib/x86_64-linux-gnu/libhwloc.so.15.1.0)
==221582==    by 0x4EEFFCF: opal_hwloc_base_get_topology (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libopen-pal.so.40.20.3)
==221582==    by 0x4E14E54: orte_ess_base_proc_binding (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libopen-rte.so.40.20.3)
==221582==    by 0x559FEF2: ???
==221582==    by 0x4E4B2FB: orte_init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libopen-rte.so.40.20.3)
==221582==    by 0x4960322: ompi_mpi_init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so.40.20.3)
==221582==
==221582== 1,344 bytes in 1 blocks are definitely lost in loss record 56 of 58
==221582==    at 0x483B7F3: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==221582==    by 0x4E99702: opal_free_list_grow_st (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libopen-pal.so.40.20.3)
==221582==    by 0x9239D2D: ???
==221582==    by 0x4EE79C8: mca_btl_base_select (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libopen-pal.so.40.20.3)
==221582==    by 0x7389527: ???
==221582==    by 0x492070A: mca_bml_base_init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so.40.20.3)
==221582==    by 0x4960714: ompi_mpi_init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so.40.20.3)
==221582==    by 0x4904072: PMPI_Init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so.40.20.3)
==221582==    by 0x11562E: main (in /home/dorival/01-Code/cpp/test-openmpi-valgrind/build/project)
==221582==
==221582== 2,752 bytes in 1 blocks are definitely lost in loss record 57 of 58
==221582==    at 0x483B7F3: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==221582==    by 0x4E99702: opal_free_list_grow_st (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libopen-pal.so.40.20.3)
==221582==    by 0x9239C50: ???
==221582==    by 0x4EE79C8: mca_btl_base_select (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libopen-pal.so.40.20.3)
==221582==    by 0x7389527: ???
==221582==    by 0x492070A: mca_bml_base_init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so.40.20.3)
==221582==    by 0x4960714: ompi_mpi_init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so.40.20.3)
==221582==    by 0x4904072: PMPI_Init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so.40.20.3)
==221582==    by 0x11562E: main (in /home/dorival/01-Code/cpp/test-openmpi-valgrind/build/project)
==221582==
==221582== 2,752 bytes in 1 blocks are definitely lost in loss record 58 of 58
==221582==    at 0x483B7F3: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==221582==    by 0x4E99702: opal_free_list_grow_st (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libopen-pal.so.40.20.3)
==221582==    by 0x9239CC4: ???
==221582==    by 0x4EE79C8: mca_btl_base_select (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libopen-pal.so.40.20.3)
==221582==    by 0x7389527: ???
==221582==    by 0x492070A: mca_bml_base_init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so.40.20.3)
==221582==    by 0x4960714: ompi_mpi_init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so.40.20.3)
==221582==    by 0x4904072: PMPI_Init (in /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so.40.20.3)
==221582==    by 0x11562E: main (in /home/dorival/01-Code/cpp/test-openmpi-valgrind/build/project)
==221582==
==221582== LEAK SUMMARY:
==221582==    definitely lost: 8,209 bytes in 36 blocks
==221582==    indirectly lost: 599 bytes in 20 blocks
==221582==      possibly lost: 0 bytes in 0 blocks
==221582==    still reachable: 2,935 bytes in 15 blocks
==221582==         suppressed: 0 bytes in 0 blocks
==221582== Reachable blocks (those to which a pointer was found) are not shown.
==221582== To see them, rerun with: --leak-check=full --show-leak-kinds=all
==221582==
==221582== For lists of detected and suppressed errors, rerun with: -s
==221582== ERROR SUMMARY: 25 errors from 25 contexts (suppressed: 0 from 0)
```
