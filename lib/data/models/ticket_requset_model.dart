import 'package:app/core/utils/annotations/freezed.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_requset_model.freezed.dart';
part 'ticket_requset_model.g.dart';

@freezedRequest
abstract class TicketRequestModel with _$TicketRequestModel {
  const TicketRequestModel._();

  const factory TicketRequestModel({
    required String title,
    String? description,
    List<String>? attachments,
  }) = _TicketRequestModel;
}
