// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authentication_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthenticationModel {
  String get uid;
  String get name;
  String get phoneNumber;
  String get image;
  String get token;
  String get aboutMe;
  String get lastSeen;
  String get createdAt;
  bool get isOnline;
  List<String> get friendrsUids;
  List<String> get firendRequestsUids;
  List<String> get sentFriendRequestsUids;

  /// Create a copy of AuthenticationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthenticationModelCopyWith<AuthenticationModel> get copyWith =>
      _$AuthenticationModelCopyWithImpl<AuthenticationModel>(
          this as AuthenticationModel, _$identity);

  /// Serializes this AuthenticationModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthenticationModel &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.aboutMe, aboutMe) || other.aboutMe == aboutMe) &&
            (identical(other.lastSeen, lastSeen) ||
                other.lastSeen == lastSeen) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline) &&
            const DeepCollectionEquality()
                .equals(other.friendrsUids, friendrsUids) &&
            const DeepCollectionEquality()
                .equals(other.firendRequestsUids, firendRequestsUids) &&
            const DeepCollectionEquality()
                .equals(other.sentFriendRequestsUids, sentFriendRequestsUids));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uid,
      name,
      phoneNumber,
      image,
      token,
      aboutMe,
      lastSeen,
      createdAt,
      isOnline,
      const DeepCollectionEquality().hash(friendrsUids),
      const DeepCollectionEquality().hash(firendRequestsUids),
      const DeepCollectionEquality().hash(sentFriendRequestsUids));

  @override
  String toString() {
    return 'AuthenticationModel(uid: $uid, name: $name, phoneNumber: $phoneNumber, image: $image, token: $token, aboutMe: $aboutMe, lastSeen: $lastSeen, createdAt: $createdAt, isOnline: $isOnline, friendrsUids: $friendrsUids, firendRequestsUids: $firendRequestsUids, sentFriendRequestsUids: $sentFriendRequestsUids)';
  }
}

/// @nodoc
abstract mixin class $AuthenticationModelCopyWith<$Res> {
  factory $AuthenticationModelCopyWith(
          AuthenticationModel value, $Res Function(AuthenticationModel) _then) =
      _$AuthenticationModelCopyWithImpl;
  @useResult
  $Res call(
      {String uid,
      String name,
      String phoneNumber,
      String image,
      String token,
      String aboutMe,
      String lastSeen,
      String createdAt,
      bool isOnline,
      List<String> friendrsUids,
      List<String> firendRequestsUids,
      List<String> sentFriendRequestsUids});
}

/// @nodoc
class _$AuthenticationModelCopyWithImpl<$Res>
    implements $AuthenticationModelCopyWith<$Res> {
  _$AuthenticationModelCopyWithImpl(this._self, this._then);

  final AuthenticationModel _self;
  final $Res Function(AuthenticationModel) _then;

  /// Create a copy of AuthenticationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? name = null,
    Object? phoneNumber = null,
    Object? image = null,
    Object? token = null,
    Object? aboutMe = null,
    Object? lastSeen = null,
    Object? createdAt = null,
    Object? isOnline = null,
    Object? friendrsUids = null,
    Object? firendRequestsUids = null,
    Object? sentFriendRequestsUids = null,
  }) {
    return _then(_self.copyWith(
      uid: null == uid
          ? _self.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      aboutMe: null == aboutMe
          ? _self.aboutMe
          : aboutMe // ignore: cast_nullable_to_non_nullable
              as String,
      lastSeen: null == lastSeen
          ? _self.lastSeen
          : lastSeen // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      isOnline: null == isOnline
          ? _self.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      friendrsUids: null == friendrsUids
          ? _self.friendrsUids
          : friendrsUids // ignore: cast_nullable_to_non_nullable
              as List<String>,
      firendRequestsUids: null == firendRequestsUids
          ? _self.firendRequestsUids
          : firendRequestsUids // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sentFriendRequestsUids: null == sentFriendRequestsUids
          ? _self.sentFriendRequestsUids
          : sentFriendRequestsUids // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

@jsonSerializableResponse
class _AuthenticationModel extends AuthenticationModel {
  const _AuthenticationModel(
      {required this.uid,
      required this.name,
      required this.phoneNumber,
      required this.image,
      required this.token,
      required this.aboutMe,
      required this.lastSeen,
      required this.createdAt,
      required this.isOnline,
      required final List<String> friendrsUids,
      required final List<String> firendRequestsUids,
      required final List<String> sentFriendRequestsUids})
      : _friendrsUids = friendrsUids,
        _firendRequestsUids = firendRequestsUids,
        _sentFriendRequestsUids = sentFriendRequestsUids,
        super._();
  factory _AuthenticationModel.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationModelFromJson(json);

  @override
  final String uid;
  @override
  final String name;
  @override
  final String phoneNumber;
  @override
  final String image;
  @override
  final String token;
  @override
  final String aboutMe;
  @override
  final String lastSeen;
  @override
  final String createdAt;
  @override
  final bool isOnline;
  final List<String> _friendrsUids;
  @override
  List<String> get friendrsUids {
    if (_friendrsUids is EqualUnmodifiableListView) return _friendrsUids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_friendrsUids);
  }

  final List<String> _firendRequestsUids;
  @override
  List<String> get firendRequestsUids {
    if (_firendRequestsUids is EqualUnmodifiableListView)
      return _firendRequestsUids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_firendRequestsUids);
  }

  final List<String> _sentFriendRequestsUids;
  @override
  List<String> get sentFriendRequestsUids {
    if (_sentFriendRequestsUids is EqualUnmodifiableListView)
      return _sentFriendRequestsUids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sentFriendRequestsUids);
  }

  /// Create a copy of AuthenticationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuthenticationModelCopyWith<_AuthenticationModel> get copyWith =>
      __$AuthenticationModelCopyWithImpl<_AuthenticationModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AuthenticationModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthenticationModel &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.aboutMe, aboutMe) || other.aboutMe == aboutMe) &&
            (identical(other.lastSeen, lastSeen) ||
                other.lastSeen == lastSeen) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline) &&
            const DeepCollectionEquality()
                .equals(other._friendrsUids, _friendrsUids) &&
            const DeepCollectionEquality()
                .equals(other._firendRequestsUids, _firendRequestsUids) &&
            const DeepCollectionEquality().equals(
                other._sentFriendRequestsUids, _sentFriendRequestsUids));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uid,
      name,
      phoneNumber,
      image,
      token,
      aboutMe,
      lastSeen,
      createdAt,
      isOnline,
      const DeepCollectionEquality().hash(_friendrsUids),
      const DeepCollectionEquality().hash(_firendRequestsUids),
      const DeepCollectionEquality().hash(_sentFriendRequestsUids));

  @override
  String toString() {
    return 'AuthenticationModel(uid: $uid, name: $name, phoneNumber: $phoneNumber, image: $image, token: $token, aboutMe: $aboutMe, lastSeen: $lastSeen, createdAt: $createdAt, isOnline: $isOnline, friendrsUids: $friendrsUids, firendRequestsUids: $firendRequestsUids, sentFriendRequestsUids: $sentFriendRequestsUids)';
  }
}

/// @nodoc
abstract mixin class _$AuthenticationModelCopyWith<$Res>
    implements $AuthenticationModelCopyWith<$Res> {
  factory _$AuthenticationModelCopyWith(_AuthenticationModel value,
          $Res Function(_AuthenticationModel) _then) =
      __$AuthenticationModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String uid,
      String name,
      String phoneNumber,
      String image,
      String token,
      String aboutMe,
      String lastSeen,
      String createdAt,
      bool isOnline,
      List<String> friendrsUids,
      List<String> firendRequestsUids,
      List<String> sentFriendRequestsUids});
}

/// @nodoc
class __$AuthenticationModelCopyWithImpl<$Res>
    implements _$AuthenticationModelCopyWith<$Res> {
  __$AuthenticationModelCopyWithImpl(this._self, this._then);

  final _AuthenticationModel _self;
  final $Res Function(_AuthenticationModel) _then;

  /// Create a copy of AuthenticationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? uid = null,
    Object? name = null,
    Object? phoneNumber = null,
    Object? image = null,
    Object? token = null,
    Object? aboutMe = null,
    Object? lastSeen = null,
    Object? createdAt = null,
    Object? isOnline = null,
    Object? friendrsUids = null,
    Object? firendRequestsUids = null,
    Object? sentFriendRequestsUids = null,
  }) {
    return _then(_AuthenticationModel(
      uid: null == uid
          ? _self.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      aboutMe: null == aboutMe
          ? _self.aboutMe
          : aboutMe // ignore: cast_nullable_to_non_nullable
              as String,
      lastSeen: null == lastSeen
          ? _self.lastSeen
          : lastSeen // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      isOnline: null == isOnline
          ? _self.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      friendrsUids: null == friendrsUids
          ? _self._friendrsUids
          : friendrsUids // ignore: cast_nullable_to_non_nullable
              as List<String>,
      firendRequestsUids: null == firendRequestsUids
          ? _self._firendRequestsUids
          : firendRequestsUids // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sentFriendRequestsUids: null == sentFriendRequestsUids
          ? _self._sentFriendRequestsUids
          : sentFriendRequestsUids // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
