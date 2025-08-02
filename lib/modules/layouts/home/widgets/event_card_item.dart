import 'package:evently/core/constants/app_assets.dart';
import 'package:evently/core/theme/color_pallete.dart';
import 'package:flutter/material.dart';

class EventCardItem extends StatelessWidget {
  const EventCardItem({super.key});
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
        image: DecorationImage(image: AssetImage(AppAssets.birthdaycard,
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
child: Column(
  children: [
    Text("22",style:theme.textTheme.headlineSmall!.copyWith(color:
    ColorPallete.primaryColor,fontWeight: FontWeight.bold) ,),
    Text("Nov",style:theme.textTheme.bodyMedium!.copyWith(color:
    ColorPallete.primaryColor,fontWeight: FontWeight.bold) ,),


  ],
),

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
                 Text("This is a Birthday Party ",style:theme.textTheme.bodyMedium),
                 Spacer(),
                 Icon(Icons.favorite_border,color: ColorPallete.primaryColor,)
               ],
             ) ,
           )
         ],
       ),
    );
  }
}
