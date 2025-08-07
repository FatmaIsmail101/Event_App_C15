import 'package:cloud_firestore/cloud_firestore.dart';

class EventData{
  static const String collectionName="event_tasks";
   String? eventId;
  final String eventTitle;
   final String eventDescription;
     bool isFavorite;
   final String eventCategoryImg;
   final String eventCategoryId;
   final DateTime selectedDate;

   EventData({this.eventId,
    required this.eventTitle,
     required this.eventDescription,
      this.isFavorite =false,
     required this.eventCategoryImg,
     required this.eventCategoryId,
     required this.selectedDate});
 factory EventData.fromFireStore (Map<String,dynamic>data){
  return EventData(
    isFavorite: data["isFavorite"],
      eventId: data["eventId"],
  eventTitle: data["eventTitle"],
  eventDescription:data ["eventDescription"],
   eventCategoryImg:data ["eventCategoryImg"],
   eventCategoryId:data ["eventCategoryId"],
   selectedDate: (data["selectedDate"] as Timestamp).toDate()
  );
   }
   Map<String,dynamic>toFireStore(){
     return {
       "eventId":eventId,
       "eventTitle": eventTitle,
       "eventDescription":eventDescription,
       "eventCategoryImg": eventCategoryImg,
       "isFavorite":isFavorite,
       "eventCategoryId":eventCategoryId,
       "selectedDate":selectedDate
     };
   }

}