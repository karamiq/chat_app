// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthenticationModel _$AuthenticationModelFromJson(Map<String, dynamic> json) =>
    _AuthenticationModel(
      uid: json['uid'] as String,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      image: json['image'] as String,
      token: json['token'] as String,
      aboutMe: json['aboutMe'] as String,
      lastSeen: json['lastSeen'] as String,
      createdAt: json['createdAt'] as String,
      isOnline: json['isOnline'] as bool,
      friendrsUids: (json['friendrsUids'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      firendRequestsUids: (json['firendRequestsUids'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      sentFriendRequestsUids: (json['sentFriendRequestsUids'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$AuthenticationModelToJson(
        _AuthenticationModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'image': instance.image,
      'token': instance.token,
      'aboutMe': instance.aboutMe,
      'lastSeen': instance.lastSeen,
      'createdAt': instance.createdAt,
      'isOnline': instance.isOnline,
      'friendrsUids': instance.friendrsUids,
      'firendRequestsUids': instance.firendRequestsUids,
      'sentFriendRequestsUids': instance.sentFriendRequestsUids,
    };
