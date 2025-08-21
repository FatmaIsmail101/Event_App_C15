import 'package:evently/core/routes/page_routes_name.dart';
import 'package:evently/core/theme/color_pallete.dart';
import 'package:evently/model/event_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../core/providers/map_provider.dart';
import '../../../../core/utils/firebase_firestore_uitles.dart';


class EventDetails extends StatefulWidget {
   const EventDetails({super.key,});

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  @override
  late MapProvider mapProvider;
  @override
  void initState() {
    super.initState();

    MapProvider mapProvider = Provider.of<MapProvider>(context, listen: false);
    mapProvider.getLocation();
    mapProvider.setLocationListner();
  }

  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    final data=ModalRoute.of(context)!.settings.arguments
    as   EventData;

    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Event Details",style: theme.textTheme.headlineSmall!.copyWith(
          color: ColorPallete.primaryColor
        ),),
        actions: [
          Bounceable(onTap: () {
           Navigator.pushNamed(context, PageRoutesName.eventUpdate,
           arguments: data);
          },
          child: Icon(Icons.edit)),
          Bounceable(
              onTap: () async{
               await FirebaseFirestoreUtils.deleteEventTasks(eventData: data);
                Navigator.pop(context);
              },
              child: Icon(Icons.delete,color: Colors.red,))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              ClipRRect(
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadiusGeometry.circular(16),
                  child: Image.asset(data.eventCategoryImg)),
              Text(data.eventTitle,style: theme.textTheme.titleLarge!.
                copyWith(color: ColorPallete.primaryColor,fontWeight: FontWeight.w500),),
              Container(
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
                          child: Text("${data.selectedDate.day}-${data.selectedDate.month}-${data.selectedDate.year}" ,style: theme.textTheme.bodyLarge
                            !.copyWith(color: ColorPallete.primaryColor),),
                        ),
                        Text("${data.selectedDate.hour}:${data.selectedDate.minute}:${data.selectedDate.second}" ,style: theme.textTheme.bodyLarge
                        !.copyWith(color: ColorPallete.black),),

                      ],
                    ),
                  ],
                ),
              ),
              Container(
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
                        child: Icon(Icons.gps_fixed_outlined,color: ColorPallete.white,
                          size: 30,),
                      ),
                    ),

                    Text("${data.lat},${data.long}" ,style: theme.textTheme.bodyLarge
                    !.copyWith(color: ColorPallete.primaryColor),),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 361,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorPallete.primaryColor
                  ),
                  borderRadius: BorderRadius.circular(16)
                ),
                child: Consumer<MapProvider>(
                  builder: (BuildContext context, provider, Widget? child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: GoogleMap(
                            markers: provider.markers,
                            onMapCreated: (mapController) {
                              provider.googleMapController = mapController;
                            },
                            mapType: MapType.normal,
                            initialCameraPosition: provider.cameraPosition,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Text("Description",style: theme.textTheme.bodyLarge,),
              Text(data.eventDescription)
            ],
          ),
        ),
      ),
    );
  }
}
