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
              title: 'Marisa',
              description: 'Mathematics Specialist',
              image: Image(
                image: AssetImage('images/avatar.png'),
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
                  image: AssetImage('images/prof-tutor.jpg'),
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
              height: 116,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  10,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Container(
                      width: 220,
                      padding: EdgeInsets.all(12),
                      color: Colors.black.withOpacity(0.05),
                      child: Column(
                        children: const [
                          Row(
                            children: [
                              Image(
                                width: 24,
                                height: 24,
                                image: AssetImage('images/xxx.png'),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Text('Ammy'),
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
                          Text('Tutor1 is an excellent teacher.'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            SizedBox(
              height: 56,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  10,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Container(
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
                        children: const [
                          Image(
                            width: 32,
                            height: 32,
                            image: AssetImage('images/cat.png'),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text('Mathematics'),
                        ],
                      ),
                    ),
                  ),
                ),
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
