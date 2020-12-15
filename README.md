# Test OpenMPI with Valgrind

Spoiler alert: **it fails**.

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

Build Docker image and run Test

```bash
docker build -t test-ompi .
docker run --rm test-ompi
```

## Output

```
==7== Memcheck, a memory error detector
==7== Copyright (C) 2002-2017, and GNU GPL'd, by Julian Seward et al.
==7== Using Valgrind-3.16.1 and LibVEX; rerun with -h for copyright info
==7== Command: mpirun --allow-run-as-root -np 1 /tmp/mytest
==7==
hwloc x86 backend cannot work under Valgrind, disabling.
May be reenabled by dumping CPUIDs with hwloc-gather-cpuid
and reloading them under Valgrind with HWLOC_CPUID_PATH.
==7== Warning: noted but unhandled ioctl 0x5441 with no size/direction hints.
==7==    This could cause spurious value errors to appear.
==7==    See README_MISSING_SYSCALL_OR_IOCTL for guidance on writing a proper wrapper.
==11== Warning: invalid file descriptor 1048564 in syscall close()
==11== Warning: invalid file descriptor 1048565 in syscall close()
==11== Warning: invalid file descriptor 1048566 in syscall close()
==11== Warning: invalid file descriptor 1048567 in syscall close()
==11==    Use --log-fd=<number> to select an alternative log fd.
==11== Warning: invalid file descriptor 1048568 in syscall close()
==11== Warning: invalid file descriptor 1048569 in syscall close()
==7==
==7== HEAP SUMMARY:
==7==     in use at exit: 427,108 bytes in 4,385 blocks
==7==   total heap usage: 14,866 allocs, 10,481 frees, 4,016,996 bytes allocated
==7==
==7== 6 bytes in 1 blocks are definitely lost in loss record 568 of 2,775
==7==    at 0x483877F: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==7==    by 0x4D52DEA: strdup (strdup.c:42)
==7==    by 0x4A81A25: copy (preg_raw.c:115)
==7==    by 0x4A814D1: pmix_preg_base_copy (preg_base_stubs.c:112)
==7==    by 0x49E5908: pmix_bfrops_base_value_load (bfrop_base_fns.c:286)
==7==    by 0x49E4F5B: pmix_value_load (bfrop_base_fns.c:41)
==7==    by 0x4BF98A3: prte_odls_base_default_get_add_procs_data (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x4C116AF: prte_plm_base_launch_apps (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x486BCC7: event_process_active_single_queue (event.c:1691)
==7==    by 0x486C436: event_process_active (event.c:1783)
==7==    by 0x486C436: event_base_loop (event.c:2006)
==7==    by 0x10F546: main (in /usr/local/bin/prte)
==7==
==7== 6 bytes in 1 blocks are definitely lost in loss record 569 of 2,775
==7==    at 0x483877F: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==7==    by 0x4D52DEA: strdup (strdup.c:42)
==7==    by 0x4A81A25: copy (preg_raw.c:115)
==7==    by 0x4A814D1: pmix_preg_base_copy (preg_base_stubs.c:112)
==7==    by 0x49E5908: pmix_bfrops_base_value_load (bfrop_base_fns.c:286)
==7==    by 0x49E4F5B: pmix_value_load (bfrop_base_fns.c:41)
==7==    by 0x4B8DB96: prte_pmix_server_register_nspace (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x4BFB10A: prte_odls_base_default_construct_child_list (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x4BFF0F1: prte_odls_default_launch_local_procs (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x4B81191: prte_daemon_recv (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x4C3D990: prte_rml_base_process_msg (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x486BCC7: event_process_active_single_queue (event.c:1691)
==7==
==7== 10 bytes in 1 blocks are definitely lost in loss record 844 of 2,775
==7==    at 0x483877F: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==7==    by 0x4BA8FB7: prte_dss_unpack_string (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x4BA7FB4: prte_dss_unpack_buffer (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x4B78DE9: prte_dt_unpack_app_context (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x4BA7FB4: prte_dss_unpack_buffer (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x4B77FB8: prte_dt_unpack_job (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x4BA7FB4: prte_dss_unpack_buffer (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x4BA8E29: prte_dss_unpack (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x4C0D102: prte_plm_base_recv (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x4C3D990: prte_rml_base_process_msg (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x486BCC7: event_process_active_single_queue (event.c:1691)
==7==    by 0x486C436: event_process_active (event.c:1783)
==7==    by 0x486C436: event_base_loop (event.c:2006)
==7==
==7== 23 bytes in 1 blocks are definitely lost in loss record 1,375 of 2,775
==7==    at 0x483877F: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==7==    by 0x4D52DEA: strdup (strdup.c:42)
==7==    by 0x4A839F2: copy (preg_native.c:537)
==7==    by 0x4A814D1: pmix_preg_base_copy (preg_base_stubs.c:112)
==7==    by 0x49E5908: pmix_bfrops_base_value_load (bfrop_base_fns.c:286)
==7==    by 0x49E4F5B: pmix_value_load (bfrop_base_fns.c:41)
==7==    by 0x4BF97C3: prte_odls_base_default_get_add_procs_data (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x4C116AF: prte_plm_base_launch_apps (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x486BCC7: event_process_active_single_queue (event.c:1691)
==7==    by 0x486C436: event_process_active (event.c:1783)
==7==    by 0x486C436: event_base_loop (event.c:2006)
==7==    by 0x10F546: main (in /usr/local/bin/prte)
==7==
==7== 23 bytes in 1 blocks are definitely lost in loss record 1,376 of 2,775
==7==    at 0x483877F: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==7==    by 0x4D52DEA: strdup (strdup.c:42)
==7==    by 0x4A839F2: copy (preg_native.c:537)
==7==    by 0x4A814D1: pmix_preg_base_copy (preg_base_stubs.c:112)
==7==    by 0x49E5908: pmix_bfrops_base_value_load (bfrop_base_fns.c:286)
==7==    by 0x49E4F5B: pmix_value_load (bfrop_base_fns.c:41)
==7==    by 0x4B8D9C6: prte_pmix_server_register_nspace (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x4BFB10A: prte_odls_base_default_construct_child_list (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x4BFF0F1: prte_odls_default_launch_local_procs (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x4B81191: prte_daemon_recv (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x4C3D990: prte_rml_base_process_msg (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x486BCC7: event_process_active_single_queue (event.c:1691)
==7==
==7== 29 bytes in 2 blocks are definitely lost in loss record 1,593 of 2,775
==7==    at 0x483877F: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==7==    by 0x49E6B76: pmix_bfrops_base_value_xfer (bfrop_base_fns.c:831)
==7==    by 0x49E4FAE: pmix_value_xfer (bfrop_base_fns.c:54)
==7==    by 0x4B907BA: prte_pmix_server_register_nspace (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x4BFB10A: prte_odls_base_default_construct_child_list (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x4BFF0F1: prte_odls_default_launch_local_procs (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x4B81191: prte_daemon_recv (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x4C3D990: prte_rml_base_process_msg (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x486BCC7: event_process_active_single_queue (event.c:1691)
==7==    by 0x486C436: event_process_active (event.c:1783)
==7==    by 0x486C436: event_base_loop (event.c:2006)
==7==    by 0x10F546: main (in /usr/local/bin/prte)
==7==
==7== 64 bytes in 1 blocks are definitely lost in loss record 1,981 of 2,775
==7==    at 0x483877F: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==7==    by 0x4B8F08C: prte_pmix_server_register_nspace (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x4BFB10A: prte_odls_base_default_construct_child_list (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x4BFF0F1: prte_odls_default_launch_local_procs (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x4B81191: prte_daemon_recv (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x4C3D990: prte_rml_base_process_msg (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x486BCC7: event_process_active_single_queue (event.c:1691)
==7==    by 0x486C436: event_process_active (event.c:1783)
==7==    by 0x486C436: event_base_loop (event.c:2006)
==7==    by 0x10F546: main (in /usr/local/bin/prte)
==7==
==7== 66 (32 direct, 34 indirect) bytes in 1 blocks are definitely lost in loss record 1,998 of 2,775
==7==    at 0x483AD7B: realloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==7==    by 0x48F3AB6: pmix_argv_append_nosize (argv.c:78)
==7==    by 0x48F39E8: pmix_argv_append (argv.c:48)
==7==    by 0x48F3F24: pmix_argv_split_inter (argv.c:235)
==7==    by 0x48F4091: pmix_argv_split (argv.c:279)
==7==    by 0x49E17B4: _store_job_info (dstore_base.c:2751)
==7==    by 0x49E2709: pmix_common_dstor_register_job_info (dstore_base.c:2892)
==7==    by 0x4A30A8C: ds21_register_job_info (gds_ds21_base.c:90)
==7==    by 0x495E2B4: server_switchyard (pmix_server.c:3822)
==7==    by 0x4962C09: pmix_server_message_handler (pmix_server.c:4134)
==7==    by 0x4A9C3B5: pmix_ptl_base_process_msg (ptl_base_sendrecv.c:791)
==7==    by 0x486BCC7: event_process_active_single_queue (event.c:1691)
==7==
==7== 88 (24 direct, 64 indirect) bytes in 1 blocks are definitely lost in loss record 2,110 of 2,775
==7==    at 0x483877F: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==7==    by 0x4ED685B: hwloc_bitmap_alloc (bitmap.c:88)
==7==    by 0x4B8F31D: prte_pmix_server_register_nspace (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x4BFB10A: prte_odls_base_default_construct_child_list (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x4BFF0F1: prte_odls_default_launch_local_procs (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x4B81191: prte_daemon_recv (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x4C3D990: prte_rml_base_process_msg (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x486BCC7: event_process_active_single_queue (event.c:1691)
==7==    by 0x486C436: event_process_active (event.c:1783)
==7==    by 0x486C436: event_base_loop (event.c:2006)
==7==    by 0x10F546: main (in /usr/local/bin/prte)
==7==
==7== 168 bytes in 1 blocks are definitely lost in loss record 2,480 of 2,775
==7==    at 0x483877F: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==7==    by 0x4C4A1E0: prte_state_base_activate_job_state (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x4C101FB: prte_plm_base_daemons_reported (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x486BCC7: event_process_active_single_queue (event.c:1691)
==7==    by 0x486C436: event_process_active (event.c:1783)
==7==    by 0x486C436: event_base_loop (event.c:2006)
==7==    by 0x10F546: main (in /usr/local/bin/prte)
==7==
==7== 216 (136 direct, 80 indirect) bytes in 1 blocks are definitely lost in loss record 2,494 of 2,775
==7==    at 0x483877F: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==7==    by 0x4B92928: interim (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x486BCC7: event_process_active_single_queue (event.c:1691)
==7==    by 0x486C436: event_process_active (event.c:1783)
==7==    by 0x486C436: event_base_loop (event.c:2006)
==7==    by 0x10F546: main (in /usr/local/bin/prte)
==7==
==7== 216 (64 direct, 152 indirect) bytes in 1 blocks are definitely lost in loss record 2,495 of 2,775
==7==    at 0x483877F: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==7==    by 0x4B77E37: prte_dt_unpack_job (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x4BA7FB4: prte_dss_unpack_buffer (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x4BA8E29: prte_dss_unpack (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x4BFA533: prte_odls_base_default_construct_child_list (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x4BFF0F1: prte_odls_default_launch_local_procs (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x4B81191: prte_daemon_recv (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x4C3D990: prte_rml_base_process_msg (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x486BCC7: event_process_active_single_queue (event.c:1691)
==7==    by 0x486C436: event_process_active (event.c:1783)
==7==    by 0x486C436: event_base_loop (event.c:2006)
==7==    by 0x10F546: main (in /usr/local/bin/prte)
==7==
==7== 240 bytes in 3 blocks are definitely lost in loss record 2,586 of 2,775
==7==    at 0x483877F: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==7==    by 0x4964211: pmix_obj_new (pmix_object.h:486)
==7==    by 0x49640B9: pmix_obj_new_debug (pmix_object.h:268)
==7==    by 0x4966C98: new_tracker (pmix_server_ops.c:513)
==7==    by 0x496A41E: pmix_server_fence (pmix_server_ops.c:990)
==7==    by 0x495EEBC: server_switchyard (pmix_server.c:3865)
==7==    by 0x4962C09: pmix_server_message_handler (pmix_server.c:4134)
==7==    by 0x4A9C3B5: pmix_ptl_base_process_msg (ptl_base_sendrecv.c:791)
==7==    by 0x486BCC7: event_process_active_single_queue (event.c:1691)
==7==    by 0x486C436: event_process_active (event.c:1783)
==7==    by 0x486C436: event_base_loop (event.c:2006)
==7==    by 0x49911B9: progress_engine (pmix_progress_threads.c:234)
==7==    by 0x4CABEA6: start_thread (pthread_create.c:477)
==7==
==7== 1,392 (616 direct, 776 indirect) bytes in 1 blocks are definitely lost in loss record 2,749 of 2,775
==7==    at 0x483877F: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==7==    by 0x4BADEAC: prte_convert_nspace_to_jobid (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x4C16BFA: prte_plm_base_create_jobid (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x4C10C37: prte_plm_base_setup_job (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x486BCC7: event_process_active_single_queue (event.c:1691)
==7==    by 0x486C436: event_process_active (event.c:1783)
==7==    by 0x486C436: event_base_loop (event.c:2006)
==7==    by 0x10F546: main (in /usr/local/bin/prte)
==7==
==7== 2,048 bytes in 1 blocks are definitely lost in loss record 2,756 of 2,775
==7==    at 0x483877F: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==7==    by 0x4BA2F1E: prte_dss_buffer_extend (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x4BA4FE0: prte_dss_pack_int32 (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x4BA5055: prte_dss_pack (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x4BCEDB6: prte_util_generate_ppn (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x4BF94DF: prte_odls_base_default_get_add_procs_data (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x4C116AF: prte_plm_base_launch_apps (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x486BCC7: event_process_active_single_queue (event.c:1691)
==7==    by 0x486C436: event_process_active (event.c:1783)
==7==    by 0x486C436: event_base_loop (event.c:2006)
==7==    by 0x10F546: main (in /usr/local/bin/prte)
==7==
==7== 4,957 (184 direct, 4,773 indirect) bytes in 1 blocks are definitely lost in loss record 2,765 of 2,775
==7==    at 0x483877F: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==7==    by 0x4BE5D46: rte_init (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x4B70820: prte_init (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x10CD44: main (in /usr/local/bin/prte)
==7==
==7== 29,441 (16 direct, 29,425 indirect) bytes in 1 blocks are definitely lost in loss record 2,772 of 2,775
==7==    at 0x483AB65: calloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==7==    by 0x49EE2F8: pmix_bfrops_base_copy_topology (bfrop_base_copy.c:1216)
==7==    by 0x49E6DB4: pmix_bfrops_base_value_xfer (bfrop_base_fns.c:880)
==7==    by 0x494AFB2: PMIx_Store_internal (pmix_server.c:1862)
==7==    by 0x49418B6: PMIx_server_init (pmix_server.c:459)
==7==    by 0x4B888E2: pmix_server_init (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x4BE5B7E: rte_init (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x4B70820: prte_init (in /usr/local/lib/libprrte.so.2.0.0)
==7==    by 0x10CD44: main (in /usr/local/bin/prte)
==7==
==7== 98,475 (752 direct, 97,723 indirect) bytes in 1 blocks are definitely lost in loss record 2,775 of 2,775
==7==    at 0x483877F: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==7==    by 0x4A3517A: pmix_obj_new (pmix_object.h:486)
==7==    by 0x4A35022: pmix_obj_new_debug (pmix_object.h:268)
==7==    by 0x4A3734E: get_tracker (gds_hash.c:287)
==7==    by 0x4A4001A: hash_cache_job_info (gds_hash.c:1234)
==7==    by 0x49431C2: _register_nspace (pmix_server.c:627)
==7==    by 0x486BCC7: event_process_active_single_queue (event.c:1691)
==7==    by 0x486C436: event_process_active (event.c:1783)
==7==    by 0x486C436: event_base_loop (event.c:2006)
==7==    by 0x49911B9: progress_engine (pmix_progress_threads.c:234)
==7==    by 0x4CABEA6: start_thread (pthread_create.c:477)
==7==    by 0x4DC2D8E: clone (clone.S:95)
==7==
==7== LEAK SUMMARY:
==7==    definitely lost: 4,441 bytes in 21 blocks
==7==    indirectly lost: 133,027 bytes in 786 blocks
==7==      possibly lost: 0 bytes in 0 blocks
==7==    still reachable: 289,640 bytes in 3,578 blocks
==7==         suppressed: 0 bytes in 0 blocks
==7== Reachable blocks (those to which a pointer was found) are not shown.
==7== To see them, rerun with: --leak-check=full --show-leak-kinds=all
==7==
==7== For lists of detected and suppressed errors, rerun with: -s
==7== ERROR SUMMARY: 18 errors from 18 contexts (suppressed: 0 from 0)

```
