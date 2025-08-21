import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/color_pallete.dart';

class DateTimeCard extends StatelessWidget {
   DateTimeCard({super.key,required this.dateTime});
DateTime dateTime;
  @override
  Widget build(BuildContext context) {
    String formattedDate= DateFormat.yMMMd().format(dateTime);
    String formattedTime= DateFormat.jm().format(dateTime);
final theme=Theme.of(context);
    return  Container(
      width: double.infinity,height:64 ,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: ColorPallete.primaryColor)
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 48,height: 48,
              decoration: BoxDecoration(
                  color: ColorPallete.primaryColor,
                  borderRadius: BorderRadius.circular(8)
              ),
              child: Icon(Icons.calendar_month,color: ColorPallete.white,
                size: 35,),
            ),
          ),

          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(formattedDate.toString() ,style: theme.textTheme.bodyLarge
                !.copyWith(color: ColorPallete.primaryColor),),
              ),
              Text("$formattedTime" ,style: theme.textTheme.bodyLarge
              !.copyWith(color: ColorPallete.black),),

            ],
          ),
        ],
      ),
    );
  }
}
