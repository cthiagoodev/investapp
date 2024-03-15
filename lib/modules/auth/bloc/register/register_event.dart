part of 'register_bloc.dart';

abstract class RegisterEvent {
  const RegisterEvent();
}

class RegisterSubmittedEvent extends RegisterEvent {
  final String email;
  final String name;
  final String? profileImage;
  final String password;

  const RegisterSubmittedEvent({
    required this.email,
    required this.name,
    this.profileImage,
    required this.password,
  });
}
