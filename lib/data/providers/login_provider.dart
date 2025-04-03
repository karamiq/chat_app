import 'package:app/core/settings/supabase_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_state/riverpod_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

part 'login_provider.g.dart';

@riverpod
class Login extends _$Login with AsyncXNotifierMixin<void> {
  @override
  Future<AsyncX<void>> build() => idle();

  @useResult
  RunXCallback<void> sendOtp(String phoneNumber) => handle(() async {
        await ref
            .read(supabaseClientProvider)
            .auth
            .signInWithOtp(phone: phoneNumber);
      });

  @useResult
  RunXCallback<void> verifyOtp(String phoneNumber, String otp) =>
      handle(() async {
        await ref.read(supabaseClientProvider).auth.verifyOTP(
              phone: phoneNumber,
              token: otp,
              type: OtpType.sms,
            );
        //  return response;
      });
}

class TwilioService {
  final TwilioFlutter twilioFlutter = TwilioFlutter(
    accountSid: 'ACa479a06bc1050c03abebb0bd7ea6d996',
    authToken: '6f101e97a09389347020e5db78fb8023',
    twilioNumber: '+17759935792',
  );

  void sendOTP(String phoneNumber, String otp) async {
    await twilioFlutter.sendSMS(
      toNumber: phoneNumber, // SMS does not need "whatsapp:"
      messageBody: "Your OTP is: $otp",
    );
    print("OTP Sent to $phoneNumber");
  }

  Future<void> sendWhatsAppOTP(String phoneNumber, String otp) async {
    try {
      await twilioFlutter.sendWhatsApp(
        toNumber: 'whatsapp:$phoneNumber', // FIXED format
        messageBody: 'Your OTP is: $otp',
      );
    } catch (e) {
      // Handle error
    }
  }
}

// Future<void> sendWhatsAppMessage() async {
//   final dio = Dio();

//   const accountSid = 'ACa479a06bc1050c03abebb0bd7ea6d996';
//   const authToken = '6f101e97a09389347020e5db78fb8023';
//   const url =
//       'https://api.twilio.com/2010-04-01/Accounts/$accountSid/Messages.json';

//   final credentials = '$accountSid:$authToken';
//   final encodedCredentials = 'Basic ${base64Encode(utf8.encode(credentials))}';

//   try {
//     final response = await dio.post(
//       url,
//       data: FormData.fromMap({
//         'To': 'whatsapp:+9647728833423',
//         'From': 'whatsapp:+14155238886',
//         'ContentSid': 'HX229f5a04fd0510ce1b071852155d3e75',
//         'ContentVariables': '{"1":"this is it"}',
//       }),
//       options: Options(
//         headers: {
//           'Authorization': encodedCredentials,
//           'Content-Type': 'application/x-www-form-urlencoded',
//         },
//       ),
//     );

//     print('Response: ${response.data}');
//   } catch (e) {
//     print('Error: $e');
//   }
// }
