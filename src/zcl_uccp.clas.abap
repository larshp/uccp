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
    DATA lv_hex TYPE x LENGTH 2.
    lv_class = 'CL_ABAP_CONV_IN_CE'.

    TRY.
        CALL METHOD (lv_class)=>uccp
          EXPORTING
            uccp = uccp
          RECEIVING
            char = char.
      CATCH cx_sy_dyn_call_illegal_method.
        lv_hex = uccp.


    ENDTRY.

  ENDMETHOD.
ENDCLASS.
