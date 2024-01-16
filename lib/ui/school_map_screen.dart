import 'package:basreng/bloc/school_marker_bloc.dart';
import 'package:basreng/model/location_marker.dart';
import 'package:basreng/ui/school_information_screen.dart';
import 'package:basreng/widget/my_back_appbar.dart';
import 'package:basreng/widget/my_rounded_button.dart';
import 'package:draggable_bottom_sheet/draggable_bottom_sheet.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SchoolMapScreen extends StatelessWidget {
  final LocationMarker locationMarker;

  const SchoolMapScreen({super.key, required this.locationMarker});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DraggableBottomSheet(
        onDragging: (pos) {},
        minExtent: 200,
        maxExtent: MediaQuery.of(context).size.height * 0.8,
        previewWidget: _previewWidget(),
        expandedWidget: _expandedWidget(),
        backgroundWidget: _backgroundWidget(context),
      ),
    );
  }

  Widget _backgroundWidget(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: myBackAppBar(
        context,
        title: 'School Map',
      ),
      body: GoogleMap(
        gestureRecognizers: {
          Factory<OneSequenceGestureRecognizer>(
            () => EagerGestureRecognizer(),
          ),
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(
            double.parse(locationMarker.lat),
            double.parse(locationMarker.long),
          ),
          zoom: 8,
        ),
        markers: {
          Marker(
            markerId: MarkerId(locationMarker.name),
            position: LatLng(
              double.parse(locationMarker.lat),
              double.parse(locationMarker.long),
            ),
          ),
        },
      ),
    );
  }

  Widget _expandedWidget() {
    return MySchoolMapSheet(
      locationMarker: locationMarker,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 25,
          top: 15,
        ),
        child: SizedBox(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              Padding(
                padding: EdgeInsets.only(right: 9),
                child: Image(
                  image: AssetImage('images/lap.png'),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                    image: AssetImage('images/lap.png'),
                    height: 95,
                  ),
                  Image(
                    image: AssetImage('images/lap.png'),
                    height: 95,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _previewWidget() {
    return MySchoolMapSheet(
      locationMarker: locationMarker,
      body: SizedBox(
        width: 0,
        height: 0,
      ),
    );
  }
}

class MySchoolMapSheet extends StatelessWidget {
  final LocationMarker locationMarker;
  final Widget body;

  const MySchoolMapSheet({
    super.key,
    required this.body,
    required this.locationMarker,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 7),
              width: 48,
              height: 8,
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              locationMarker.name,
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: BlocProvider(
              create: (context) => SchoolMarkerBloc()
                ..add(
                  GetPlacemarkSchoolEvent(
                    lat: double.parse(locationMarker.lat),
                    long: double.parse(
                      locationMarker.long,
                    ),
                  ),
                ),
              child: BlocBuilder<SchoolMarkerBloc, SchoolMarkerState>(
                builder: (context, state) {
                  return Text(
                    '${state.placemark?.subLocality}, ${state.placemark?.locality}, ${state.placemark?.subAdministrativeArea}, ${state.placemark?.administrativeArea}, ${state.placemark?.postalCode}, ${state.placemark?.country}',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 25,
              top: 15,
            ),
            child: Row(
              children: [
                MyRoundedButton(
                  fontSize: 10,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 6,
                  ),
                  title: 'School Info',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SchoolInformationScreen(
                            locationMarker: locationMarker),
                      ),
                    );
                  },
                ),
                SizedBox(
                  width: 7,
                ),
                MyRoundedButton(
                  fontSize: 10,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 6,
                  ),
                  isSecondary: true,
                  title: 'Save',
                  onTap: () {},
                ),
              ],
            ),
          ),
          body,
        ],
      ),
    );
  }
}
