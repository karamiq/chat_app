import 'package:app/core/utils/annotations/freezed.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezedResponse
abstract class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    required String token,
    required String refreshToken,
    // Id get isarId => fastHash(id!);
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
