import 'package:evently/core/theme/color_pallete.dart';
import 'package:evently/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/firebase_firestore_uitles.dart';
import '../../../model/event_data.dart';
import '../home/widgets/event_card_item.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override

  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          spacing: 30,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextFormField(
                hintText: "Search for Events",
                prefixIcon: Icon(Icons.search,color: ColorPallete.primaryColor,),
              ),
            ),
            StreamBuilder(stream: FirebaseFirestoreUtils.getStreamFavoriteEventTasksList(
            )
                ,  builder: (context, snapshot) {
                  if(snapshot.hasError){
                    return Center(
                      child: Text(snapshot.error.toString(),style: theme.textTheme.bodyMedium
                      !.copyWith(color: Colors.black),),
                    );
                  }
                  if(snapshot.connectionState==ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator(),);
                  }
                  List <EventData>eventDataList=snapshot.data!.docs.map((data) {
                    return data.data();
                  },).toList();
                  return eventDataList.isEmpty?Center(
                    child: Text("No Events", style: theme.textTheme.bodyMedium
                    !.copyWith(color: ColorPallete.primaryColor),),
                  ): Expanded(
                    child: SizedBox(
                      height: 203,width: 360,
                      child: ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          itemBuilder: (context, index) {
                            return EventCardItem(eventData: eventDataList[index],);
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 10,
                            );
                          }, itemCount: eventDataList.length),
                    ),
                  );
                }),

          ],
        ),
      ),
    );
  }
}
