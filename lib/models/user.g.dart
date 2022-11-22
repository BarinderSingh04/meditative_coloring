// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['FName'] as String,
      json['LName'] as String,
      json['Email'] as String,
      json['Phone'] as String,
      DateTime.parse(json['Dob'] as String),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'FName': instance.firstName,
      'LName': instance.lastName,
      'Email': instance.email,
      'Phone': instance.phone,
      'Dob': instance.dob.toIso8601String(),
    };
