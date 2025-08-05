class EventData{
   String? eventId;
  final String eventTitle;
   final String eventDescription;
   final bool isFavorite;
   final String eventCategoryImg;
   final String eventCategoryId;
   final DateTime selectedDate;

   EventData({this.eventId,
    required this.eventTitle,
     required this.eventDescription,
      this.isFavorite = false,
     required this.eventCategoryImg,
     required this.eventCategoryId,
     required this.selectedDate});

}