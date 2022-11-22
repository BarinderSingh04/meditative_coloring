import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

part "user.g.dart";

final userProvider = StateProvider<User?>((ref) => null);

@JsonSerializable(fieldRename: FieldRename.pascal)
class User {
  @JsonKey(name: "FName")
  final String firstName;
  @JsonKey(name: "LName")
  final String lastName;
  final String email;
  final String phone;
  final DateTime dob;

  User(this.firstName, this.lastName, this.email, this.phone, this.dob);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
