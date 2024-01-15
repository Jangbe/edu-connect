import 'package:basreng/model/location_marker.dart';
import 'package:basreng/widget/my_card.dart';
import 'package:basreng/widget/my_headbar.dart';
import 'package:basreng/widget/my_row_card.dart';
import 'package:flutter/material.dart';

class SchoolInformationScreen extends StatelessWidget {
  final LocationMarker locationMarker;

  const SchoolInformationScreen({super.key, required this.locationMarker});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Image(
            image: AssetImage('images/chv-left.png'),
          ),
        ),
        leadingWidth: 24,
        titleSpacing: 4,
        title: Text(
          'School Information',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        shadowColor: Colors.black,
        elevation: 1,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 28,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: MyRowCard(
                title: locationMarker.name,
                description: 'Location: City, Country',
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
                  child: Container(
                    height: 42,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
                    decoration: ShapeDecoration(
                      color: Color(0xFFABE2F9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          'Apply Now',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            height: 0.09,
                          ),
                        ),
                      ],
                    ),
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
