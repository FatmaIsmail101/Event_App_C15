import 'package:evently/core/constants/app_assets.dart';
import 'package:evently/core/constants/app_string.dart';
import 'package:evently/core/theme/color_pallete.dart';
import 'package:evently/model/categorie_data.dart';
import 'package:evently/modules/layouts/home/widgets/event_card_item.dart';
import 'package:evently/modules/layouts/home/widgets/tab_bar_item_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex=0;
  List<CategoryData>categoriesDataList=[
    CategoryData(imgPath: "",name: "sports", iconData: Icons.sports_basketball),
    CategoryData(imgPath: "",name: "birthday", iconData: Icons.party_mode),
    CategoryData(imgPath: "",name: "Book Club", iconData: Icons.local_library),
    CategoryData(imgPath: "",name: "Holiday", iconData: Icons.holiday_village),
    CategoryData(imgPath: "",name: "Exhibition", iconData: Icons.menu_book),
    CategoryData(imgPath: "",name: "meeting", iconData: Icons.meeting_room_outlined),
    CategoryData(imgPath: "",name: "Eating", iconData: Icons.food_bank),
    CategoryData(imgPath: "",name: "WorkShop", iconData: Icons.workspaces),
    CategoryData(imgPath: "",name: "Gaming", iconData: Icons.games),


  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(

            width: mediaQuery.size.width,
            padding: EdgeInsets.only(
              top: mediaQuery.size.height * .04,
              bottom: 20,
left: 10
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20)),
                color: theme.primaryColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  AppStrings.welcome,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: ColorPallete.white,
                  ),
                ),

                Row(
                  children: [
                    Text(AppStrings.name, style: theme.textTheme.titleLarge),
                    Spacer(),
                    Icon(Icons.wb_sunny_outlined,size: 30,color: ColorPallete.white,),
                     SizedBox(width: 8,),
                    Container(padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: ColorPallete.white,
                        borderRadius: BorderRadius.circular(6)

                      ),
                      child: Text(AppStrings.en,style: theme.textTheme.bodyMedium!.copyWith(
                        color: ColorPallete.primaryColor,fontWeight: FontWeight.w700
                      ),),
                    )
                  ],
                ),
                SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    spacing: 5,
                    children: [
                      Image(
                        image: AssetImage(AppAssets.map),
                        height: 18,
                        width: 14,
                      ),
                      Text(
                        AppStrings.location,
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: ColorPallete.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15,),
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
                    //padding: EdgeInsets.symmetric(horizontal: 16),
      labelPadding: EdgeInsets.symmetric(horizontal: 5),
                    tabAlignment: TabAlignment.start,
                    tabs:
      categoriesDataList.map((data) {
        return TabBarItemWidget(categoryData: data,
        isSelected: selectedIndex==
            categoriesDataList.indexOf(data),);
      },).toList()
                ))
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 203,width: 360,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 10),
                  itemBuilder: (context, index) {
                    return EventCardItem();
                  },
                  separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10,
                );
              }, itemCount: 10),
            ),
          )
        ],
      ),
    );
  }
}
