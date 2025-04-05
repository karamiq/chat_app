import 'package:app/core/constants/assets.dart';
import 'package:app/core/settings/settings.dart';
import 'package:app/core/utils/custom_text_feileds.dart/auth_text_form_feild.dart';
import 'package:app/core/utils/decoration/auth_decoration.dart';
import 'package:app/core/utils/extentions.dart';
import 'package:app/core/utils/widgets/buttons/loading_button.dart';
import 'package:app/data/providers/login_provider.dart';
import 'package:app/pages/auth/components/auth_page_head.dart';
import 'package:app/routes/app_router.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
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
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            PageHead(),
            Padding(
              padding: Insets.mediumAll,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
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
                              labelText: 'Phone number',
                              errorText: _errorMessage,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SvgPicture.asset(
                                  Assets.assetsSvgPhone,
                                  height: 10,
                                ),
                              ),
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
                  const Gap(10),
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
                  const Gap(30),
                  CreateAccount(),
                  IconButton(
                      color: context.colorScheme.primary,
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: context.colorScheme.primary,
                        ),
                      ),
                      onPressed: () {
                        ref
                            .read(applicationSettingsProvider.notifier)
                            .toggleTheme(context);
                      },
                      icon: context.isDarkMode
                          ? const Icon(Icons.light_mode)
                          : const Icon(Icons.dark_mode)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: 'First time here? ',
          style: Theme.of(context).textTheme.bodyMedium,
          children: [
            TextSpan(
              text: 'Create an account',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.pushNamed(Routes.userInfo);
                },
            ),
          ],
        ),
      ),
    );
  }
}
