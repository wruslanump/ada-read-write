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
   inp_lineCnt   : Integer := 999;
   inp_sliceStr  : ASU.Unbounded_String;
   
   -- OUTPUT FILE
   -- =====================================================
   out_fhandle : ATIO.File_Type;
   out_fmode   : ATIO.File_Mode  := ATIO.Out_File;
   out_fname_00 : String          := "files/outfile_level_00.txt";
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
   
   ATIO.Open (inp_fhandle, inp_fmode, inp_fname);
   inp_lineCnt := 0;
   while not ATIO.End_Of_File (inp_fhandle) loop
      inp_UBlineStr := ASU.To_Unbounded_String(ATIO.Get_Line (inp_fhandle));
      
      -- REF: https://en.wikibooks.org/wiki/Ada_Programming/Libraries/Ada.Strings.Unbounded
      -- function Length(Source : in Unbounded_String) return Natural;
      len_UBlineStr := ASU.Length(inp_UBlineStr);
      inp_lineCnt := inp_lineCnt + 1;
       
      -- FIND IF FIRST CHAR IS "("
      -- function Unbounded_Slice  (Source : in Unbounded_String; Low : in Positive; High  : in Natural) return Unbounded_String;
      -- inp_sliceStr := ASU.Unbounded_Slice (inp_UBlineStr, 1, 1);
      
      ATIO.Put ("inp_lineCnt = "   & Integer'image (inp_lineCnt) & " ");
      ATIO.Put ("len_UBlineStr = " & Natural'Image (len_UBlineStr) & " ");
      ATIO.Put ("first char inp_UBlineStr = " & ASU.To_String (inp_sliceStr) & " ");
      ATIO.Put_Line (ATIO.Standard_Output, ASU.To_String (inp_UBLineStr)); 
         
      
      
   end loop;
   ATIO.Put_Line (ATIO.Standard_Output, "Total lines read = " & Integer'Image (inp_lineCnt));
      
   -- (2) Process file
   
   
   
   
   -- (3) Write file
   
   
      
   ATIO.New_Line; PADTS.dtstamp; ATIO.Put_Line ("Alhamdulillah 3 times WRY");
-- ========================================================   
end main_ada_read_write;
-- ========================================================

