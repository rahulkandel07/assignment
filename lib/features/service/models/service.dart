import 'dart:convert';

class Service {
  final String docsId;
  final String image;
  final String title;
  final String message;

  Service({
    required this.docsId,
    required this.image,
    required this.message,
    required this.title,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'docsId': docsId,
      'image': image,
      'title': title,
      'message': message,
    };
  }

  factory Service.fromMap(Map<String, dynamic> map) {
    return Service(
      docsId: map['docsId'] as String,
      image: map['image'] as String,
      title: map['title'] as String,
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Service.fromJson(String source) =>
      Service.fromMap(json.decode(source) as Map<String, dynamic>);
}
