@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Travel'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZAN_DD_TRAVEL as select from /dmo/travel
       association [0..*] to /dmo/booking as _booking on $projection.TravelId = _booking.travel_id
{
    key travel_id   as TravelId,
        customer_id as CustomerId,
        agency_id   as AgencyID,
        
        _booking
}
