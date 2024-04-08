// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Assistant {
  final String members;
  final String date;
  final String notes;
  final String subrub;
  final String hampers;

  Assistant({
    required this.date,
    required this.hampers,
    required this.members,
    required this.notes,
    required this.subrub,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'members': members,
      'date': date,
      'notes': notes,
      'subrub': subrub,
      'hampers': hampers,
    };
  }

  factory Assistant.fromMap(Map<String, dynamic> map) {
    return Assistant(
      members: map['members'] as String,
      date: map['date'] as String,
      notes: map['notes'] as String,
      subrub: map['subrub'] as String,
      hampers: map['hampers'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Assistant.fromJson(String source) =>
      Assistant.fromMap(json.decode(source) as Map<String, dynamic>);
}
