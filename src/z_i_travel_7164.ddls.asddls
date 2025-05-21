@AbapCatalog.sqlViewName: 'ZV_TRAVEL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface - Travel'
@Metadata.ignorePropagatedAnnotations: true
define root view Z_I_TRAVEL_7164
  as select from ztb_travel_7164
  composition [0..*] of Z_I_BOOKING_7164 as _Booking
{
  key travel_id,
      agency_id,
      customer_id,
      begin_date,
      end_date,
      booking_fee,
      total_price,
      currency_code,
      description,
      overall_status,
      created_by,
      created_at,
      last_changed_by,
      last_changed_at,
      _Booking
}
