import 'package:basreng/bloc/school_marker_bloc.dart';
import 'package:basreng/ui/private_tutors_screen.dart';
import 'package:basreng/ui/school_map_screen.dart';
import 'package:basreng/widget/my_button.dart';
import 'package:basreng/widget/my_card.dart';
import 'package:basreng/widget/my_headbar.dart';
import 'package:basreng/widget/my_row_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image(
          image: AssetImage('images/educonnect-logo.png'),
        ),
        titleSpacing: 0,
        title: Text(
          'EduConnect',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        shadowColor: Colors.black,
        elevation: 1,
        backgroundColor: Colors.white,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 14),
            child: Image(
              image: AssetImage('images/hamb.png'),
              width: 24,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (index == 2) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PrivateTutorsScreen(),
              ),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'School Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Tutors',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            top: 16,
            left: 12,
            right: 12,
          ),
          child: Column(
            children: [
              MyRowCard(
                title: 'Welcome, Syadda',
                description: 'Connection education',
                image: Image(
                  image: AssetImage('images/avatar.png'),
                  width: 40,
                ),
                action: MyButton(title: 'Profile'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: MyHeadbar(
                  title: 'Explore Schools',
                  actionTitle: 'See All Schools',
                ),
              ),
              Container(
                height: 336,
                margin: EdgeInsets.only(top: 6),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(
                    Radius.circular(6),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: BlocProvider(
                  create: (context) =>
                      SchoolMarkerBloc()..add(FetchAllSchoolMarkerEvent()),
                  child: BlocBuilder<SchoolMarkerBloc, SchoolMarkerState>(
                    builder: (context, state) {
                      final markers = state.markers
                          .map(
                            (e) => Marker(
                              markerId: MarkerId(e.name),
                              position: LatLng(
                                double.parse(e.lat),
                                double.parse(e.long),
                              ),
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => SchoolMapScreen(
                                    locationMarker: e,
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toSet();
                      return GoogleMap(
                        gestureRecognizers: {
                          Factory<OneSequenceGestureRecognizer>(
                              () => EagerGestureRecognizer()),
                        },
                        initialCameraPosition: CameraPosition(
                          target: LatLng(0.7893, 113.9213),
                        ),
                        markers: markers,
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: MyHeadbar(
                  title: 'Available Courses',
                  actionTitle: 'See All Courses',
                ),
              ),
              SizedBox(
                height: 12,
              ),
              SizedBox(
                height: 210,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    10,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: MyCard(
                        title: '12 Lessons',
                        subTitle: 'Physics',
                        image: AssetImage('images/card-placeholder.jpg'),
                        isNew: true,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
