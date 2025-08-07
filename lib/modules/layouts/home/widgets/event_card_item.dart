import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/theme/color_pallete.dart';
import 'package:evently/core/utils/firebase_firestore_uitles.dart';
import 'package:evently/model/event_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

class EventCardItem extends StatelessWidget {
  final EventData eventData;
  const EventCardItem({super.key,required this.eventData});
  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
      height: 203,width: 361,
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorPallete.primaryColor
        ),
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(image: AssetImage(eventData.eventCategoryImg,
        ),fit: BoxFit.cover)
      ),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
Container(width: 43,height: 50,
  decoration:  BoxDecoration(
    color: ColorPallete.white,
    borderRadius: BorderRadius.circular(6)
  ),
child: Text(
  textAlign: TextAlign.center,
  DateFormat("dd MM").format(eventData.selectedDate),style:theme.textTheme.headlineSmall!.copyWith(color:
ColorPallete.primaryColor,fontWeight: FontWeight.bold,height: 1) ,),

),
           Container(
             width: double.infinity,
             alignment: Alignment.center,
             padding: EdgeInsets.symmetric(horizontal: 8,vertical: 6),
             decoration:  BoxDecoration(
                 color: ColorPallete.white,
                 borderRadius: BorderRadius.circular(6)
             ),
             child:Row(
               children: [
                 Text(eventData.eventTitle,style:theme.textTheme.bodyMedium),
                 Spacer(),
                 Bounceable(
                   onTap: (){
                     eventData.isFavorite =! eventData.isFavorite;
                     FirebaseFirestoreUtils.updateEventTasks(eventData: eventData);
                   },
                   child: Icon(eventData.isFavorite?Icons.favorite:
                   Icons.favorite_border,color: ColorPallete.primaryColor,),
                 )
               ],
             ) ,
           )
         ],
       ),
    );
  }
}
