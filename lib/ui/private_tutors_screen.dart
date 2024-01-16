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
              MyChipField(label: ''),
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
                  children: List.generate(
                    10,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: MyCard(
                        title: '12 Lessons',
                        subTitle: 'Physics',
                        image: AssetImage('images/card-placeholder.jpg'),
                      ),
                    ),
                  ),
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
                  image: AssetImage('images/job-offer-avatar.png'),
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
                title: 'Session 1',
                description: 'Math',
                image: Image(
                  height: 32,
                  image: AssetImage('images/job-offer-avatar.png'),
                ),
                action: Column(
                  children: const [
                    Text('Teacher:'),
                    Text('Tutor1'),
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
              MyFaqCard(),
              SizedBox(
                height: 8,
              ),
              MyFaqCard(),
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
  const MyFaqCard({
    super.key,
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
        children: const [
          Image(
            width: 80,
            height: 80,
            image: AssetImage('images/faq.png'),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  'How can I cancel a scheduled session?',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'You can cancel a session by contacting the tutor directly.',
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
