CLASS zcl_carga_datos_7164 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_carga_datos_7164 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA: lt_travel   TYPE TABLE OF ztb_travel_7164,
          lt_booking  TYPE TABLE OF ztb_booking_7164,
          lt_book_sup TYPE TABLE OF ztb_booksup_7164.

    SELECT travel_id,
    agency_id,
    customer_id,
    begin_date,
    end_date,
    booking_fee,
    total_price,
    currency_code,
    description,
    status AS overall_status,
    createdby AS created_by,
    createdat AS created_at,
    lastchangedby AS last_changed_by,
    lastchangedat AS last_changed_at
    FROM /dmo/travel
    INTO CORRESPONDING FIELDS OF TABLE @lt_travel
    UP TO 50 ROWS.

    SELECT * FROM /dmo/booking
    FOR ALL ENTRIES IN @lt_travel
    WHERE travel_id EQ @lt_travel-travel_id
    INTO CORRESPONDING FIELDS OF TABLE @lt_booking.

    SELECT * FROM /dmo/book_suppl
    FOR ALL ENTRIES IN @lt_booking
    WHERE travel_id EQ @lt_booking-travel_id
    AND booking_id EQ @lt_booking-booking_id
    INTO CORRESPONDING FIELDS OF TABLE @lt_book_sup.

    DELETE FROM: ztb_travel_7164,
                 ztb_booking_7164,
                 ztb_booksup_7164.
    INSERT: ztb_travel_7164 FROM TABLE @lt_travel,
            ztb_booking_7164 FROM TABLE @lt_booking,
            ztb_booksup_7164 FROM TABLE @lt_book_sup.

    out->write( 'DONE!' ).
  ENDMETHOD.
ENDCLASS.
