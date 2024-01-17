import 'package:basreng/ui/tutors_profile_screen.dart';
import 'package:basreng/widget/my_back_appbar.dart';
import 'package:basreng/widget/my_card.dart';
import 'package:basreng/widget/my_chip_field.dart';
import 'package:basreng/widget/my_row_card.dart';
import 'package:flutter/material.dart';

class PrivateTutorsScreen extends StatelessWidget {
  const PrivateTutorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myBackAppBar(context, title: 'Private Tutors'),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyChipField(
                label: '',
                children: const [
                  Text('Browse Tutors'),
                  Text('Schedule Session'),
                  Text('Manage Payments'),
                ],
              ),
              SizedBox(
                height: 28,
              ),
              Text(
                'Find a Tutor',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              SizedBox(
                height: 210,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => TutorsProfileScreen(),
                            ),
                          );
                        },
                        child: MyCard(
                          title: 'Jasman Pardede',
                          subTitle: 'Mathematics',
                          image: AssetImage('images/jasman.png'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => TutorsProfileScreen(),
                            ),
                          );
                        },
                        child: MyCard(
                          title: 'Milda Gustiana',
                          subTitle: 'Science',
                          image: AssetImage('images/milda.png'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => TutorsProfileScreen(),
                            ),
                          );
                        },
                        child: MyCard(
                          title: 'Jasman Pardede',
                          subTitle: 'Mathematics',
                          image: AssetImage('images/jasman.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 28,
              ),
              Text(
                'Scheduled Sessions',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 26,
              ),
              MyRowCard(
                title: 'Session 1',
                description: 'Math',
                image: Image(
                  height: 32,
                  image: AssetImage('images/sch.png'),
                ),
                action: Column(
                  children: const [
                    Text('Teacher:'),
                    Text('Tutor1'),
                  ],
                ),
              ),
              Divider(),
              MyRowCard(
                title: 'Session 2',
                description: 'Physics',
                image: Image(
                  height: 32,
                  image: AssetImage('images/sch.png'),
                ),
                action: Column(
                  children: const [
                    Text('Teacher:'),
                    Text('Tutor2'),
                  ],
                ),
              ),
              Divider(),
              SizedBox(
                height: 12,
              ),
              Container(
                height: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/banner.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 28,
              ),
              Text(
                'Frequently Asked Questions',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              MyFaqCard(
                title: 'How can I cancel a scheduled session?',
                description:
                    'You can cancel a session by contacting the tutor directly.',
                imageProvider: AssetImage('images/faq.png'),
              ),
              SizedBox(
                height: 8,
              ),
              MyFaqCard(
                title: 'How do I make payments?',
                description:
                    'Payments can be made securely through the EduConnect platform.',
                imageProvider: AssetImage('images/faq2.png'),
              ),
              SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyFaqCard extends StatelessWidget {
  final String title;
  final String description;
  final ImageProvider imageProvider;

  const MyFaqCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black.withOpacity(0.2),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            width: 80,
            height: 80,
            image: imageProvider,
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
