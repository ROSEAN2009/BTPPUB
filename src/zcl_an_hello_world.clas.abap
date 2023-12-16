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
  data lv_agency_id TYPE /dmo/agency_id VALUE '070039'.
     SELECT customerid as customerid,
            MAX( flightPrice ) as max_flight_price,
            flightdate,
            inramount,
             \_travel-agency_id
             FROM zan_dd_travel( p_cust = '000594' )
                   GROUP BY customerid, flightdate, inramount, \_travel-agency_id
                   INTO TABLE @DATA(IT_TABLE).
     out->write( IT_TABLE ).
  ENDMETHOD.
ENDCLASS.
