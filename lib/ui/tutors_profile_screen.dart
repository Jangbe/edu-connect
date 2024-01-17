import 'package:basreng/widget/my_back_appbar.dart';
import 'package:basreng/widget/my_rounded_button.dart';
import 'package:basreng/widget/my_row_card.dart';
import 'package:flutter/material.dart';

class TutorsProfileScreen extends StatelessWidget {
  const TutorsProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myBackAppBar(
        context,
        title: 'Tutors Profile',
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            SizedBox(
              height: 32,
            ),
            MyRowCard(
              title: 'Jasman Pardede',
              description: 'Mathematics Specialist',
              image: Image(
                image: AssetImage('images/jasman.png'),
                width: 40,
              ),
              action: SizedBox(
                height: 0,
                width: 0,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Image(
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                  image: AssetImage('images/jasman.png'),
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About Me',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'I have 5 years of experience teaching Mathematics at various levels.',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(),
            SizedBox(
              height: 28,
            ),
            SizedBox(
              height: 130,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: MyCommentCard(
                      name: 'Ammy',
                      comment: 'Tutor1 is an excellent teacher.',
                      imageProvider: AssetImage('images/xxx.png'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: MyCommentCard(
                      name: 'Johnson',
                      comment:
                          'Tutor1 helped me understand complex concepts easily.',
                      imageProvider: AssetImage('images/xxx2.png'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: MyCommentCard(
                      name: 'Ammy',
                      comment: 'Tutor1 is an excellent teacher.',
                      imageProvider: AssetImage('images/xxx.png'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            SizedBox(
              height: 56,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: MySubjectCard(
                      title: 'Mathematics',
                      imageProvider: AssetImage('images/cat.png'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: MySubjectCard(
                      title: 'Physics',
                      imageProvider: AssetImage('images/cat2.png'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: MySubjectCard(
                      title: 'Mathematics',
                      imageProvider: AssetImage('images/cat.png'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 31,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyRoundedButton(
                  isSecondary: true,
                  padding: EdgeInsets.symmetric(
                    horizontal: 27,
                    vertical: 10,
                  ),
                  title: 'Contact Tutor',
                  onTap: () {},
                ),
                MyRoundedButton(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  title: 'Book a Session',
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MySubjectCard extends StatelessWidget {
  final String title;
  final ImageProvider imageProvider;

  const MySubjectCard({
    super.key,
    required this.title,
    required this.imageProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black.withOpacity(0.05),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      child: Row(
        children: [
          Image(
            width: 32,
            height: 32,
            image: imageProvider,
          ),
          SizedBox(
            width: 8,
          ),
          Text(title),
        ],
      ),
    );
  }
}

class MyCommentCard extends StatelessWidget {
  final String name;
  final String comment;
  final ImageProvider imageProvider;

  const MyCommentCard({
    super.key,
    required this.name,
    required this.comment,
    required this.imageProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      padding: EdgeInsets.all(12),
      color: Colors.black.withOpacity(0.05),
      child: Column(
        children: [
          Row(
            children: [
              Image(
                width: 24,
                height: 24,
                image: imageProvider,
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Text(name),
              ),
              Image(
                width: 59,
                height: 10,
                image: AssetImage('images/5star.png'),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Text(comment),
        ],
      ),
    );
  }
}
