import 'dart:io';
import 'dart:ui';
import 'package:basreng/bloc/auth_input_bloc.dart';
import 'package:basreng/ui/dashboard.dart';
import 'package:basreng/ui/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'botao_animado.dart';
import 'input_customizado.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  final TextEditingController _txtEmail = TextEditingController();
  final TextEditingController _txtPass = TextEditingController();
  AnimationController? _controller;
  Animation<double>? _animacaoBlur;
  Animation<double>? _animacaoFade;
  Animation<double>? _animacaoSize;

  void signInWithGoogle() async {
    if (kIsWeb) {
      GoogleAuthProvider googleProvider = GoogleAuthProvider();

      googleProvider.addScope('openid');

      await FirebaseAuth.instance.signInWithPopup(googleProvider);

      if (context.mounted) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Dashboard()));
      }
    } else {
      if (Platform.isAndroid) {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );

        await FirebaseAuth.instance.signInWithCredential(credential);

        if (context.mounted) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Dashboard()));
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _animacaoBlur = Tween<double>(
      begin: 50,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Curves.ease,
      ),
    );

    _animacaoFade = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Curves.easeInOutQuint,
      ),
    );

    _animacaoSize = Tween<double>(
      begin: 0,
      end: 500,
    ).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Curves.decelerate,
      ),
    );

    _controller?.forward();
  }

  @override
  void dispose() {
    _controller?.dispose();
    _txtEmail.dispose();
    _txtPass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AuthInputBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              AnimatedBuilder(
                animation: _animacaoBlur!,
                builder: (context, widget) {
                  return Container(
                    height: 400,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/fundo.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: _animacaoBlur!.value,
                        sigmaY: _animacaoBlur!.value,
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 10,
                            child: FadeTransition(
                              opacity: _animacaoFade!,
                              child: Image.asset("images/detalhe1.png"),
                            ),
                          ),
                          Positioned(
                            left: 50,
                            child: FadeTransition(
                              opacity: _animacaoFade!,
                              child: Image.asset("images/detalhe2.png"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
                child: Column(
                  children: [
                    AnimatedBuilder(
                      animation: _animacaoSize!,
                      builder: (context, widget) {
                        return Container(
                          width: _animacaoSize?.value,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 80,
                                spreadRadius: 1,
                              )
                            ],
                          ),
                          child: Column(
                            children: [
                              BlocBuilder<AuthInputBloc, String?>(
                                builder: (context, error) => InputCustomizado(
                                    controller: _txtEmail,
                                    hint: 'e-mail',
                                    obscure: false,
                                    icon: Icon(Icons.person),
                                    error: error),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      spreadRadius: 0.5,
                                      blurRadius: 0.5,
                                    ),
                                  ],
                                ),
                              ),
                              InputCustomizado(
                                controller: _txtPass,
                                hint: 'password',
                                obscure: true,
                                icon: Icon(Icons.lock),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    BotaoAnimado(
                        controller: _controller!,
                        txtEmail: _txtEmail,
                        txtPass: _txtPass),
                    const SizedBox(height: 10),
                    FadeTransition(
                      opacity: _animacaoFade!,
                      child: const Text(
                        "Lupa katasandi?",
                        style: TextStyle(
                          color: Color.fromRGBO(255, 100, 127, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 32.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()));
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(
                            color: Color.fromRGBO(255, 100, 127, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: const [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text("Or continue with"),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: signInWithGoogle,
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: Color.fromRGBO(255, 100, 127, 1),
                            ),
                            borderRadius: BorderRadius.circular(8)),
                        child: Image.asset(
                          "images/google.png",
                          height: 40,
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
