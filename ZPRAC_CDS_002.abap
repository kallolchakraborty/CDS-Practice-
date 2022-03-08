/* CDS View with parameter */
@AbapCatalog.sqlViewName: 'ZPRAC_SQL_002'
/* 
No other annotations are needed as we going to consume it in SE38 
Way to call the CDS in a report 
    select * from ZPRAC_SQL_002( p1_travel_id = @p_parameter1, p2_agency_id = @p_parameter2 ) 
    into table @data(lt_table).
*/
define view ZPRAC_CDS_002
  with parameters
    p1_travel_id : /dmo/travel_id, //Parameter 1
    p2_agency_id : /dmo/agency_id  //Parameter 2
  as select from /dmo/travel
{
  key travel_id     as TravelId,
      agency_id     as AgencyId,
      customer_id   as CustomerId,
      begin_date    as BeginDate,
      end_date      as EndDate,
      booking_fee   as BookingFee,
      total_price   as TotalPrice,
      currency_code as CurrencyCode,
      description   as Description,
      status        as Status,
      createdby     as Createdby,
      createdat     as Createdat,
      lastchangedby as Lastchangedby,
      lastchangedat as Lastchangedat
}
where //Conditions
      travel_id = :p1_travel_id
  and agency_id = :p2_agency_id
