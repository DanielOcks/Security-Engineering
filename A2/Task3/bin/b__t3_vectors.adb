pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__t3_vectors.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__t3_vectors.adb");
pragma Suppress (Overflow_Check);
with Ada.Exceptions;

package body ada_main is

   E065 : Short_Integer; pragma Import (Ada, E065, "system__os_lib_E");
   E016 : Short_Integer; pragma Import (Ada, E016, "ada__exceptions_E");
   E012 : Short_Integer; pragma Import (Ada, E012, "system__soft_links_E");
   E010 : Short_Integer; pragma Import (Ada, E010, "system__exception_table_E");
   E033 : Short_Integer; pragma Import (Ada, E033, "ada__containers_E");
   E061 : Short_Integer; pragma Import (Ada, E061, "ada__io_exceptions_E");
   E007 : Short_Integer; pragma Import (Ada, E007, "ada__strings_E");
   E048 : Short_Integer; pragma Import (Ada, E048, "ada__strings__maps_E");
   E052 : Short_Integer; pragma Import (Ada, E052, "ada__strings__maps__constants_E");
   E071 : Short_Integer; pragma Import (Ada, E071, "interfaces__c_E");
   E019 : Short_Integer; pragma Import (Ada, E019, "system__exceptions_E");
   E073 : Short_Integer; pragma Import (Ada, E073, "system__object_reader_E");
   E042 : Short_Integer; pragma Import (Ada, E042, "system__dwarf_lines_E");
   E090 : Short_Integer; pragma Import (Ada, E090, "system__soft_links__initialize_E");
   E032 : Short_Integer; pragma Import (Ada, E032, "system__traceback__symbolic_E");
   E179 : Short_Integer; pragma Import (Ada, E179, "ada__numerics_E");
   E094 : Short_Integer; pragma Import (Ada, E094, "ada__strings__utf_encoding_E");
   E100 : Short_Integer; pragma Import (Ada, E100, "ada__tags_E");
   E006 : Short_Integer; pragma Import (Ada, E006, "ada__strings__text_buffers_E");
   E175 : Short_Integer; pragma Import (Ada, E175, "gnat_E");
   E108 : Short_Integer; pragma Import (Ada, E108, "ada__streams_E");
   E120 : Short_Integer; pragma Import (Ada, E120, "system__file_control_block_E");
   E119 : Short_Integer; pragma Import (Ada, E119, "system__finalization_root_E");
   E117 : Short_Integer; pragma Import (Ada, E117, "ada__finalization_E");
   E116 : Short_Integer; pragma Import (Ada, E116, "system__file_io_E");
   E170 : Short_Integer; pragma Import (Ada, E170, "system__storage_pools_E");
   E168 : Short_Integer; pragma Import (Ada, E168, "system__finalization_masters_E");
   E141 : Short_Integer; pragma Import (Ada, E141, "ada__calendar_E");
   E106 : Short_Integer; pragma Import (Ada, E106, "ada__text_io_E");
   E172 : Short_Integer; pragma Import (Ada, E172, "system__pool_global_E");
   E122 : Short_Integer; pragma Import (Ada, E122, "aunit_E");
   E124 : Short_Integer; pragma Import (Ada, E124, "aunit__memory_E");
   E131 : Short_Integer; pragma Import (Ada, E131, "aunit__memory__utils_E");
   E128 : Short_Integer; pragma Import (Ada, E128, "ada_containers__aunit_lists_E");
   E166 : Short_Integer; pragma Import (Ada, E166, "aunit__tests_E");
   E135 : Short_Integer; pragma Import (Ada, E135, "aunit__time_measure_E");
   E133 : Short_Integer; pragma Import (Ada, E133, "aunit__test_results_E");
   E126 : Short_Integer; pragma Import (Ada, E126, "aunit__assertions_E");
   E178 : Short_Integer; pragma Import (Ada, E178, "vectors_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E126 := E126 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "aunit__assertions__finalize_spec");
      begin
         F1;
      end;
      E133 := E133 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "aunit__test_results__finalize_spec");
      begin
         F2;
      end;
      declare
         procedure F3;
         pragma Import (Ada, F3, "aunit__tests__finalize_spec");
      begin
         E166 := E166 - 1;
         F3;
      end;
      E172 := E172 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "system__pool_global__finalize_spec");
      begin
         F4;
      end;
      E106 := E106 - 1;
      declare
         procedure F5;
         pragma Import (Ada, F5, "ada__text_io__finalize_spec");
      begin
         F5;
      end;
      E168 := E168 - 1;
      declare
         procedure F6;
         pragma Import (Ada, F6, "system__finalization_masters__finalize_spec");
      begin
         F6;
      end;
      declare
         procedure F7;
         pragma Import (Ada, F7, "system__file_io__finalize_body");
      begin
         E116 := E116 - 1;
         F7;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (Ada, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;
   pragma Favor_Top_Level (No_Param_Proc);

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 1;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;

      Runtime_Initialize (1);

      Finalize_Library_Objects := finalize_library'access;

      Ada.Exceptions'Elab_Spec;
      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E010 := E010 + 1;
      Ada.Containers'Elab_Spec;
      E033 := E033 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E061 := E061 + 1;
      Ada.Strings'Elab_Spec;
      E007 := E007 + 1;
      Ada.Strings.Maps'Elab_Spec;
      E048 := E048 + 1;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E052 := E052 + 1;
      Interfaces.C'Elab_Spec;
      E071 := E071 + 1;
      System.Exceptions'Elab_Spec;
      E019 := E019 + 1;
      System.Object_Reader'Elab_Spec;
      E073 := E073 + 1;
      System.Dwarf_Lines'Elab_Spec;
      E042 := E042 + 1;
      System.Os_Lib'Elab_Body;
      E065 := E065 + 1;
      System.Soft_Links.Initialize'Elab_Body;
      E090 := E090 + 1;
      E012 := E012 + 1;
      System.Traceback.Symbolic'Elab_Body;
      E032 := E032 + 1;
      E016 := E016 + 1;
      Ada.Numerics'Elab_Spec;
      E179 := E179 + 1;
      Ada.Strings.Utf_Encoding'Elab_Spec;
      E094 := E094 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Tags'Elab_Body;
      E100 := E100 + 1;
      Ada.Strings.Text_Buffers'Elab_Spec;
      Ada.Strings.Text_Buffers'Elab_Body;
      E006 := E006 + 1;
      Gnat'Elab_Spec;
      E175 := E175 + 1;
      Ada.Streams'Elab_Spec;
      E108 := E108 + 1;
      System.File_Control_Block'Elab_Spec;
      E120 := E120 + 1;
      System.Finalization_Root'Elab_Spec;
      System.Finalization_Root'Elab_Body;
      E119 := E119 + 1;
      Ada.Finalization'Elab_Spec;
      E117 := E117 + 1;
      System.File_Io'Elab_Body;
      E116 := E116 + 1;
      System.Storage_Pools'Elab_Spec;
      E170 := E170 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E168 := E168 + 1;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E141 := E141 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E106 := E106 + 1;
      System.Pool_Global'Elab_Spec;
      System.Pool_Global'Elab_Body;
      E172 := E172 + 1;
      E124 := E124 + 1;
      E122 := E122 + 1;
      E131 := E131 + 1;
      E128 := E128 + 1;
      Aunit.Tests'Elab_Spec;
      E166 := E166 + 1;
      Aunit.Time_Measure'Elab_Spec;
      E135 := E135 + 1;
      Aunit.Test_Results'Elab_Spec;
      E133 := E133 + 1;
      Aunit.Assertions'Elab_Spec;
      Aunit.Assertions'Elab_Body;
      E126 := E126 + 1;
      E178 := E178 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_t3_vectors");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      if gnat_argc = 0 then
         gnat_argc := argc;
         gnat_argv := argv;
      end if;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   C:\Users\Daniel\Desktop\Security-Engineering-main\A2\Task3\bin\vectors.o
   --   C:\Users\Daniel\Desktop\Security-Engineering-main\A2\Task3\bin\t3_vectors.o
   --   -LC:\Users\Daniel\Desktop\Security-Engineering-main\A2\Task3\bin\
   --   -LC:\Users\Daniel\Desktop\Security-Engineering-main\A2\Task3\bin\
   --   -LC:\gnat\2021(1)\lib\aunit\
   --   -LC:/gnat/2021(1)/lib/gcc/x86_64-w64-mingw32/10.3.1/adalib/
   --   -static
   --   -lgnat
   --   -lm
   --   -Wl,--stack=0x2000000
--  END Object file/option list   

end ada_main;
