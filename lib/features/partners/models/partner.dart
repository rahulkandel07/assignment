// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Partner {
  final String id;
  final String imageUrl;

  Partner({
    required this.id,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': imageUrl,
    };
  }

  factory Partner.fromMap(Map<String, dynamic> map) {
    return Partner(
      id: map['id'] as String,
      imageUrl: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Partner.fromJson(String source) =>
      Partner.fromMap(json.decode(source) as Map<String, dynamic>);
}
