with bookings as 
(
    SELECT
    Booking_ID,
    BOOKING_DATE,
    BOOKING_STATUS,
    CREATED_AT

    from
    {{ ref('obt') }}

)

select * from bookings