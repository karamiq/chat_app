import 'package:app/core/constants/sizes.dart';
import 'package:app/core/utils/extentions.dart';
import 'package:app/core/utils/validators/validators.dart';
import 'package:app/core/utils/widgets/buttons/loading_button.dart';
import 'package:app/core/utils/widgets/empty/otp_timer.dart';
import 'package:app/data/providers/login_provider.dart';
import 'package:app/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OtpPage extends ConsumerStatefulWidget {
  const OtpPage({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  createState() => _OtpPageState();
}

class _OtpPageState extends ConsumerState<OtpPage> {
  final otpController = TextEditingController();
  String? errorMessage;
  bool buttonEnabled = false;

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(loginProvider);

    Future<void> confirm() async {
      await ref
          .read(loginProvider.notifier)
          // ignore: unused_result
          .verifyOtp(widget.phoneNumber, otpController.text);
      loginState.when(
          data: (data) => null,
          loading: () => null,
          error: (error, stackTrace) {
            var e = error as AuthApiException;
            setState(() => errorMessage = e.message);
          });
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('OTP Verification'),
      ),
      body: Center(
        child: Padding(
          padding: Insets.mediumAll,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  OtpTimer(
                      duration: Duration(seconds: 60),
                      onTimerFinished: (val) => buttonEnabled = false),
                  const Text('Enter the 6-digit OTP sent to your phone number'),
                  Text(
                    widget.phoneNumber,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 20),
                  Pinput(
                    onCompleted: (value) => confirm(),
                    errorText: errorMessage,
                    length: 6,
                    validator: (otp) => ValidatorX.validate(
                        ref, otp, [RequiredRule(), MaxLengthRule(6)]),
                    controller: otpController,
                    focusedPinTheme: PinTheme(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: context.colorScheme.primary,
                          ),
                          color: context.colorScheme.surface,
                          borderRadius: BorderSize.smallRadius),
                    ),
                    errorPinTheme: PinTheme(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: context.colorScheme.error),
                            color: context.colorScheme.onInverseSurface,
                            borderRadius: BorderSize.smallRadius)),
                    defaultPinTheme: PinTheme(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: context.colorScheme.onInverseSurface,
                            borderRadius: BorderSize.smallRadius)),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Didn\'t receive the OTP?',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      ref
                          .read(loginProvider.notifier)
                          // ignore: unused_result
                          .sendOtp(widget.phoneNumber);
                      loginState.when(
                          data: (data) => null,
                          loading: () => null,
                          error: (error, stackTrace) {
                            var e = error as AuthApiException;
                            setState(() => errorMessage = e.message);
                          });
                      setState(() => errorMessage = null);
                    },
                    child: Text(
                      'Resend OTP',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  LoadingButton(
                      enabled: otpController.text.length == 6 && buttonEnabled,
                      onPressed: confirm,
                      child: const Text('Verify OTP'))
                ],
              ),
              Container()
            ],
          ),
        ),
      ),
    );
  }
}
