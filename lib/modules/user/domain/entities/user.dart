import 'package:equatable/equatable.dart';

final class User extends Equatable {
  final String uuid;
  final String name;
  final String email;
  final String profileImage;
  final String accessToken;
  final int token;

  const User({
    required this.uuid,
    required this.name,
    required this.email,
    required this.profileImage,
    required this.accessToken,
    required this.token,
  });

  @override
  List<Object?> get props => [uuid, name, email, profileImage, accessToken, token];
}