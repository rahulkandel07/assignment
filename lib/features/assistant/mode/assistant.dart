// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Assistant {
  final String userId;
  final String members;
  final String date;
  final String notes;
  final String subrub;
  final String hampers;
  final String status;
  final String? docsId;

  Assistant({
    required this.userId,
    required this.date,
    required this.hampers,
    required this.members,
    required this.notes,
    required this.subrub,
    required this.status,
    this.docsId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'members': members,
      'date': date,
      'notes': notes,
      'subrub': subrub,
      'hampers': hampers,
      'status': status,
    };
  }

  factory Assistant.fromMap(Map<String, dynamic> map) {
    return Assistant(
      userId: map['userId'] as String,
      members: map['members'] as String,
      date: map['date'] as String,
      notes: map['notes'] as String,
      subrub: map['subrub'] as String,
      hampers: map['hampers'] as String,
      status: map['status'] as String,
      docsId: map['docsId'].toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Assistant.fromJson(String source) =>
      Assistant.fromMap(json.decode(source) as Map<String, dynamic>);
}
