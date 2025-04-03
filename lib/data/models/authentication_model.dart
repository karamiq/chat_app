import 'package:app/core/utils/annotations/freezed.dart';
import 'package:app/core/utils/annotations/json_serializable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_model.freezed.dart';
part 'authentication_model.g.dart';

@freezedResponse
abstract class AuthenticationModel with _$AuthenticationModel {
  const AuthenticationModel._();

  @jsonSerializableResponse
  const factory AuthenticationModel({
    required String uid,
    required String name,
    required String phoneNumber,
    required String image,
    required String token,
    required String aboutMe,
    required String lastSeen,
    required String createdAt,
    required bool isOnline,
    required List<String> friendrsUids,
    required List<String> firendRequestsUids,
    required List<String> sentFriendRequestsUids,
    // Id get isarId => fastHash(id!);
  }) = _AuthenticationModel;

  factory AuthenticationModel.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationModelFromJson(json);
}
