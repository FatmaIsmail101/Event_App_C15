import 'package:evently/core/providers/map_provider.dart';
import 'package:evently/core/theme/color_pallete.dart';
import 'package:evently/core/widgets/custom_button_style.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
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
    return Consumer<MapProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: Consumer<MapProvider>(
            builder: (BuildContext context, provider, Widget? child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GoogleMap(
                      markers: provider.markers,
                      onMapCreated: (mapController){
                        provider.googleMapController=mapController;
                      },
                      mapType: MapType.normal,
                      initialCameraPosition: provider.cameraPosition,
                    ),
                  ),
                ],
              );
            },
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 54,height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),color: ColorPallete.primaryColor
              ),
              child: CustomButtonStyle(
                onTap: (){
                  mapProvider.getLocation();
                },
                  child: Center(
                child: Icon(Icons.gps_fixed_outlined,color: ColorPallete.white,
                  size: 30,
                ),

              )),

            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        );
      },
    );
  }
}
