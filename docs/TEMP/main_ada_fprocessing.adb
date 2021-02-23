-- File	: main_ada_fprocessing.adb
-- Date	: Sun 20 Dec 2020 10:34:19 AM +08
-- Env	: Linux HPEliteBook8470p-Ub2004-rt38 5.4.66-rt38 
-- #1 SMP PREEMPT_RT Sat Sep 26 16:51:59 +08 2020 x86_64 x86_64 x86_64 GNU/Linux
-- Author: WRY wruslandr@gmail.com
-- ========================================================
-- GNAT Studio Community 2020 (20200427) hosted on x86_64-pc-linux-gnu
-- GNAT 9.3.1 targetting x86_64-linux-gnu
-- SPARK Community 2020 (20200818)

-- ADA STANDARD PACKAGES
-- with Ada.Text_IO;
with Ada.Text_IO;
use Ada.Text_IO;

-- ADA STRING MANIPULATION
-- Ada has three(3) types of strings:
-- fixed length, bounded length, unbounded.
with Ada.Strings;
with Ada.Strings.Fixed;
with Ada.Strings.Bounded;
with Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO;
with Ada.Command_Line;

-- WRY CREATED PACKAGES 
with pkg_ada_dtstamp;
with pkg_ada_fprocessing;

-- ========================================================
procedure main_ada_fprocessing is
   
-- RENAMING STANDARD PACKAGES FOR CONVENIENCE
   package ATIO    renames Ada.Text_IO;
     
-- RENAMING ADA STRING PACKAGES
   package AS     renames Ada.Strings;
   package ASF    renames Ada.Strings.Fixed;
   package ASB    renames Ada.Strings.Bounded;
   package ASU    renames Ada.Strings.Unbounded;
   package ASUTIO renames Ada.Strings.Unbounded.Text_IO;
   package ACL    renames Ada.Command_Line;  
   
-- RENAMING WRY CREATED PACKAGES
   package PADTS  renames pkg_ada_dtstamp;
   package PAFP   renames pkg_ada_fprocessing;  
   
   datestring : ASU.Unbounded_String; -- no initialization needed, default empty
   timestring : ASU.Unbounded_String; -- no initialization needed, default empty
      
   Str : String (1..15);
   UBStr  : ASU.Unbounded_String; 
   lenUBStr : Integer := 0;
   
   
   the_fhandle1 : ATIO.File_Type;
   the_fmode1   : ATIO.File_Mode := ATIO.Out_File;   -- {IN_FILE, OUT_FILE, APPEND_FILE}
   the_fname1   : String := "../files/test1.txt";
   
   the_fhandle2 : ATIO.File_Type;
   the_fmode2   : ATIO.File_Mode := ATIO.Append_File; -- {IN_FILE, OUT_FILE, APPEND_FILE}
   the_fname2   : String := "../files/test2.txt";
   
   the_fhandle3 : ATIO.File_Type;
   the_fmode3   : ATIO.File_Mode := ATIO.In_File;  -- {IN_FILE, OUT_FILE, APPEND_FILE}
   the_fname3   : String := "../files/test3.txt";
   
   the_lineString : ASU.Unbounded_String;
   
   the_fhandle4 : ATIO.File_Type;
   the_fmode4   : ATIO.File_Mode := ATIO.Out_File;  -- {IN_FILE, OUT_FILE, APPEND_FILE}
   the_fname4   : String := "../files/test4.txt";
     
begin
     
   PADTS.dtstamp; ATIO.Put_Line ("Bismillah 3 times WRY");
   PADTS.dtstamp; ATIO.Put_Line ("Running inside GNAT Studio Community (20200427)");
   PADTS.dtstamp; ATIO.Put_Line ("Started main_ada_fprocessing.adb");
   ATIO.New_Line;
   
   -- =====================================================
   -- STRING MANIPULATION (Unbounded_String -> String)
   -- =====================================================   
     
   Str := "String (1..15) ";  -- Length Must be exact as defined
   
   UBStr := ASU.To_Unbounded_String ("Alhamdulillah Hirrabil Alamin WRY.");
   PADTS.dtstamp; PAFP.ExecA_read_unbounded_string (UBStr);  
   
   lenUBStr := PAFP.GetA_length_unbounded_string (UBStr);
   PADTS.dtstamp; ATIO.Put ("Length of UBStr = ");
   ATIO.Put_Line (Integer'Image(lenUBStr));
   
   PADTS.dtstamp; PAFP.ExecA_slice_unbounded_string(UBStr, 5, 25);
   ATIO.New_Line;
   
   -- =====================================================
   -- (1) CREATE FILE FOR OUTPUT. the_fmode1 := ATIO.Out_File
   -- New file. If already exists, wipes out previous file.
   -- Must Create NOT Open. Create for writing only.
   -- =====================================================  
   PADTS.dtstamp; ATIO.Put_Line (Standard_Output, "Run ATIO.Create (the_fhandle1, the_fmode1, the_fname1);");
   ATIO.Create (the_fhandle1, the_fmode1, the_fname1);
   
   -- -- Make the default output to the_fhandle1
   PADTS.dtstamp; ATIO.Put_Line (Standard_Output, "Run ATIO.Set_Output (the_fhandle1);");
   PADTS.dtstamp; ATIO.Put_Line (Standard_Output, "Everything after this will be written to the_fhandle1.");
   
   ATIO.Set_Output(the_fhandle1);
   PADTS.dtstamp; ATIO.Put_Line ("Run ATIO.Set_Output (the_fhandle1);");
   PADTS.dtstamp; ATIO.Put_Line ("Everything after this will be written to the_fhandle1.");
   
        -- Everything now is written to the_fhandle1  
        PADTS.dtstamp; ATIO.Put_Line("Bismillah 3 times WRY.");
        PADTS.dtstamp; ATIO.Put_Line ("This is inside the file.");
        PADTS.dtstamp; ATIO.Put_Line ("Alhamdulillah 3 times WRY.");
        PADTS.dtstamp; ATIO.Put_Line (the_fhandle1, "Run ATIO.Close (the_fhandle1);");
   
   ATIO.Close (the_fhandle1);
   
   -- Return to the default Standard_Output
   ATIO.Set_Output (Standard_Output); 
   PADTS.dtstamp; ATIO.Put_Line ("Run ATIO.Close (the_fhandle1);");  
   PADTS.dtstamp; ATIO.Put_Line ("Run ATIO.Set_Output (Standard_Output);");
   PADTS.dtstamp; ATIO.Put_Line (Standard_Output, "Everything after this will be written to Standard_Output.");   
   ATIO.New_Line;
  
   -- =====================================================
   -- (2) OPEN FILE FOR APPEND. the_fmode2 := ATIO.Append_File
   -- File must already exist. Previous contents in file remain. 
   -- Must Open NOT Create. Open for appending only.
   -- =====================================================
   PADTS.dtstamp; ATIO.Put_Line (Standard_Output, "Run ATIO.Open (the_fhandle2, the_fmode2, the_fname2);");
   ATIO.Open (the_fhandle2, the_fmode2, the_fname2);
   
   -- -- Make the default output to the_fhandle2
   PADTS.dtstamp; ATIO.Put_Line (Standard_Output, "Run ATIO.Set_Output (the_fhandle2);");
   PADTS.dtstamp; ATIO.Put_Line (Standard_Output, "Everything after this will be written to the_fhandle2.");
   ATIO.Set_Output(the_fhandle2);
   
   PADTS.dtstamp; ATIO.Put_Line ("Run ATIO.Set_Output (the_fhandle2);");
   PADTS.dtstamp; ATIO.Put_Line ("Everything after this will be written to the_fhandle2.");
   
        -- Everything now is written to the_fhandle2  
        PADTS.dtstamp; ATIO.Put_Line("Bismillah 3 times WRY.");
        PADTS.dtstamp; ATIO.Put_Line ("This is inside the file.");
        PADTS.dtstamp; ATIO.Put_Line ("Alhamdulillah 3 times WRY.");
        PADTS.dtstamp; ATIO.Put_Line (the_fhandle2, "Run ATIO.Close (the_fhandle2);");
        PADTS.dtstamp; ATIO.Put_Line ("===================================================================");
   
   ATIO.Close (the_fhandle2);
   
   -- Return to the default Standard_Output
   ATIO.Set_Output (Standard_Output); 
   PADTS.dtstamp; ATIO.Put_Line ("Run ATIO.Close (the_fhandle2);");  
   PADTS.dtstamp; ATIO.Put_Line ("Run ATIO.Set_Output (Standard_Output);");
   PADTS.dtstamp; ATIO.Put_Line (Standard_Output, "Everything after this will be written to Standard_Output.");   
   ATIO.New_Line;
   
   -- =====================================================
   -- (3) OPEN FILE FOR INPUT. the_fmode3 := ATIO.In_File
   -- File must already exist. Open for reading only. Must Open NOT Create.
   --
   -- (4) CREATE FILE FOR OUTPUT. the_fmode4 := ATIO.Out_File
   -- New file. If already exists, wipes out previous file.
   -- =====================================================  
   PADTS.dtstamp; ATIO.Put_Line (Standard_Output, "OPEN FOR READING - ATIO.Open (the_fhandle3, the_fmode3, the_fname3);");
   ATIO.Open (the_fhandle3, the_fmode3, the_fname3);
   
   PADTS.dtstamp; ATIO.Put_Line (Standard_Output, "CREATE FOR WRITING - ATIO.Create (the_fhandle4, the_fmode3, the_fname3);");
   ATIO.Create (the_fhandle4, the_fmode4, the_fname4);
   
   -- READ FROM the_fhandle3, THEN WRITE TO the_fhandle4. TEST WITH LOOP.
   for idx in 1..20 loop 
      the_lineString := ASU.To_Unbounded_String(ATIO.Get_Line (the_fhandle3));
      ATIO.Put_Line (Standard_Output, ASU.To_String (the_LineString));
      ATIO.Put_Line (the_fhandle4, ASU.To_String (the_LineString));
   end loop;
      
   ATIO.Close (the_fhandle3);
   ATIO.Close (the_fhandle4);
   
   -- Return to the default Standard_Output
   ATIO.Set_Output (Standard_Output); 
    
   -- ======================================================== 
   ATIO.New_line;
   PADTS.dtstamp; ATIO.Put_Line ("Successfully ended main_ada_fprocessing.adb");
   PADTS.dtstamp; ATIO.Put_Line ("Alhamdulillah 3 times WRY");
  
-- ========================================================   
-- Catch every possible error using built-in package Ada.Standard
-- ========================================================
exception
	when Constraint_Error => ATIO.Put_Line("Constraint_Error raised.");
	when Program_Error    => ATIO.Put_Line("Program_Error raised.");
	when Storage_Error    => ATIO.Put_Line("Storage_Error raised.");
	when Tasking_Error    => ATIO.Put_Line("Task_Error raised.");
	when Others           => ATIO.Put_Line("Others raised. Unknown error.");
      
  -- null;
end main_ada_fprocessing;
-- ========================================================

