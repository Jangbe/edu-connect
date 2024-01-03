import 'package:basreng/bloc/register_bloc.dart';
import 'package:basreng/ui/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const List<String> roles = ['Student', 'Teacher'];

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String role = roles.first;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void testDb() {}

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(),
      child: Scaffold(
        body: BlocListener<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state.isError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          child: Column(
            children: [
              SizedBox(
                height: 32,
              ),
              Center(
                child: Icon(
                  Icons.verified_user_rounded,
                  size: 64,
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                "Register",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 32,
              ),
              DropdownMenu(
                initialSelection: roles.first,
                onSelected: (String? value) {
                  if (!mounted) return;
                  setState(() {
                    role = value!;
                  });
                },
                dropdownMenuEntries: roles
                    .map(
                      (e) => DropdownMenuEntry(value: e, label: e),
                    )
                    .toList(),
              ),
              RegisterInput(
                label: "Name",
                controller: nameController,
              ),
              SizedBox(
                height: 16,
              ),
              RegisterInput(
                label: "Email",
                controller: emailController,
              ),
              SizedBox(
                height: 16,
              ),
              RegisterInput(
                label: "Password",
                controller: passwordController,
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Login(),
                            ),
                          );
                        },
                        child: Text("Sign in instead")),
                    BlocBuilder<RegisterBloc, RegisterState>(
                      builder: (context, state) => GestureDetector(
                        onTap: () {
                          final RegisterForm form = RegisterForm(
                            role: role,
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                          );

                          context
                              .read<RegisterBloc>()
                              .add(RegisterCreateUserEvent(form: form));
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text("Register"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const RegisterInput({
    super.key,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            label,
            textAlign: TextAlign.left,
          ),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter your $label',
            ),
          ),
        ],
      ),
    );
  }
}
