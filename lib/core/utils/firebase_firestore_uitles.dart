import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/model/event_data.dart';

abstract class FirebaseFirestoreUtils{
 static CollectionReference <EventData> _getCollectionReference(){
    return FirebaseFirestore.instance.collection(EventData.collectionName)
    .withConverter(fromFirestore:(snapshot, _) =>
        EventData.fromFireStore(snapshot.data()!), toFirestore: (value, _) =>value.toFireStore() ,);
  }


 static Future <bool> createNewEventTask(EventData eventData)async{
    try{
      ///create collection
      var collectionRefrence=_getCollectionReference();
      ///create Id
      var documentRefrence= collectionRefrence.doc();
      eventData.eventId=documentRefrence.id;
      await documentRefrence.set(eventData);
      return Future.value(true);
    }catch(e){
      return Future.value(false);
    }
    
   
  }

 static Future<List<EventData>>getEventTasksList()async{
    var collectonRefrence=_getCollectionReference();
    var dataCollection=await collectonRefrence.get();
    return dataCollection.docs.map((data) {
      return data.data();
    }
      ,).toList();
  }

 static Stream<QuerySnapshot<EventData>>getStreamEventTasksList({required String categorieId}){
   var collectonRefrence=_getCollectionReference().where("eventCategoryId",
   isEqualTo: categorieId);
   return collectonRefrence.snapshots();

 }
 static Stream<QuerySnapshot<EventData>>getStreamFavoriteEventTasksList(){
   var collectonRefrence=_getCollectionReference().where("isFavorite",
       isEqualTo: true);
   return collectonRefrence.snapshots();

 }

 static Future <void>updateEventTasks({required EventData eventData}){
   var collectonRefrence=_getCollectionReference();
var docRef=collectonRefrence.doc(eventData.eventId);
return docRef.update(eventData.toFireStore());
 }

 static Future <void>deleteEventTasks({required EventData eventData}){
   var collectonRefrence=_getCollectionReference();
   var docRef=collectonRefrence.doc(eventData.eventId);
   return docRef.delete();
 }

}