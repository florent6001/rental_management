Mission.delete_all
Booking.delete_all
Reservation.delete_all
Listing.delete_all

Listing.create!(num_rooms: 2)
Listing.create!(num_rooms: 1)
Listing.create!(num_rooms: 3)

Booking.create!(listing_id: Listing.first.id, start_date: "2016-10-10".to_date, end_date: "2016-10-15".to_date)
Booking.create!(listing_id: Listing.first.id, start_date: "2016-10-16".to_date, end_date: "2016-10-20".to_date)
Booking.create!(listing_id: Listing.second.id, start_date: "2016-10-15".to_date, end_date: "2016-10-20".to_date)

Reservation.create!(listing_id: Listing.first.id, start_date: "2016-10-11".to_date, end_date: "2016-10-13".to_date)
Reservation.create!(listing_id: Listing.first.id, start_date: "2016-10-13".to_date, end_date: "2016-10-15".to_date)
Reservation.create!(listing_id: Listing.first.id, start_date: "2016-10-16".to_date, end_date: "2016-10-20".to_date)
Reservation.create!(listing_id: Listing.second.id, start_date: "2016-10-15".to_date, end_date: "2016-10-18".to_date)

Mission.create!(listing_id: Listing.first.id, mission_type: "first_checkin", date: "2016-10-10", price: 20)
Mission.create!(listing_id: Listing.first.id, mission_type: "last_checkout", date: "2016-10-15", price: 10)
Mission.create!(listing_id: Listing.first.id, mission_type: "last_checkout", date: "2016-10-15", price: 10)
Mission.create!(listing_id: Listing.first.id, mission_type: "first_checkin", date: "2016-10-16", price: 20)
Mission.create!(listing_id: Listing.first.id, mission_type: "last_checkout", date: "2016-10-20", price: 10)
Mission.create!(listing_id: Listing.first.id, mission_type: "checkout_checkin", date: "2016-10-13", price: 20)
Mission.create!(listing_id: Listing.second.id, mission_type: "first_checkin", date: "2016-10-15", price: 10)
Mission.create!(listing_id: Listing.second.id, mission_type: "last_checkout", date: "2016-10-20", price: 5)
Mission.create!(listing_id: Listing.second.id, mission_type: "checkout_checkin", date: "2016-10-18", price: 10)
