@AbapCatalog.sqlViewName: 'ZV_BOOKSUP_LOG'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Interface - Booking Supplement'
define view z_i_booksup_7164
  as select from ztb_booksup_7164 as BookingSupplement
  association        to parent Z_I_BOOKING_7164 as _Booking        on  $projection.travel_id  = _Booking.travel_id
                                                                   and $projection.booking_id = _Booking.booking_id
  association [1..1] to Z_I_TRAVEL_7164         as _Travel         on  $projection.travel_id = _Travel.travel_id
  association [1..1] to /DMO/I_Supplement       as _Product        on  $projection.supplement_id = _Product.SupplementID
  association [1..*] to /DMO/I_SupplementText   as _SupplementText on  $projection.supplement_id = _SupplementText.SupplementID
{
  key travel_id,
  key booking_id,
  key booking_supplement_id,
      supplement_id,
      @Semantics.amount.currencyCode : 'currency_code'
      price,
      @Semantics.currencyCode: true
      currency_code,
      @Semantics.systemDateTime.lastChangedAt: true
      _Travel.last_changed_at,
      _Booking,
      _Travel,
      _Product,
      _SupplementText
}
