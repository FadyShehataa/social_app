import 'dart:convert';

import 'package:equatable/equatable.dart';

class PostModel extends Equatable {
  final String? name;
  final String? uId;
  final String? image;
  final String? postImage;
  final String? text;
  final String? dateTime;
  final String? postId;
  final List<String>? likes;

  const PostModel({
    this.name,
    this.uId,
    this.image,
    this.postImage,
    this.text,
    this.dateTime,
    this.postId,
    this.likes,
  });

  factory PostModel.fromMap(Map<String, dynamic> data) => PostModel(
        name: data['name'] as String?,
        uId: data['uId'] as String?,
        image: data['image'] as String?,
        postImage: data['postImage'] as String?,
        text: data['text'] as String?,
        dateTime: data['dateTime'] as String?,
        postId: data['postId'] as String?,
        likes: data['likes'] != null
            ? List<String>.from(data['likes'] as List<dynamic>)
            : [],
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'uId': uId,
        'image': image,
        'postImage': postImage,
        'text': text,
        'dateTime': dateTime,
        'postId': postId,
        'likes': likes,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PostModel].
  factory PostModel.fromJson(String data) {
    return PostModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PostModel] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props {
    return [
      name,
      uId,
      image,
      postImage,
      text,
      dateTime,
      postId,
      likes,
    ];
  }
}
