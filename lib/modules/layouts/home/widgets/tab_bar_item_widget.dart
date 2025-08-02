import 'package:evently/core/theme/color_pallete.dart';
import 'package:evently/model/categorie_data.dart';
import 'package:flutter/material.dart';

class TabBarItemWidget extends StatelessWidget {
  bool isSelected=false;

   TabBarItemWidget({required this.isSelected,super.key,required this.categoryData});
final CategoryData categoryData;
  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    return Container(
      width: 107,height: 40,
      decoration:  BoxDecoration( color: isSelected?ColorPallete.white:Colors.transparent,
        borderRadius: BorderRadius.circular(46),
        border: Border.all(
          color: ColorPallete.white
        )
      ),
      padding: EdgeInsets.symmetric(horizontal: 5,vertical: 6),
      child: Row(
        spacing: 6,
        children: [
          Image(image: AssetImage(categoryData.imgPath))
        ,Text(categoryData.name,style: theme.textTheme.bodyLarge!.copyWith(
            color:isSelected?ColorPallete.primaryColor: ColorPallete.white,fontWeight: FontWeight.w500
          ),)
        ],
      ),
    );
  }
}
