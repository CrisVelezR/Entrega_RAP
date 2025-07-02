@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption - BookingSuplement'
@Metadata.allowExtensions: true
define view entity Z_C_BOOKSUP_7164
  as projection on z_i_booksup_7164
{
  key travel_id                   as TravelID,
  key booking_id                  as BookingID,
  key booking_supplement_id       as BookingSupplementID,
      @ObjectModel.text.element:
      ['SupplementDescription']
      supplement_id               as SupplementID,
      _SupplementText.Description as SupplementDescription : localized,
      @Semantics.amount.currencyCode :
      'CurrencyCode'
      price                       as Price,
      @Semantics.currencyCode: true
      currency_code                   as CurrencyCode,
      last_changed_at             as LastChangedAt,
      /* Associations */
      _Travel  : redirected to Z_C_TRAVEL_7164,
      _Booking : redirected to parent Z_C_BOOKING_7164,
      _Product,
      _SupplementText
}
