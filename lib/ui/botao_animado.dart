// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:basreng/bloc/auth_input_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dashboard.dart';

class BotaoAnimado extends StatelessWidget {
  TextEditingController txtEmail;
  TextEditingController txtPass;
  AnimationController controller;
  Animation<double> largura;
  Animation<double> altura;
  Animation<double> radius;
  Animation<double> opacidade;

  BotaoAnimado(
      {super.key,
      required this.controller,
      required this.txtEmail,
      required this.txtPass})
      : largura = Tween<double>(
          begin: 0,
          end: 500,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 0.5),
          ),
        ),
        altura = Tween<double>(
          begin: 0,
          end: 50,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.5, 0.7),
          ),
        ),
        radius = Tween<double>(
          begin: 0,
          end: 20,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.6, 1.0),
          ),
        ),
        opacidade = Tween<double>(
          begin: 0,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.6, 0.8),
          ),
        );

  Widget _buildAnimation(BuildContext context, Widget? widget) {
    return InkWell(
      onTap: () => login(context),
      child: Container(
        width: largura.value,
        height: altura.value,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius.value),
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(255, 100, 127, 1),
              Color.fromRGBO(255, 123, 145, 1),
            ],
          ),
        ),
        child: Center(
          child: FadeTransition(
            opacity: opacidade,
            child: const Text(
              "Masuk",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: _buildAnimation,
    );
  }

  void login(BuildContext context) async {
    try {
      context.read<AuthInputBloc>().add(AuthInputEvent(null));
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: txtEmail.text, password: txtPass.text);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Dashboard()));
    } on FirebaseAuthException catch (e) {
      context.read<AuthInputBloc>().add(AuthInputEvent(e.message));
    }
  }
}
