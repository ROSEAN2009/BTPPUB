CLASS zcl_an_hello_world DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_an_hello_world IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
     SELECT * FROM zan_dd_travel WHERE CustomerId = '000594'
                   INTO TABLE @DATA(IT_TABLE).
     out->write( IT_TABLE ).
  ENDMETHOD.
ENDCLASS.
