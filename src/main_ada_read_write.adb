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
   
   fname1 : String          := "../files/just-KSG.ngc"; 
   fmode1 : ATIO.File_Mode  := ATIO.In_File;
      
begin
   PADTS.dtstamp; ATIO.Put_Line ("Bismillah 3 times WRY");
   PADTS.dtstamp; ATIO.Put_Line ("Running inside GNAT Studio Community");
   ATIO.New_Line;
   
   -- PARF.generate_random_integer; -- TESTING ONLY.
   PARF.open_text_file(fname1, fmode1); 
     
   -- (1) Read file
   
   -- (2) Process file
   
   -- (3) Write file
   
   
      
   ATIO.New_Line; PADTS.dtstamp; ATIO.Put_Line ("Alhamdulillah 3 times WRY");
-- ========================================================   
end main_ada_read_write;
-- ========================================================

