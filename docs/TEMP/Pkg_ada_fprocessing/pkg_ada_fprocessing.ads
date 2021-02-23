-- File:   pkg_ada_fprocessing.ads
-- Date:   Sun 20 Dec 2020 02:43:40 PM +08
-- Author: WRY wruslandr@gmail.com

-- ========================================================
-- IMPORT ADA PACKAGES
with Ada.Text_IO;  use Ada.Text_IO;
with Interfaces.C; use  Interfaces.C;
with Interfaces.C.Extensions; use  Interfaces.C.Extensions;
with Ada.Strings.Unbounded;

-- IMPORT USER CREATED PACKAGES


-- ========================================================
package pkg_ada_fprocessing is

-- RENAME ADA PACKAGES
   package AATIO   renames Ada.Text_IO;
   package IFaceC  renames Interfaces.C;
   package IFaceCE renames Interfaces.C.Extensions;
   package ASU     renames Ada.Strings.Unbounded;

-- RENAME USER CREATED PACKAGES


-- ========================================================
-- GLOBAL VARIABLES FOR PACKAGE
-- ========================================================



-- ========================================================
-- LIST OF FUNCTIONS FOR PACKAGE
-- ========================================================
   function GetA_length_unbounded_string (UBStr : in ASU.Unbounded_String) return Integer;


-- ========================================================
-- LIST OF PROCEDURES FOR PACKAGE
-- ========================================================
   procedure ExecA_read_unbounded_string (UBStr : in ASU.Unbounded_String);
   procedure ExecA_slice_unbounded_string (UBStr : in ASU.Unbounded_string; the_start, the_end : in Integer);

   -- procedure ExecA_create_textfile (the_fhandle : AATIO.File_Type; the_fmode : AATIO.File_Mode; the_fname : String);


   -- procedure ExecA_close_textfile (the_fhandle : AATIO.File_Type);

-- ========================================================
end pkg_ada_fprocessing;
-- ========================================================

