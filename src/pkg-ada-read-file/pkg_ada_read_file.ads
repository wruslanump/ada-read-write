-- File	: pkg_ada_read_file.ads
-- Date	: Tue 23 Feb 2021 04:39:09 PM +08
-- Env	: Linux HPEliteBook8470p-Ub2004-rt38 5.4.66-rt38 
-- #1 SMP PREEMPT_RT Sat Sep 26 16:51:59 +08 2020 x86_64 x86_64 x86_64 GNU/Linux
-- Author: WRY wruslandr@gmail.com
-- ========================================================
with Ada.Text_IO;

-- ========================================================
package pkg_ada_read_file 
-- ========================================================
--   with SPARK_Mode => on
is
  
   package AATIO renames Ada.Text_IO;
   
   procedure open_text_file (fname1 : String; fmode1 : AATIO.File_Mode); 	
   

-- ========================================================
end pkg_ada_read_file;
-- ========================================================    
   
  
     
