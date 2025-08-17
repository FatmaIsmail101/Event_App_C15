import 'package:evently/core/theme/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../../core/providers/map_provider.dart';

class PickEventMapScreen extends StatefulWidget {
  const PickEventMapScreen({super.key});

  @override
  State<PickEventMapScreen> createState() => _PickEventMapScreenState();
}

class _PickEventMapScreenState extends State<PickEventMapScreen> {
  @override
  void initState() {
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    MapProvider mapProvider = Provider.of<MapProvider>(context, listen: false);
    mapProvider.getLocation();
    mapProvider.setLocationListner();
    final theme = Theme.of(context);
    return Consumer<MapProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: GoogleMap(
                onTap: (location) {
                  provider.setEventLocation(location);
                  Navigator.pop(context);
                },
                markers: provider.markers,
                onMapCreated: (mapController) {
                  provider.googleMapController = mapController;
                },
                mapType: MapType.normal,
                initialCameraPosition: provider.cameraPosition,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 60,
              color: ColorPallete.primaryColor,
              child: Text(
                "Tap on Location To Select",
                style: theme.textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      },
    );
  }
}
