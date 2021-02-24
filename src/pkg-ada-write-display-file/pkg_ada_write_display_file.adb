-- File	: pkg_ada_write_display_file.adb
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
package body pkg_ada_write_display_file 
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
      
   

   -- ==================================================== 
   procedure open_inp_textfile (fhandle : out ATIO.File_Type; fmode : in ATIO.File_Mode; fname : in String)	
   -- =====================================================   
     is
      
   begin
      ATIO.Open (fhandle, fmode, fname);
      ATIO.Put_line("Executed open_inp_textfile (fhandle: out ATIO.File_Type; fmode : in ATIO.File_Mode; fname : in String);");
      
     
   end open_inp_textfile;
   
   -- =====================================================
   procedure about_pkg_ada_write_display_file
   -- =====================================================
   is 
   
   begin 
      ATIO.Put_Line("About_pkg_ada_write_display_file (PAWDF)");

   end about_pkg_ada_write_display_file;
   -- =======================================================   
   
   
   
begin
  null;
-- ========================================================
end pkg_ada_write_display_file;
-- ========================================================    
   
  
     
