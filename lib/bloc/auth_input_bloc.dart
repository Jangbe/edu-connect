import 'package:flutter_bloc/flutter_bloc.dart';

class AuthInputEvent {
  final String? error;

  AuthInputEvent(this.error);
}

class AuthInputBloc extends Bloc<AuthInputEvent, String?> {
  AuthInputBloc() : super(null) {
    on<AuthInputEvent>((event, emit) {
      emit(event.error);
    });
  }
}
