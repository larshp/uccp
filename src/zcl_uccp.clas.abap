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
    DATA instance TYPE REF TO object.

    lv_class = 'CL_ABAP_CONV_IN_CE'.

    TRY.
        CALL METHOD (lv_class)=>uccp
          EXPORTING
            uccp = uccp
          RECEIVING
            char = char.
      CATCH cx_sy_dyn_call_illegal_class.
        lv_xstr = uccp.

        CALL METHOD ('CL_ABAP_CONV_CODEPAGE')=>create_in
          EXPORTING
            codepage = 'UTF-16'
          RECEIVING
            instance = instance.

* convert endianness
        CONCATENATE lv_xstr+1(1) lv_xstr(1) INTO lv_xstr IN BYTE MODE.

        CALL METHOD instance->('IF_ABAP_CONV_IN~CONVERT')
          EXPORTING
            source = lv_xstr
          RECEIVING
            result = char.
    ENDTRY.

  ENDMETHOD.
ENDCLASS.
