@AbapCatalog.sqlViewName: 'ZV_BOOKSUP_LOG'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Interface - Booking Supplement'
define view z_i_booksup_7164
  as select from ztb_booksup_7164 as BookingSupplement
  association to parent Z_I_BOOKING_7164 as _Booking on  $projection.travel_id  = _Booking.travel_id
                                                     and $projection.booking_id = _Booking.booking_id
{
  key travel_id,
  key booking_id,
  key booking_supplement_id,
      supplement_id,
      price,
      currency_code,
      last_changed_at,
      _Booking
}
