import 'package:evently/core/theme/color_pallete.dart';
import 'package:evently/model/categorie_data.dart';
import 'package:flutter/material.dart';

class CreateEventTabBarItemWidget extends StatelessWidget {
  bool isSelected=false;

  CreateEventTabBarItemWidget({required this.isSelected,super.key,required this.categoryData});
  final CategoryData categoryData;
  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    return Container(
      width: 129,height: 40,
      decoration:  BoxDecoration( color: isSelected?ColorPallete.primaryColor:Colors.transparent,
          borderRadius: BorderRadius.circular(46),
          border: Border.all(
              color: ColorPallete.primaryColor
          )
      ),
      padding: EdgeInsets.symmetric(horizontal: 5,vertical: 6),
      child: Row(
        spacing: 6,
        children: [
          Icon(categoryData.iconData,color:isSelected?ColorPallete.white: ColorPallete.primaryColor
          )
          ,Flexible(
            child: Text(categoryData.name,style: theme.textTheme.bodyLarge!.copyWith(
                color:isSelected?ColorPallete.white: ColorPallete.primaryColor,fontWeight: FontWeight.w500
            ),),
          )
        ],
      ),
    );
  }
}
