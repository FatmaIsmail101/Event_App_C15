import 'package:evently/core/constants/app_assets.dart';
import 'package:evently/core/theme/color_pallete.dart';
import 'package:evently/modules/layouts/favorite/favorite_view.dart';
import 'package:evently/modules/layouts/home/home_view.dart';
import 'package:evently/modules/layouts/map/map_view.dart';
import 'package:evently/modules/layouts/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int selectedIndex=0;
  List<Widget>screens=[
    HomeView(),
    MapView(),
    FavoriteView(),
    ProfileView()

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Bounceable(
        onTap: (){},
        child: CircleAvatar(
          backgroundColor: ColorPallete.white,
          radius: 32,
          child: CircleAvatar(
            radius: 26,
            backgroundColor: ColorPallete.primaryColor,
            child: Icon(Icons.add,
              color: ColorPallete.white,size: 30,),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
          onTap: (index){
          setState(() {
            selectedIndex=index;
          });
          },
          items:
      [
        BottomNavigationBarItem(
            activeIcon: ImageIcon(AssetImage(
              AppAssets.home_selected
            )),
            icon: ImageIcon(AssetImage(AppAssets.home))
        ,label: "Home"),
        BottomNavigationBarItem(
            activeIcon: ImageIcon(AssetImage(
                AppAssets.map_selected,
            ),size: 35,),
            icon: ImageIcon(AssetImage(AppAssets.map))
            ,label: "Map"),
        BottomNavigationBarItem(
            activeIcon: ImageIcon(AssetImage(
              AppAssets.fav_selected
            )),
            icon: ImageIcon(AssetImage(AppAssets.fav))
            ,label: "Favorite"),
        BottomNavigationBarItem(
            activeIcon: ImageIcon(AssetImage(
              AppAssets.profile_selected
            )),
            icon: ImageIcon(AssetImage(AppAssets.profile))
            ,label: "Profile"),
      ]),
      body: screens[selectedIndex],
    );
  }
}
