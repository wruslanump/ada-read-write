-- File	: pkg_ada_read_file.adb
-- Date	: Tue 23 Feb 2021 04:39:09 PM +08
-- Env	: Linux HPEliteBook8470p-Ub2004-rt38 5.4.66-rt38 
-- #1 SMP PREEMPT_RT Sat Sep 26 16:51:59 +08 2020 x86_64 x86_64 x86_64 GNU/Linux
-- Author: WRY wruslandr@gmail.com
-- ========================================================

-- ADA STANDARD PACKAGES
with Ada.Text_IO;
with Ada.Numerics;

-- ADA STRING MANIPULATION
-- Ada has three(3) types of strings: fixed length, bounded length, unbounded.
with Ada.Strings;
with Ada.Strings.Fixed;
with Ada.Strings.Bounded;
with Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO;
with Ada.Command_Line;


-- WRY CREATED PACKAGES 
with pkg_ada_dtstamp;

-- ========================================================
package body pkg_ada_read_file 
-- ========================================================
--   with SPARK_Mode => on
is

   package ATIO renames Ada.Text_IO;
   package ASU  renames Ada.Strings.Unbounded;
   
   -- =====================================================
   datestring : ASU.Unbounded_String; -- no initialization needed, default empty
   timestring : ASU.Unbounded_String; 
   lineString : ASU.Unbounded_String;
   UBStr      : ASU.Unbounded_String; 
      
   --Str        : String (1..15);
   
   lenUBStr   : Integer := 0;
   
   -- Declare file handle 
   fhandle1, fhandle2, fhandle3 : ATIO.File_Type;
   
   -- Three file modes allowed  
   fmode1   : ATIO.File_Mode := ATIO.Out_File;   
   fmode2   : ATIO.File_Mode := ATIO.Append_File; 
   fmode3   : ATIO.File_Mode := ATIO.In_File;
   
   -- Declare filenames
   fname1   : String := "../files/test1.txt";
   fname2   : String := "../files/test2.txt";
   fname3   : String := "../files/test3.txt";

   -- ==================================================== 
   procedure open_text_file(fname1 : String; fmode1 : ATIO.File_Mode) 	
   -- =====================================================   
     is
      
	begin
	  
      ATIO.Put_line("Random integer (1..100) = ");
      
   end open_text_file;
   
   -- =====================================================
   
   -- =====================================================
   
   

-- =======================================================   
begin
  null;
-- ========================================================
end pkg_ada_read_file;
-- ========================================================    
   
  
     
