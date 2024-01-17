import 'package:basreng/widget/my_back_appbar.dart';
import 'package:basreng/widget/my_chip_field.dart';
import 'package:basreng/widget/my_form_title.dart';
import 'package:basreng/widget/my_rounded_button.dart';
import 'package:basreng/widget/my_text_field.dart';
import 'package:flutter/material.dart';

class ApplyForJobScreen extends StatelessWidget {
  const ApplyForJobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myBackAppBar(
        context,
        title: 'Apply for a Job',
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            left: 12,
            right: 12,
            top: 28,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyFormTitle(
                title: 'Personal Information',
              ),
              SizedBox(
                height: 12,
              ),
              MyTextField(
                label: 'Full Name',
                placeholder: 'Enter your full name',
              ),
              SizedBox(
                height: 12,
              ),
              MyTextField(
                label: 'Email',
                placeholder: 'Enter your email address',
              ),
              SizedBox(
                height: 12,
              ),
              MyTextField(
                label: 'Contact Number',
                placeholder: 'Enter your contact number',
              ),
              SizedBox(
                height: 28,
              ),
              MyFormTitle(
                title: 'Educational Background',
              ),
              SizedBox(
                height: 12,
              ),
              MyTextField(
                label: 'University',
                placeholder: 'Enter the name of your university',
              ),
              SizedBox(
                height: 12,
              ),
              MyTextField(
                label: 'Degree',
                placeholder: 'Enter your degree',
              ),
              SizedBox(
                height: 12,
              ),
              MyTextField(
                label: 'Year of Graduation',
                placeholder: 'Enter the year of graduation',
              ),
              SizedBox(
                height: 28,
              ),
              MyFormTitle(
                title: 'Teaching Experience',
              ),
              SizedBox(
                height: 12,
              ),
              MyChipField(
                label: 'Grade Level',
                children: const [
                  Text('Elementary School'),
                  Text('Middle School'),
                  Text('High School'),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              MyChipField(
                label: 'Subject',
                children: const [
                  Text('Mathematics'),
                  Text('Science'),
                  Text('English'),
                  Text('Social Studies'),
                ],
              ),
              SizedBox(
                height: 28,
              ),
              MyFormTitle(
                title: 'Additional Information',
              ),
              SizedBox(
                height: 12,
              ),
              MyTextField(
                label: 'Cover Letter',
                placeholder: 'Enter your cover letter',
              ),
              SizedBox(
                height: 12,
              ),
              MyTextField(
                label: 'References',
                placeholder: 'Enter your references',
              ),
              SizedBox(
                height: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MyRoundedButton(
                    title: 'Submit',
                    onTap: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 19,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
