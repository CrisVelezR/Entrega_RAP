@AbapCatalog.sqlViewName: 'ZV_BOOKING'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface - Booking'
@Metadata.ignorePropagatedAnnotations: true
define view Z_I_BOOKING_7164
  as select from ztb_booking_7164
  composition [0..*] of z_i_booksup_7164 as _BookingSupplement
  association to parent Z_I_TRAVEL_7164 as _Travel on $projection.travel_id = _Travel.travel_id
{
  key travel_id,
  key booking_id,
      booking_date,
      customer_id,
      carrier_id,
      connection_id,
      flight_date,
      flight_price,
      currency_code,
      booking_status,
      last_changed_at,
      _Travel,
      _BookingSupplement
}
