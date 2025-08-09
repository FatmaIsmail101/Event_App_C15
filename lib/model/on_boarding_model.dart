import 'package:evently/core/constants/app_assets.dart';
import 'package:evently/core/constants/app_string.dart';

class OnBoardingData{
  String imgPath;
  String title;
  String description;

  OnBoardingData({required this.imgPath,required this.title,required this.description});

  static List<OnBoardingData>onBoardingList=[

    OnBoardingData(imgPath:AppAssets.onBoardingOne ,title: AppStrings.onBoardingOneTitle, description:AppStrings.onBoardingOneDescription ),
  OnBoardingData(imgPath: AppAssets.onBoardingTwo,title: AppStrings.onBoardingTwoTitle, description:AppStrings.onBoardingTwoDescription ),
  OnBoardingData(imgPath:AppAssets.onBoardingThree ,title:AppStrings.onBoardingThreeTitle , description:AppStrings.onBoardingThreeDescription ),
    OnBoardingData(imgPath:AppAssets.onBoardingFour ,title:AppStrings.onBoardingFourTitle , description:AppStrings.onBoardingFourDescription ),

  ];
}