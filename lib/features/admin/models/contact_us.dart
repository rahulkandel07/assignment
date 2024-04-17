// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ContactUs {
  final String docsId;
  final String firstName;
  final String lastName;
  final String email;
  final String message;

  ContactUs({
    required this.docsId,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.message,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'docsId': docsId,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'message': message,
    };
  }

  factory ContactUs.fromMap(Map<String, dynamic> map) {
    return ContactUs(
      docsId: map['docsId'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ContactUs.fromJson(String source) =>
      ContactUs.fromMap(json.decode(source) as Map<String, dynamic>);
}
