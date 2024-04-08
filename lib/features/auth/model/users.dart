// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Users {
  final String firstName;
  final String lastName;
  final String email;
  final String address;
  final String phone;

  Users({
    required this.address,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'first': firstName,
      'last': lastName,
      'email': email,
      'address': address,
      'phone': phone,
    };
  }

  factory Users.fromMap(Map<String, dynamic> map) {
    return Users(
      firstName: map['first'] as String,
      lastName: map['last'] as String,
      email: map['email'] as String,
      address: map['address'] as String,
      phone: map['phone'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Users.fromJson(String source) =>
      Users.fromMap(json.decode(source) as Map<String, dynamic>);
}
