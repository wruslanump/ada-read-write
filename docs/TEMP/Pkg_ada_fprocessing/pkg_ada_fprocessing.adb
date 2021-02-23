-- File:   pkg_ada_fprocessing.adb
-- Date:   Sun 20 Dec 2020 02:43:40 PM +08
-- Author: WRY wruslandr@gmail.com

-- REFERENCES:
-- https://en.wikibooks.org/wiki/Ada_Programming/Input_Output

-- ========================================================
package body pkg_ada_fprocessing is

-- ========================================================
-- FUNCTIONS FOR PACKAGE
-- ========================================================
   -- (F01)
   -- =====================================================
   function GetA_length_unbounded_string (UBStr : in ASU.Unbounded_String) return Integer is
      the_str : String := ASU.To_String(UBStr);
   begin
      return(the_str'Last);
   end GetA_length_unbounded_string;
   -- =====================================================
   -- (F02)
   -- =====================================================


   -- =====================================================
   -- (F03)
   -- =====================================================



-- ========================================================
-- PROCEDURES FOR PACKAGE
-- ========================================================
   -- (P01)
   -- =====================================================
   procedure ExecA_read_unbounded_string (UBStr : in ASU.Unbounded_String) is
   begin
       AATIO.Put_Line (ASU.To_String(UBStr));
   end ExecA_read_unbounded_string;
   -- =====================================================
   -- (P02)
   -- =====================================================
   procedure ExecA_slice_unbounded_string (UBStr : in ASU.Unbounded_string; the_start, the_end : in Integer) is
      the_str   : String := ASU.To_String(UBStr);
      the_slice : ASU.Unbounded_String;
   begin
      if the_start < the_str'First or the_end > the_str'Last then
         AATIO.Put ("ERROR: Sliced index is out of range (1 ..");
         AATIO.Put_Line (Integer'Image(the_str'Last) & ")");
      else
         the_slice := ASU.To_Unbounded_String(the_str(the_start..the_end));
         AATIO.Put ("The sliced string (UBStr,");
         AATIO.Put (Integer'Image(the_start) & "," & Integer'Image(the_end) & ") = ");
         AATIO.Put_Line (ASU.To_String(the_slice));
      end if;
   end ExecA_slice_unbounded_string;

   -- =====================================================
   -- (P03)
   -- =====================================================

   -- =====================================================
   -- (P04)
   -- =====================================================
   -- procedure ExecA_create_binaryfile() is

   -- begin



   -- end ExecA_create_binaryfile;
   -- =====================================================
   -- (P05)
   -- =====================================================
   -- procedure ExecA_createappend_textfile() is

   -- begin



   -- end ExecA_createappend_textfile;

   -- =====================================================
   -- (P06)
   -- =====================================================
   -- procedure ExecA_openread_textfile() is

   -- begin



   -- end ExecA_openread_textfile;

   -- =====================================================
   -- (P07)
   -- =====================================================
   -- procedure ExecA_openwrite_textfile() is

   -- begin



   -- end ExecA_openwrite_textfile;
   -- =====================================================
   -- (P08)
   -- =====================================================
   -- procedure ExecA_openappend_textfile() is

   -- begin



   -- end ExecA_openappend_textfile;

   -- =====================================================
   -- P(09...)
   -- =====================================================
   -- procedure ExecA_append_textfile() is

   -- begin



   -- end ExecA_append_textfile;
   -- =====================================================
   -- P(10 ...)
   -- =====================================================

   -- =====================================================
   -- P(11)
   -- =====================================================




   -- =====================================================
   -- P(12)
   -- =====================================================



-- ========================================================
begin

    null;

end pkg_ada_fprocessing;
-- =====================================================

