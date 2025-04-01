import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_state/riverpod_state.dart';

part 'login_provider.g.dart';

@riverpod
class Login extends _$Login with AsyncXNotifierMixin<dynamic> {
  @override
  Future<AsyncX<dynamic>> build() => idle();

  @useResult
  RunXCallback<dynamic> run(String phoneNumber) => handle(() async {
        await Future.delayed(const Duration(seconds: 2));
        return null;
      });
}
