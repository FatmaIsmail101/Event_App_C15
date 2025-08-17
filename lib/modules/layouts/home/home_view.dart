import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/constants/app_assets.dart';
import 'package:evently/core/constants/app_string.dart';
import 'package:evently/core/providers/theme_provider.dart';
import 'package:evently/core/routes/page_routes_name.dart';
import 'package:evently/core/theme/color_pallete.dart';
import 'package:evently/core/utils/firebase_firestore_uitles.dart';
import 'package:evently/model/categorie_data.dart';
import 'package:evently/model/event_data.dart';
import 'package:evently/modules/layouts/home/widgets/event_card_item.dart';
import 'package:evently/modules/layouts/home/widgets/tab_bar_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex=0;

  List<CategoryData>categoriesDataList=[
    CategoryData(id: "sports",imgPath: "",name: "sports", iconData: Icons.sports_basketball),
    CategoryData(id:"birthday" ,imgPath: "",name: "birthday", iconData: Icons.party_mode),
    CategoryData(id: "Book Club",imgPath: "",name: "Book Club", iconData: Icons.local_library),
    CategoryData(id:"Holiday" ,imgPath: "",name: "Holiday", iconData: Icons.holiday_village),
    CategoryData(id:"Exhibition" ,imgPath: "",name: "Exhibition", iconData: Icons.menu_book),
    CategoryData(id:"meeting" ,imgPath: "",name: "meeting", iconData: Icons.meeting_room_outlined),
    CategoryData(id: "Eating",imgPath: "",name: "Eating", iconData: Icons.food_bank),
    CategoryData(id:"WorkShop" ,imgPath: "",name: "WorkShop", iconData: Icons.workspaces),
    CategoryData(id:"Gaming" ,imgPath: "",name: "Gaming", iconData: Icons.games),


  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);

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
                left: 10,
              right: 10
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
                    Text(AppStrings.name, style: theme.textTheme.titleLarge!.copyWith(
                      color: ColorPallete.white
                    )),
                    Spacer(),
                    Bounceable(onTap: (){
                      provider.toggleTheme();

                    }, child:Icon(provider.themeMode==ThemeMode.light?
                    Icons.wb_sunny_outlined:Icons.nightlight,size: 30,color: ColorPallete.white,),
                    ),
                     SizedBox(width: 8,),
                    Bounceable(
                      onTap: () {
                        if(context.locale.languageCode=='ar'){
                          context.setLocale(Locale('en'));
                        }else{
                          context.setLocale(Locale('ar'));
                        }
                      },
                      child: Container(padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: ColorPallete.white,
                          borderRadius: BorderRadius.circular(6)

                        ),
                        child: Text(context.locale.languageCode=='en'?
                          AppStrings.en:'ar',style: theme.textTheme.bodyMedium!.copyWith(
                          color: ColorPallete.primaryColor,fontWeight: FontWeight.w700
                        ),),
                      ),
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
            categoriesDataList.indexOf(data)
                    ,);
                },).toList()
                ))
              ],
            ),
          ),
          StreamBuilder(stream: FirebaseFirestoreUtils.getStreamEventTasksList(
            categorieId: categoriesDataList[selectedIndex].id
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
          return Bounceable(
              
              onTap: () { 
                Navigator.pushNamed(context, PageRoutesName.eventDetails,arguments: index);
              },
              child
              : EventCardItem(eventData: eventDataList[index],));
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
    );
  }
}
/*
FutureBuilder <List<EventData>>(future: FirebaseFirestoreUtils.getEventTasksList(),
              builder: (context, snapshot) {
            if(snapshot.hasError){
              return Center(
                child: Text(snapshot.error.toString(),style: theme.textTheme.bodyMedium
                  !.copyWith(color: Colors.black),),
              );
            }
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }
            List <EventData>eventDataList=snapshot.data??[];
            return  Expanded(
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
              },),

 */