import 'package:basreng/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:mysql1/mysql1.dart';

class RegisterForm {
  final String role;
  final String name;
  final String email;
  final String password;

  RegisterForm({
    required this.role,
    required this.name,
    required this.email,
    required this.password,
  });

  String? validate() {
    final nameResult = ValidationBuilder().required().build()(name);
    if (nameResult != null) {
      return nameResult;
    }

    final emailResult = ValidationBuilder().email().build()(email);
    if (emailResult != null) {
      return emailResult;
    }

    final passwordResult =
        ValidationBuilder().required().minLength(8).build()(password);
    if (passwordResult != null) {
      return passwordResult;
    }

    return null;
  }
}

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final MySqlConnection db = Database.instance!;

  RegisterBloc() : super(RegisterState(isError: false, message: "")) {
    on<RegisterCreateUserEvent>((event, emit) async {
      final validateResult = event.form.validate();
      if (validateResult != null) {
        emit(RegisterState(isError: true, message: validateResult));
        return;
      }

      try {
        final userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: event.form.email,
          password: event.form.password,
        );

        await db.query(
          "INSERT INTO users (id, name, role) VALUES (?, ?, ?)",
          [
            userCredential.user!.uid,
            event.form.name,
            event.form.role.toLowerCase(),
          ],
        );
      } on FirebaseAuthException catch (e) {
        emit(RegisterState(
          isError: true,
          message: e.message ?? "There's a problem",
        ));
      }
    });
  }
}

class RegisterEvent {}

class RegisterCreateUserEvent extends RegisterEvent {
  final RegisterForm form;

  RegisterCreateUserEvent({required this.form});
}

class RegisterState {
  final bool isError;
  final String message;

  RegisterState({
    required this.isError,
    required this.message,
  });
}
