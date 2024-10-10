import 'package:ai_tennis/core/routes/routes.dart';
import 'package:ai_tennis/features/authencation/presentation/components/custom_button.dart';
import 'package:ai_tennis/features/home/presentation/controller/get_location/get_location_bloc.dart';
import 'package:ai_tennis/features/home/presentation/controller/get_location/get_location_event.dart';
import 'package:ai_tennis/features/home/presentation/controller/get_location/get_location_state.dart';
import 'package:ai_tennis/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ai_tennis/core/utils/size_config.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:permission_handler/permission_handler.dart';

class GetLocationScreen extends StatefulWidget {
  const GetLocationScreen({super.key});

  @override
  GetLocationScreenState createState() => GetLocationScreenState();
}

class GetLocationScreenState extends State<GetLocationScreen> {
  late MapController mapController;

  @override
  void initState() {
    super.initState();

    // Initialize mapController with Cairo's coordinates
    mapController = MapController(
      initPosition: GeoPoint(latitude: 30.0444, longitude: 31.2357), // Cairo coordinates
      areaLimit: BoundingBox(
        east: 10.4922941,
        north: 47.8084648,
        south: 45.817995,
        west: 5.9559113,
      ), // Default position
    );

    // Load full name when the screen initializes
    context.read<GetLocationBloc>().add(LoadFullName());

    // Request location permission
    _checkAndRequestPermission();
  }

  Future<void> _checkAndRequestPermission() async {
    if (await Permission.location.isGranted) {
      _startUserTracking();
    } else {
      if (await Permission.location.request().isGranted) {
        _startUserTracking();
      } else {
        // Show a message if permission is denied
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Location permission is required')),
        );
      }
    }
  }

  void _startUserTracking() {
    mapController.enableTracking();
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<GetLocationBloc, GetLocationState>(
        listener: (context, state) {
          if (state is GetLocationError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          if (state is GetLocationLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FullNameLoaded || state is LocationLoaded) {
            String fullName = 'No user data found';
            String locationText = 'No location data';

            if (state is FullNameLoaded) {
              fullName = state.fullName;
            } else if (state is LocationLoaded) {
              locationText =
              'Lat: ${state.location.latitude}, Long: ${state.location.longitude}';

              // Zoom in on the user's location when loaded
              mapController.changeLocation(GeoPoint(latitude: state.location.latitude, longitude: state.location.longitude));
            }

            return SingleChildScrollView(
              child: Column(
                children: [
                  if (state is FullNameLoaded)
                    Text("Hello ${state.fullName}"),
                  SizedBox(height: 2 * SizeConfig.heightMultiplier),
                  SizedBox(height: 2 * SizeConfig.heightMultiplier),
                  if (state is LocationLoaded)
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      height: 300, // Fixed height
                      margin: EdgeInsets.symmetric(
                          horizontal: 5 * SizeConfig.widthMultiplier,
                          vertical: 2 * SizeConfig.heightMultiplier),
                      child: OSMFlutter(
                        controller: mapController,
                        osmOption: OSMOption(
                          userTrackingOption: const UserTrackingOption(
                            enableTracking: true,
                            unFollowUser: false, // Keep following user location
                          ),
                          zoomOption: const ZoomOption(
                            initZoom: 15, // Adjust zoom level if needed
                            minZoomLevel: 3,
                            maxZoomLevel: 19,
                            stepZoom: 1.0,
                          ),
                          userLocationMarker: UserLocationMaker(
                            personMarker: const MarkerIcon(
                              icon: Icon(
                                Icons.location_history_rounded,
                                color: Colors.red,
                                size: 48,
                              ),
                            ),
                            directionArrowMarker: const MarkerIcon(
                              icon: Icon(
                                Icons.double_arrow,
                                size: 48,
                              ),
                            ),
                          ),
                          roadConfiguration: const RoadOption(
                            roadColor: Colors.yellowAccent,
                          ),
                          markerOption: MarkerOption(
                            defaultMarker: const MarkerIcon(
                              icon: Icon(
                                Icons.person_pin_circle,
                                color: Colors.blue,
                                size: 56,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  SizedBox(height: 2 * SizeConfig.heightMultiplier),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 5 * SizeConfig.widthMultiplier),
                    child: TextFormField(
                      initialValue: locationText,
                      decoration: InputDecoration(
                        labelText: 'Location',
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.my_location),
                          onPressed: () {
                            context
                                .read<GetLocationBloc>()
                                .add(LoadCurrentLocation());
                          },
                        ),
                      ),
                      readOnly: true,
                    ),
                  ),
                  SizedBox(height: 2 * SizeConfig.heightMultiplier),
                  Button(
                    backgroundColor: Colors.indigoAccent,
                    label: "Get Location",
                    function: () {
                      context.read<GetLocationBloc>().add(LoadFullName());
                      context.read<GetLocationBloc>().add(LoadCurrentLocation());
                      _checkAndRequestPermission();
                    },
                  ),
                  SizedBox(height: 2 * SizeConfig.heightMultiplier),
                  Button(
                    backgroundColor: Colors.indigoAccent,
                    label: "Next",
                    function: () {
                 navigationService.navigateTo(Routes.forecast);
                    },
                  ),
                ],
              ),
            );
          } else if (state is GetLocationError) {
            return Center(
              child: Text(
                state.message,
                style: TextStyle(
                    color: Colors.red, fontSize: 3 * SizeConfig.textMultiplier),
              ),
            );
          } else {
            return Center(
              child: Text(
                'No user data found',
                style: TextStyle(fontSize: 3 * SizeConfig.textMultiplier),
              ),
            );
          }
        },
      ),
    );
  }
}
