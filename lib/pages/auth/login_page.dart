import 'package:app/core/settings/supabase_client.dart';
import 'package:app/core/utils/custom_text_feileds.dart/auth_text_form_feild.dart';
import 'package:app/core/utils/decoration/auth_decoration.dart';
import 'package:app/core/utils/extentions.dart';
import 'package:app/core/utils/widgets/buttons/loading_button.dart';
import 'package:app/data/providers/login_provider.dart';
import 'package:app/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:app/core/constants/assets.dart';
import 'package:app/core/constants/sizes.dart';
import 'package:app/core/utils/validators/validators.dart';
import 'package:pinput/pinput.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _errorMessage;

  Country _selectedCountry = Country(
    phoneCode: '964',
    countryCode: 'IQ',
    e164Sc: 0,
    geographic: true,
    level: 0,
    name: 'Iraq',
    example: '7912345678',
    displayName: 'Iraq (IQ)',
    displayNameNoCountryCode: 'Iraq',
    e164Key: '',
  );

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(loginProvider);
    final auth = ref.watch(loginProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: Insets.mediumAll,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Gap(40),
                SizedBox(
                  height: 180,
                  width: 180,
                  child: Lottie.asset(
                    Assets.assetsLottieLoginLogo,
                    fit: BoxFit.cover,
                  ),
                ),
                const Text(
                  'Chit Chat',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
                const Gap(20),
                const Text(
                  'Enter your phone number to login',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const Gap(32),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                          onTap: () => showCountryPicker(
                                context: context,
                                onSelect: (Country country) {
                                  setState(() => _selectedCountry = country);
                                },
                              ),
                          readOnly: true,
                          controller: TextEditingController(
                            text:
                                '${_selectedCountry.flagEmoji} +${_selectedCountry.phoneCode}',
                          ),
                          decoration: authDecoration(context)),
                    ),
                    const Gap(10),
                    Expanded(
                      flex: 3,
                      child: AuthFormField(
                        controller: _phoneNumberController,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.done,
                        onChanged: (p0) =>
                            setState(() => _phoneNumberController.text = p0),
                        decoration: authDecoration(context,
                            hintText: 'Phone number',
                            labelText: 'Phone number',
                            errorText: _errorMessage,
                            prefixIcon: const Icon(Icons.phone),
                            suffixIcon: Icon(
                              _phoneNumberController.length < 9
                                  ? null
                                  : Icons.check_circle,
                              size: 30,
                              color: context.colorScheme.primary,
                            )),
                        rules: [
                          RequiredRule(),
                          MinLengthRule(9),
                          MaxLengthRule(11),
                          RegexRule(r'^\d+$'),
                        ],
                      ),
                    ),
                  ],
                ),
                LoadingButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final fullPhoneNumber =
                          '+${_selectedCountry.phoneCode}${_phoneNumberController.text}';
                      // ignore: unused_result
                      await auth.sendOtp(fullPhoneNumber);
                      loginState.when(
                          data: (data) => {
                                _errorMessage = null,
                                context.pushNamed(Routes.otp,
                                    extra:
                                        '+${_selectedCountry.phoneCode}${_phoneNumberController.text}'),
                              },
                          loading: () => null,
                          error: (error, stackTrace) {
                            var e = error as AuthApiException;
                            setState(() => _errorMessage = e.message);
                          });
                    }
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
