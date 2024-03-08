import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
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
  List<Object?> get props => [uuid];

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  factory User.fromFirebaseUser(UserCredential credential) => User(
    uuid: credential.user?.uid ?? "",
    name: credential.additionalUserInfo?.username ?? "",
    accessToken: credential.credential?.accessToken ?? "",
    email: credential.user?.email ?? "",
    profileImage: credential.user?.photoURL ?? "",
    token: credential.credential?.token ?? 0,
  );

  @override
  String toString() {
    return name;
  }
}