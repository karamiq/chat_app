// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_requset_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TicketRequestModel {
  String get title;
  String? get description;
  List<String>? get attachments;

  /// Create a copy of TicketRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TicketRequestModelCopyWith<TicketRequestModel> get copyWith =>
      _$TicketRequestModelCopyWithImpl<TicketRequestModel>(
          this as TicketRequestModel, _$identity);

  /// Serializes this TicketRequestModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TicketRequestModel &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other.attachments, attachments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, description,
      const DeepCollectionEquality().hash(attachments));

  @override
  String toString() {
    return 'TicketRequestModel(title: $title, description: $description, attachments: $attachments)';
  }
}

/// @nodoc
abstract mixin class $TicketRequestModelCopyWith<$Res> {
  factory $TicketRequestModelCopyWith(
          TicketRequestModel value, $Res Function(TicketRequestModel) _then) =
      _$TicketRequestModelCopyWithImpl;
  @useResult
  $Res call({String title, String? description, List<String>? attachments});
}

/// @nodoc
class _$TicketRequestModelCopyWithImpl<$Res>
    implements $TicketRequestModelCopyWith<$Res> {
  _$TicketRequestModelCopyWithImpl(this._self, this._then);

  final TicketRequestModel _self;
  final $Res Function(TicketRequestModel) _then;

  /// Create a copy of TicketRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = freezed,
    Object? attachments = freezed,
  }) {
    return _then(_self.copyWith(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      attachments: freezed == attachments
          ? _self.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _TicketRequestModel extends TicketRequestModel {
  const _TicketRequestModel(
      {required this.title, this.description, final List<String>? attachments})
      : _attachments = attachments,
        super._();

  @override
  final String title;
  @override
  final String? description;
  final List<String>? _attachments;
  @override
  List<String>? get attachments {
    final value = _attachments;
    if (value == null) return null;
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of TicketRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TicketRequestModelCopyWith<_TicketRequestModel> get copyWith =>
      __$TicketRequestModelCopyWithImpl<_TicketRequestModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TicketRequestModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TicketRequestModel &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, description,
      const DeepCollectionEquality().hash(_attachments));

  @override
  String toString() {
    return 'TicketRequestModel(title: $title, description: $description, attachments: $attachments)';
  }
}

/// @nodoc
abstract mixin class _$TicketRequestModelCopyWith<$Res>
    implements $TicketRequestModelCopyWith<$Res> {
  factory _$TicketRequestModelCopyWith(
          _TicketRequestModel value, $Res Function(_TicketRequestModel) _then) =
      __$TicketRequestModelCopyWithImpl;
  @override
  @useResult
  $Res call({String title, String? description, List<String>? attachments});
}

/// @nodoc
class __$TicketRequestModelCopyWithImpl<$Res>
    implements _$TicketRequestModelCopyWith<$Res> {
  __$TicketRequestModelCopyWithImpl(this._self, this._then);

  final _TicketRequestModel _self;
  final $Res Function(_TicketRequestModel) _then;

  /// Create a copy of TicketRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? description = freezed,
    Object? attachments = freezed,
  }) {
    return _then(_TicketRequestModel(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      attachments: freezed == attachments
          ? _self._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

// dart format on
