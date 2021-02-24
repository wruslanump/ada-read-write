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
   
   -- PART 1 ==============================================
   inp_fhandle_00 : ATIO.File_Type;
   inp_fmode_00   : ATIO.File_Mode  := ATIO.In_File;
   inp_fname_00   : String          := "files/bismillah.ngc";
  
   out_fhandle_00 : ATIO.File_Type;
   out_fmode_00   : ATIO.File_Mode  := ATIO.Out_File;
   out_fname_00 : String          := "files/outfile_level_00.txt";
   
   -- PART 2 ==============================================
   inp_fhandle_01 : ATIO.File_Type;
   inp_fmode_01   : ATIO.File_Mode  := ATIO.In_File;
   inp_fname_01   : String          := "files/outfile_level_00.txt";
   
   out_fhandle_01 : ATIO.File_Type;
   out_fmode_01   : ATIO.File_Mode  := ATIO.Out_File;
   out_fname_01   : String          := "files/outfile_level_01.txt";
   
   -- =======================================================
   inp_UBlineStr : ASU.Unbounded_String;
   inp_lineStr   : String  := ASU.To_String(inp_UBlineStr);
   len_UBlineStr : Natural := 0;
   inp_lineCnt_All     : Integer := 0;
   inp_lineCnt_NonZero : Integer := 0; 
   inp_sliceStr  : String  := " ";
   
   out_lineStr : ASU.Unbounded_String;
   out_lineCnt : Integer := 999;
   
      
   
begin
   PADTS.dtstamp; ATIO.Put_Line ("Bismillah 3 times WRY");
   PADTS.dtstamp; ATIO.Put_Line ("Running inside GNAT Studio Community");
   ATIO.New_Line;
   
    -- =====================================================
   -- PART 1 Read input file then write output file 
   -- =====================================================
   -- Input file -- Output file
   ATIO.Open   (inp_fhandle_00, inp_fmode_00, inp_fname_00);
   ATIO.Create (out_fhandle_00, out_fmode_00, out_fname_00);
      
   inp_lineCnt_All     := 0;
   inp_lineCnt_NonZero := 0;
     
   while not ATIO.End_Of_File (inp_fhandle_00) loop
      
      inp_UBlineStr := ASU.To_Unbounded_String(ATIO.Get_Line (inp_fhandle_00));
      len_UBlineStr := ASU.Length(inp_UBlineStr);
      inp_lineCnt_All := inp_lineCnt_All + 1;
      
      -- EXTRACT ONLY NON BLANK LINES
      if len_UBlineStr /= 0 then
         inp_lineCnt_NonZero := inp_lineCnt_NonZero + 1;
              
         ATIO.Put ("inp_lineCnt = "   & Integer'image (inp_lineCnt_All) & " ");
         ATIO.Put ("len_UBlineStr = " & Natural'Image (len_UBlineStr) & " ");
         
         -- WRITE OUTPUT TO SCREEN TERMINAL (Standard_Output) AND FILE
         ATIO.Put_Line (ATIO.Standard_Output, ASU.To_String (inp_UBLineStr)); 
         ATIO.Put_Line (out_fhandle_00, ASU.To_String (inp_UBLineStr)); 
                
      end if;
                 
   end loop;
   
   ATIO.Put_Line (ATIO.Standard_Output, "Total lines read    = " & Integer'Image (inp_lineCnt_All));
   ATIO.Put_Line (ATIO.Standard_Output, "Non-zero lines read = " & Integer'Image (inp_lineCnt_NonZero));
   
   ATIO.Close (out_fhandle_00);
   ATIO.Close (inp_fhandle_00);
   
   -- Delay to make closing files take effect
   PADTS.exec_delay_sec (5);
   
   
   -- =====================================================
   -- PART 2
   -- =====================================================
   -- Input file  -- Output file
   ATIO.Open   (inp_fhandle_01, inp_fmode_01, inp_fname_01);
   ATIO.Open   (out_fhandle_01, out_fmode_01, out_fname_01);
     
   -- READLINE FROM INPUT FILE LINE-BY-LINE
   while not ATIO.End_Of_File (inp_fhandle_01) loop
      
      
      inp_UBlineStr := ASU.To_Unbounded_String(ATIO.Get_Line (inp_fhandle_01));
      
      
      -- WRITE TO OUTPUT FILE  AND TO TERMINAL 
      -- =====================================================
      ATIO.Put_Line (ATIO.Standard_Output, ASU.To_String (inp_UBLineStr)); 
      ATIO.Put_Line (out_fhandle_01, ASU.To_String (inp_UBLineStr));
   
      
   
   
   
   
      
   end loop;   
   
   ATIO.Close (out_fhandle_01);
   ATIO.Close (inp_fhandle_01);
         
   ATIO.New_Line; PADTS.dtstamp; ATIO.Put_Line ("Alhamdulillah 3 times WRY");
-- ========================================================   
end main_ada_read_write;
-- ========================================================

