CLASS zcl_uccp DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES:
      ty_char2 TYPE c LENGTH 2 .

    CLASS-METHODS uccp
      IMPORTING
        !uccp       TYPE clike
      RETURNING
        VALUE(char) TYPE ty_char2 .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_UCCP IMPLEMENTATION.


  METHOD uccp.

    DATA lv_class TYPE string.
    DATA lv_xstr  TYPE xstring.

    lv_class = 'CL_ABAP_CONV_IN_CE'.

    TRY.
        CALL METHOD (lv_class)=>uccp
          EXPORTING
            uccp = uccp
          RECEIVING
            char = char.
      CATCH cx_sy_dyn_call_illegal_class.
        lv_xstr = uccp.

        char = cl_abap_conv_codepage=>create_in( )->convert( lv_xstr ).
    ENDTRY.

  ENDMETHOD.
ENDCLASS.
