import 'package:evently/core/theme/color_pallete.dart';
import 'package:evently/model/event_data.dart';
import 'package:flutter/material.dart';

import '../../../../model/categorie_data.dart';

class EventDetails extends StatelessWidget {
   EventDetails({super.key,});
  @override

  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    final args=ModalRoute.of(context)!.settings.arguments
    as Map<String,dynamic>;
final int index=args["index"];
final EventData eventData=args["categoryData"];
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Event Details",style: theme.textTheme.headlineSmall!.copyWith(
          color: ColorPallete.primaryColor
        ),),
        actions: [
          Icon(Icons.edit),
          Icon(Icons.delete,color: Colors.red,)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(eventData.eventCategoryImg)
          ],
        ),
      ),
    );
  }
}
