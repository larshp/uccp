class ZCL_UCCP definition
  public
  final
  create public .

public section.

  types:
    ty_char2 TYPE c LENGTH 2 .

  class-methods UCCP
    importing
      !UCCP type SIMPLE
    returning
      value(CHAR) type TY_CHAR2 .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_UCCP IMPLEMENTATION.


  METHOD UCCP.
  ENDMETHOD.
ENDCLASS.
