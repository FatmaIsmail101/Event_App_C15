import 'package:evently/core/constants/app_assets.dart';
import 'package:evently/core/constants/app_string.dart';
import 'package:evently/core/providers/map_provider.dart';
import 'package:evently/core/routes/page_routes_name.dart';
import 'package:evently/core/theme/color_pallete.dart';
import 'package:evently/core/utils/firebase_firestore_uitles.dart';
import 'package:evently/core/widgets/custom_button_style.dart';
import 'package:evently/core/widgets/custom_text_form_field.dart';
import 'package:evently/model/event_data.dart';
import 'package:evently/modules/event_creation/widgets/create_event_tab_bar_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import '../../../../model/categorie_data.dart';


class EventUpdate extends StatefulWidget {
  const EventUpdate({super.key});

  @override
  State<EventUpdate> createState() => _EventUpdateState();
}

class _EventUpdateState extends State<EventUpdate> {
  bool isInit=false;
  int selectedIndex = 0;
  DateTime? selectedDate;
  //TimeOfDay? timeOfDay;
  late MapProvider mapProvider;
  final TextEditingController _titleEditingController = TextEditingController();
  final TextEditingController _descriptionEditingController =
  TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    mapProvider = Provider.of<MapProvider>(context, listen: false);
    mapProvider.getLocation();
    mapProvider.setLocationListner();
  }
  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
  if(!isInit){
    final data=ModalRoute.of(context)!.settings.arguments as EventData;

    _titleEditingController.text=data.eventTitle;
    _descriptionEditingController.text=data.eventDescription;
    isInit=true;

  }

  }
  @override
  void dispose(){
    super.dispose();
    _titleEditingController.dispose();
    _descriptionEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data=ModalRoute.of(context)!.settings.arguments as EventData;

    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: ColorPallete.screenLight,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Update Event",
          style: theme.textTheme.titleLarge!.copyWith(
            color: ColorPallete.primaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(categoriesDataList[selectedIndex].imgPath),
                ),
                DefaultTabController(
                  length: categoriesDataList.length,
                  child: TabBar(
                    onTap: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    isScrollable: true,
                    indicator: BoxDecoration(),
                    dividerColor: Colors.transparent,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    labelPadding: EdgeInsets.symmetric(horizontal: 5),
                    tabAlignment: TabAlignment.start,
                    tabs: categoriesDataList.map((data) {
                      return CreateEventTabBarItemWidget(
                        categoryData: data,
                        isSelected:
                        selectedIndex == categoriesDataList.indexOf(data),
                      );
                    }).toList(),
                  ),
                ),
                Text(AppStrings.title, style: theme.textTheme.bodyLarge),
                CustomTextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Title is required";
                    }
                    return null;
                  },
                  textEditingController: _titleEditingController,
                  prefixIcon: Icon(
                    Icons.edit_note_sharp,
                    color: ColorPallete.grey,
                    size: 30,
                  ),
                  hintText: "Event Title",
                ),
                Text(AppStrings.description, style: theme.textTheme.bodyLarge),
                CustomTextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Description is required";
                    }
                    return null;
                  },

                  textEditingController: _descriptionEditingController,
                  hintText: "Event Description",
                  maxLines: 4,
                ),
                Row(
                  children: [
                    Icon(Icons.calendar_month),
                    SizedBox(width: 5),
                    Text("Event Date"),
                    Spacer(),
                    Bounceable(
                      onTap: () {
                        getCurrentDate();
                      },
                      child: Text(
                          "${data.selectedDate.day}-${data.selectedDate.month}-${data.selectedDate.year}",
                        softWrap: true
                        ,
                        style: theme.textTheme.bodyLarge!.copyWith(
                          color: ColorPallete.primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.timer),
                    SizedBox(width: 5),
                    Text(AppStrings.eventTime),
                    Spacer(),
                    Bounceable(
                      onTap: () async {
                        final picked = await getCurrentTime(context);
                        if (picked != null) {
                          setState(() {
                            //  timeOfDay=picked;
                          });
                        }
                      },
                      child: Text(
                        "${data.selectedDate.hour}:${data.selectedDate.minute}:${data.selectedDate.second}",
                        softWrap: true
                        ,
                        style: theme.textTheme.bodyLarge!.copyWith(
                          color: ColorPallete.primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
               Text("Location",style: theme.textTheme.bodyLarge,),
                Container(
                  width: double.infinity,height:64 ,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: ColorPallete.primaryColor)
                  ),
                  child: Consumer<MapProvider>(
                    builder: (context, value, child) => CustomButtonStyle(
                      onTap: () {
                        Navigator.pushNamed(context, PageRoutesName.pickEvent);
                      },
                      color: ColorPallete.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: ColorPallete.primaryColor,
                              ),
                              child: Icon(
                                Icons.my_location,
                                size: 30,
                                color: ColorPallete.white,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              mapProvider.eventLocation == null
                                  ? "Choose Event Location"
                                  : "${value.eventLocation!.latitude.toString()},${value.eventLocation!.longitude.toString()}",
                              style: theme.textTheme.bodyLarge!.copyWith(
                                color: ColorPallete.primaryColor,
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: ColorPallete.primaryColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 150),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SizedBox(
          width: double.infinity,
          child: CustomButtonStyle(
            onTap: () async {
              print("Button Tapped");
              if (formKey.currentState!.validate()) {
                // لو المستخدم ما اختارش تاريخ جديد، خدي القديم
                selectedDate ??= data.selectedDate;

                var updateEvent = EventData(
                  eventId: data.eventId,
                  eventTitle: _titleEditingController.text,
                  eventDescription: _descriptionEditingController.text,
                  eventCategoryImg: categoriesDataList[selectedIndex].imgPath,
                  eventCategoryId: categoriesDataList[selectedIndex].id,
                  selectedDate: selectedDate!,
                  lat: mapProvider.eventLocation?.latitude ?? data.lat,
                  long: mapProvider.eventLocation?.longitude ?? data.long,
                );

                EasyLoading.show(status: "Updating...");
                await FirebaseFirestoreUtils.updateEventTasks(eventData: updateEvent);
                EasyLoading.dismiss();

                Navigator.pop(context,true);
              }
            },
            color: ColorPallete.primaryColor,
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                    "Update Event",
                    style: theme.textTheme.titleSmall!.copyWith(
                      color: ColorPallete.white,
                    ),
                    ),
                ),
          ),        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void getCurrentDate() {
    showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      initialDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    ).then((value) {
      setState(() {
        selectedDate = value;
      });
    });
  }

  Future<TimeOfDay?> getCurrentTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    setState(() {});
    return pickedTime;
  }

  List<CategoryData> categoriesDataList = [
    CategoryData(
      id: "sports",
      imgPath: AppAssets.sportimg,
      name: "sports",
      iconData: Icons.sports_basketball,
    ),
    CategoryData(
      id: "birthday",
      imgPath: AppAssets.birthdayimg,
      name: "birthday",
      iconData: Icons.party_mode,
    ),
    CategoryData(
      id: "Book Club",
      imgPath: AppAssets.bookclubimg,
      name: "Book Club",
      iconData: Icons.local_library,
    ),
    CategoryData(
      id: "Holiday",
      imgPath: AppAssets.holidayimg,
      name: "Holiday",
      iconData: Icons.holiday_village,
    ),
    CategoryData(
      id: "Exhibition",
      imgPath: AppAssets.exhibitionimg,
      name: "Exhibition",
      iconData: Icons.menu_book,
    ),
    CategoryData(
      id: "meeting",
      imgPath: AppAssets.meetingimg,
      name: "meeting",
      iconData: Icons.meeting_room_outlined,
    ),
    CategoryData(
      id: "Eating",
      imgPath: AppAssets.eatingimg,
      name: "Eating",
      iconData: Icons.food_bank,
    ),
    CategoryData(
      id: "WorkShop",
      imgPath: AppAssets.workshopimg,
      name: "WorkShop",
      iconData: Icons.workspaces,
    ),
    CategoryData(
      id: "Gaming",
      imgPath: AppAssets.gamingimg,
      name: "Gaming",
      iconData: Icons.games,
    ),
  ];
}
