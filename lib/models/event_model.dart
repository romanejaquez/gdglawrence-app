class EventModel {
  String eventName;
  String eventDate;
  String eventTime;
  String attendeeCount;
  String venueName;
  String venueAddress;
  String venueCity;
  String venueState;
  String venueZip;
  bool isVenueAssigned;
  double lat;
  double long;

  EventModel({
    this.eventName,
    this.eventTime,
    this.eventDate,
    this.attendeeCount,
    this.venueName,
    this.venueAddress,
    this.venueCity,
    this.venueState,
    this.venueZip,
    this.isVenueAssigned,
    this.lat,
    this.long
  });
}