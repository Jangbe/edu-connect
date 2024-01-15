import 'package:basreng/bloc/school_marker_bloc.dart';
import 'package:basreng/model/location_marker.dart';
import 'package:basreng/ui/apply_for_job_screen.dart';
import 'package:basreng/widget/my_back_appbar.dart';
import 'package:basreng/widget/my_card.dart';
import 'package:basreng/widget/my_headbar.dart';
import 'package:basreng/widget/my_rounded_button.dart';
import 'package:basreng/widget/my_row_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SchoolInformationScreen extends StatelessWidget {
  final LocationMarker locationMarker;

  const SchoolInformationScreen({super.key, required this.locationMarker});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myBackAppBar(
        context,
        title: 'School Information',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 28,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
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
                  builder: (context, state) => MyRowCard(
                    title: locationMarker.name,
                    description:
                        'Location: ${state.placemark?.locality}, ${state.placemark?.country}',
                    image: Image(
                      image: AssetImage('images/school-avatar.png'),
                      width: 40,
                    ),
                    action: SizedBox(
                      width: 0,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: SizedBox(
                height: 210,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    10,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: MyCard(
                        title: 'Computer Lab',
                        subTitle: 'School Facilities',
                        image: AssetImage('images/school-facitilies.jpg'),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: MyRoundedButton(
                    title: 'Apply Now',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ApplyForJobScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 28,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: MyHeadbar(
                title: 'Job Offers',
                actionTitle: 'See More',
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: const [
                  MyRowCard(
                    title: 'English teacher',
                    description: 'Bandung, Indonesia',
                    image: Image(
                      image: AssetImage('images/job-offer-avatar.png'),
                      width: 40,
                    ),
                    action: Column(
                      children: [
                        Text('Requirements:'),
                        Text('Qualifications'),
                        Text('Experience'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
