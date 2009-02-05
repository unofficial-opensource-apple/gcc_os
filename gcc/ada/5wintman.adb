------------------------------------------------------------------------------
--                                                                          --
--                GNU ADA RUN-TIME LIBRARY (GNARL) COMPONENTS               --
--                                                                          --
--           S Y S T E M . I N T E R R U P T _ M A N A G E M E N T          --
--                                                                          --
--                                  B o d y                                 --
--                                                                          --
--                             $Revision: 1.1.1.2 $
--                                                                          --
--          Copyright (C) 1991-2000 Free Software Foundation, Inc.          --
--                                                                          --
-- GNARL is free software; you can  redistribute it  and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 2,  or (at your option) any later ver- --
-- sion. GNARL is distributed in the hope that it will be useful, but WITH- --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY --
-- or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License --
-- for  more details.  You should have  received  a copy of the GNU General --
-- Public License  distributed with GNARL; see file COPYING.  If not, write --
-- to  the Free Software Foundation,  59 Temple Place - Suite 330,  Boston, --
-- MA 02111-1307, USA.                                                      --
--                                                                          --
-- As a special exception,  if other files  instantiate  generics from this --
-- unit, or you link  this unit with other files  to produce an executable, --
-- this  unit  does not  by itself cause  the resulting  executable  to  be --
-- covered  by the  GNU  General  Public  License.  This exception does not --
-- however invalidate  any other reasons why  the executable file  might be --
-- covered by the  GNU Public License.                                      --
--                                                                          --
-- GNARL was developed by the GNARL team at Florida State University. It is --
-- now maintained by Ada Core Technologies Inc. in cooperation with Florida --
-- State University (http://www.gnat.com).                                  --
--                                                                          --
------------------------------------------------------------------------------

--  This is the NT version of this package

--  This file performs the system-dependent translation between machine
--  exceptions and the Ada exceptions, if any, that should be raised when they
--  occur.

--  PLEASE DO NOT add any dependences on other packages.
--  This package is designed to work with or without tasking support.

--  See the other warnings in the package specification before making any
--  modifications to this file.

--  Make a careful study of all signals available under the OS, to see which
--  need to be reserved, kept always unmasked, or kept always unmasked. Be on
--  the lookout for special signals that may be used by the thread library.

with System.OS_Interface; use System.OS_Interface;

package body System.Interrupt_Management is

   ---------------------------
   -- Initialize_Interrupts --
   ---------------------------

   --  Nothing needs to be done on this platform.

   procedure Initialize_Interrupts is
   begin
      null;
   end Initialize_Interrupts;

begin
   --  "Reserve" all the interrupts, except those that are explicitly defined

   for J in Interrupt_ID'Range loop
      Reserve (J) := True;
   end loop;

   Reserve (SIGINT)  := False;
   Reserve (SIGILL)  := False;
   Reserve (SIGABRT) := False;
   Reserve (SIGFPE)  := False;
   Reserve (SIGSEGV) := False;
   Reserve (SIGTERM) := False;
end System.Interrupt_Management;
