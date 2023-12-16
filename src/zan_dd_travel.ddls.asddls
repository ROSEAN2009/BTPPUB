@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Travel'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZAN_DD_TRAVEL
       with parameters 
       p_cust : /dmo/customer_id
       as select from /dmo/booking  
       association [1..1] to /dmo/travel as _travel on $projection.TravelId = _travel.travel_id
{
       key travel_id   as TravelId,
       key booking_id as BookingId,
          customer_id as CustomerId,
          flight_date  as FlightDate,
          @Semantics.amount.currencyCode: 'CurrencyCode'        
          flight_price as FlightPrice,
          currency_code as CurrencyCode,
          cast( flight_price as abap.fltp(16)) * 0.18 as TaxAmount,
          cast( 'INR' as waers) as TargetCurrency,
          @Semantics.amount.currencyCode: 'TargetCurrency'              
          currency_conversion( amount => flight_price,
                               source_currency => currency_code, 
                               target_currency => cast ('INR' as waers ), 
                               exchange_rate_date => $session.system_date,
                               exchange_rate_type => 'M',
                               error_handling => 'SET_TO_NULL' ) as INRAmount,
         _travel
}
      where customer_id = $parameters.p_cust;
