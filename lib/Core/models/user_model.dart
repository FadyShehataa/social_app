import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? uId;
  final String? name;
  final String? email;
  final String? phone;
  final String? image;
  final String? bio;
  final String? cover;
  final List<String>? savedPosts;

  const UserModel({
    this.uId,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.bio,
    this.cover,
    this.savedPosts,
  });

  factory UserModel.fromMap(Map<String, dynamic> data) => UserModel(
        uId: data['uId'] as String?,
        name: data['name'] as String?,
        email: data['email'] as String?,
        phone: data['phone'] as String?,
        image: data['image'] as String?,
        bio: data['bio'] as String?,
        cover: data['cover'] as String?,
        savedPosts: data['savedPosts'] != null
            ? List<String>.from(data['savedPosts'] as List<dynamic>)
            : [],
      );

  Map<String, dynamic> toMap() => {
        'uId': uId,
        'name': name,
        'email': email,
        'phone': phone,
        'image': image,
        'bio': bio,
        'cover': cover,
        'savedPosts': savedPosts,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserModel].
  factory UserModel.fromJson(String data) {
    return UserModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UserModel] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [uId, name, email, phone, image, bio, cover, savedPosts];
}
