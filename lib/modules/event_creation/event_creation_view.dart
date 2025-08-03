import 'package:evently/core/constants/app_assets.dart';
import 'package:evently/core/constants/app_string.dart';
import 'package:evently/core/theme/color_pallete.dart';
import 'package:evently/core/widgets/custom_button_style.dart';
import 'package:evently/core/widgets/custom_text_form_field.dart';
import 'package:evently/modules/event_creation/widgets/create_event_tab_bar_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import '../../model/categorie_data.dart';
import '../layouts/home/widgets/tab_bar_item_widget.dart';

class EventCreationView extends StatefulWidget {
   EventCreationView({super.key});

  @override
  State<EventCreationView> createState() => _EventCreationViewState();
}

class _EventCreationViewState extends State<EventCreationView> {
int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    return Scaffold(
      backgroundColor: ColorPallete.screenLight,
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppStrings.createEvent,style: theme.textTheme.titleLarge!.copyWith(
          color: ColorPallete.primaryColor,fontWeight: FontWeight.w500
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(categoriesDataList[selectedIndex].imgPath)),
              DefaultTabController(
          
                  length: categoriesDataList.length, child: TabBar(
                  onTap: (index){
                    setState(() {
                      selectedIndex=index;
                    });
                  },
                  isScrollable : true,
                  indicator: BoxDecoration(),
                  dividerColor: Colors.transparent,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  labelPadding: EdgeInsets.symmetric(horizontal: 5),
                  tabAlignment: TabAlignment.start,
                  tabs:
                  categoriesDataList.map((data) {
                    return CreateEventTabBarItemWidget(categoryData: data,
                      isSelected: selectedIndex==
                          categoriesDataList.indexOf(data),);
                  },).toList()
              )),
              Text(AppStrings.title,style: theme.textTheme.bodyLarge,),
              CustomTextFormField(prefixIcon: Icon(Icons.edit_note_sharp,color: ColorPallete.grey,size: 30,
              ),hintText: "Event Title",)
              ,Text(AppStrings.description,style: theme.textTheme.bodyLarge,),
              CustomTextFormField(hintText: "Event Description",maxLines: 4,),
              Row(
                children: [
                  Icon(Icons.calendar_month),
                  SizedBox(width: 5,),
                  Text(AppStrings.eventDate),
                  Spacer(),
                  Bounceable(onTap: (){}, child: Text("Choose Date",style: theme.textTheme.bodyLarge!.copyWith(
                    color: ColorPallete.primaryColor,fontWeight: FontWeight.w500
                  ),),
                  )
                ],
              ),
              Row(
                children: [
                  Icon(Icons.timer),
                  SizedBox(width: 5,),
                  Text(AppStrings.eventTime),
                  Spacer(),
                  Bounceable(onTap: (){}, child: Text("Choose Time",style: theme.textTheme.bodyLarge!.copyWith(
                      color: ColorPallete.primaryColor,fontWeight: FontWeight.w500
                  ),),
                  )
                ],
              ),
              
              CustomButtonStyle(color: ColorPallete.white,child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: ColorPallete.primaryColor
                        ),
                        child: Icon(Icons.my_location,size: 30,color: ColorPallete.white,)),
                    SizedBox(width: 10,),
                    Text("Choose Event Location",style: theme.textTheme.bodyLarge!.copyWith(
                      color: ColorPallete.primaryColor
                    ),),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios,color: ColorPallete.primaryColor,)
                  ],
                ),
              ),),
              
            ],
          ),
        ),
      ),
      floatingActionButton:    SizedBox(
        width: double.infinity,
        child: CustomButtonStyle(color: ColorPallete.primaryColor,child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text("Add Event",style: theme.textTheme.titleSmall!.copyWith(
              color: ColorPallete.white
          ),),
        ),),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );
  }

List<CategoryData>categoriesDataList=[
  CategoryData(imgPath: AppAssets.sportimg,name: "sports", iconData: Icons.sports_basketball),
  CategoryData(imgPath: AppAssets.birthdayimg,name: "birthday", iconData: Icons.party_mode),
  CategoryData(imgPath: AppAssets.bookclubimg,name: "Book Club", iconData: Icons.local_library),
  CategoryData(imgPath: AppAssets.holidayimg,name: "Holiday", iconData: Icons.holiday_village),
  CategoryData(imgPath: AppAssets.exhibitionimg,name: "Exhibition", iconData: Icons.menu_book),
  CategoryData(imgPath: AppAssets.meetingimg,name: "meeting", iconData: Icons.meeting_room_outlined),
  CategoryData(imgPath: AppAssets.eatingimg,name: "Eating", iconData: Icons.food_bank),
  CategoryData(imgPath: AppAssets.workshopimg,name: "WorkShop", iconData: Icons.workspaces),
  CategoryData(imgPath: AppAssets.gamingimg,name: "Gaming", iconData: Icons.games),


];

}
