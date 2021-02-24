-- File: main_ada_read_write.adb
-- Date: Tue 23 Feb 2021 04:39:09 PM +08
-- Author: WRY wruslan.ump@gmail.com
-- ========================================================

-- IMPORT STANDARD ADA PACKAGES
with Ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

-- IMPORT USER-DEFINED ADA PACKAGES
with pkg_ada_dtstamp;
with pkg_ada_read_file;

-- ========================================================
procedure main_ada_read_write
-- ========================================================
	with SPARK_Mode => on
is 

   -- RENAME STANDARD ADA PACKAGES FOR CONVENIENCE
   package ATIO    renames Ada.Text_IO;
   package ART     renames Ada.Real_Time;
   package ASU     renames Ada.Strings.Unbounded;
   
   -- RENAME USER-DEFINED ADA PACKAGES FOR CONVENIENCE
   package PADTS   renames pkg_ada_dtstamp;
   package PARF    renames pkg_ada_read_file;
   
   -- INPUT FILE
   -- =====================================================
   inp_fhandle : ATIO.File_Type;
   inp_fmode   : ATIO.File_Mode  := ATIO.In_File;
   inp_fname   : String          := "files/bismillah.ngc";
   --inp_fname   : String          := "files/just-KSG.ngc";
   --inp_fname   : String          := "files/linuxcnc-logo.ngc";
   
   inp_UBlineStr : ASU.Unbounded_String;
   inp_lineStr   : String  := ASU.To_String(inp_UBlineStr);
   len_UBlineStr : Natural := 0;
   inp_lineCnt_All     : Integer := 0;
   inp_lineCnt_NonZero : Integer := 0; 
   inp_sliceStr  : String  := " ";
   
   -- OUTPUT FILE
   -- =====================================================
   out_fhandle_00 : ATIO.File_Type;
   out_fmode_00   : ATIO.File_Mode  := ATIO.Out_File;
   out_fname_00 : String          := "files/outfile_level_00.txt";
   
   out_fhandle_01 : ATIO.File_Type;
   out_fmode_01   : ATIO.File_Mode  := ATIO.Out_File;
   out_fname_01 : String          := "files/outfile_level_01.txt";
   
   out_lineStr : ASU.Unbounded_String;
   out_lineCnt : Integer := 999;
   
   -- APPEND FILE
   -- =====================================================
   app_fhandle : ATIO.File_Type;
   app_fmode   : ATIO.File_Mode  := ATIO.Append_File;
   app_fname   : String          := "files/outfile_01.txt";
   app_lineStr : ASU.Unbounded_String;
   app_lineCnt : Integer := 999;
      
   
begin
   PADTS.dtstamp; ATIO.Put_Line ("Bismillah 3 times WRY");
   PADTS.dtstamp; ATIO.Put_Line ("Running inside GNAT Studio Community");
   ATIO.New_Line;
     
   -- (1) Read file. OPEN FILE FOR INPUT. inp_fmode := ATIO.In_File
   -- File must already exist. Open for reading only. Must Open NOT Create.
   -- =====================================================
   -- Read from inp_fhandle (input file) till end of file
   -- Get string length of line read
   -- Write read line to Standard_Output (terminal)
   -- Count total lines in file.
   -- REF: https://en.wikibooks.org/wiki/Ada_Programming/Libraries/Ada.Strings.Unbounded
   -- REF: https://www.radford.edu/~nokie/classes/320/stringio.html
   
   ATIO.Open (inp_fhandle, inp_fmode, inp_fname);
   
   
   -- CREATE FILE FOR OUTPUT. 
   -- New file. If already exists, wipes out previous file.
   -- Must Create NOT Open. Create for writing only.
   ATIO.Create (out_fhandle_00, out_fmode_00, out_fname_00);
      
   inp_lineCnt_All := 0;
   
   while not ATIO.End_Of_File (inp_fhandle) loop
      inp_UBlineStr := ASU.To_Unbounded_String(ATIO.Get_Line (inp_fhandle));
      len_UBlineStr := ASU.Length(inp_UBlineStr);
      inp_lineCnt_All := inp_lineCnt_All + 1;
      
      -- EXTRACT ONLY NON BLANK LINES
      if len_UBlineStr /= 0 then
         inp_lineCnt_NonZero := inp_lineCnt_NonZero + 1;
              
         ATIO.Put ("inp_lineCnt = "   & Integer'image (inp_lineCnt_All) & " ");
         ATIO.Put ("len_UBlineStr = " & Natural'Image (len_UBlineStr) & " ");
         
         -- WRITE OUTPUT TO SCREEN TERMINAL (Standard_Output) 
         ATIO.Put_Line (ATIO.Standard_Output, ASU.To_String (inp_UBLineStr)); 
         -- ATIO.Set_Output(ATIO.Standard_Output);
         -- ATIO.Put_Line (ASU.To_String (inp_UBLineStr)); 
         
         -- WRITE OUTPUT TO TEXT FILE out_fname_00 = "files/outfile_level_00.txt"; 
         ATIO.Put_Line (out_fhandle_00, ASU.To_String (inp_UBLineStr)); 
         -- ATIO.Set_Output(out_fhandle_00);
         -- ATIO.Put_Line (ASU.To_String (inp_UBLineStr)); 
         
      end if;
      -- ATIO.Set_Output(ATIO.Standard_Output);  -- Reset display to terminal
           
   end loop;
   
   ATIO.Put_Line (ATIO.Standard_Output, "Total lines read    = " & Integer'Image (inp_lineCnt_All));
   ATIO.Put_Line (ATIO.Standard_Output, "Non-zero lines read = " & Integer'Image (inp_lineCnt_NonZero));
   
   ATIO.Close (out_fhandle_00);
   ATIO.Close (inp_fhandle);
   
         
   ATIO.New_Line; PADTS.dtstamp; ATIO.Put_Line ("Alhamdulillah 3 times WRY");
-- ========================================================   
end main_ada_read_write;
-- ========================================================

