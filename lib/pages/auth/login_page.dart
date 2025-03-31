import 'package:app/core/utils/custom_text_feileds.dart/auth_text_form_feild.dart';
import 'package:app/core/utils/decoration/auth_decoration.dart';
import 'package:app/services/location/location.dart';
import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:app/core/constants/assets.dart';
import 'package:app/core/constants/sizes.dart';
import 'package:app/core/utils/validators/validators.dart';

// class PhoneAuthState {
//   final bool isLoading;
//   final String? errorMessage;
//   final bool isSuccess;

//   PhoneAuthState({
//     this.isLoading = false,
//     this.errorMessage,
//     this.isSuccess = false,
//   });
// }

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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

  // _authState = PhoneAuthState();

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  void _logIn() async {
    if (!_formKey.currentState!.validate()) return;

    final phoneNumber = _phoneNumberController.text.trim();
    final completePhoneNumber = '+${_selectedCountry.phoneCode}$phoneNumber';

    setState(() {
      // _authState = PhoneAuthState(isLoading: true);
    });

    try {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Login successful!')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: ${e.toString()}')));
      }
    }
  }

  void _pickCountry() {
    showCountryPicker(
      context: context,
      countryListTheme: CountryListThemeData(
        flagSize: 25,
        backgroundColor: Theme.of(context).colorScheme.surface,
        textStyle: const TextStyle(fontSize: 16),
        bottomSheetHeight: 500,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        inputDecoration: InputDecoration(
          hintText: 'Search country',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Theme.of(context).dividerColor),
          ),
        ),
      ),
      onSelect: (Country country) {
        setState(() {
          _selectedCountry = country;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // final loginState = ref.watch(loginNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: Insets.mediumAll,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Gap(40),
                SizedBox(
                  height: 180,
                  width: 180,
                  child: Lottie.asset(
                    Assets.assetsLottieLoginLogo,
                    fit: BoxFit.contain,
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
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const Gap(32),

                // Country selector
                GestureDetector(
                  onTap: _pickCountry,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(
                          context,
                        ).colorScheme.outline.withOpacity(0.5),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              _selectedCountry.flagEmoji,
                              style: const TextStyle(fontSize: 22),
                            ),
                            const Gap(8),
                            Text(
                              '+${_selectedCountry.phoneCode}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ),

                const Gap(16),

                // Phone number input
                AuthFormField(
                  controller: _phoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: authDecoration(
                    context,
                    hintText: 'Phone number',
                    labelText: 'Phone number',
                    prefixIcon: const Icon(Icons.phone),
                  ),
                  rules: [
                    RequiredRule(),
                    MinLengthRule(9),
                    MaxLengthRule(12),
                    RegexRule(r'^\d+$'),
                  ],
                ),

                const Gap(24),
                // ElevatedButton(
                //   onPressed:
                //       loginState is AsyncLoading
                //           ? null
                //           : () {
                //             // Trigger your login action here.
                //           },
                //   child:
                //       loginState is AsyncLoading
                //           ? const SizedBox(
                //             width: 20,
                //             height: 20,
                //             child: CircularProgressIndicator(
                //               strokeWidth: 2,
                //               color: Colors.white,
                //             ),
                //           )
                //           : const Text('Login'),
                // ),

                // Login button
                // SizedBox(
                //   width: double.infinity,
                //   height: 50,
                //   child: ElevatedButton(
                //     onPressed: _authState.isLoading ? null : _logIn,
                //     style: ElevatedButton.styleFrom(
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(12),
                //       ),
                //       elevation: 2,
                //     ),
                //     child:
                //         _authState.isLoading
                //             ? const SizedBox(
                //               width: 24,
                //               height: 24,
                //               child: CircularProgressIndicator(
                //                 strokeWidth: 2,
                //                 color: Colors.white,
                //               ),
                //             )
                //             : const Text(
                //               'Login',
                //               style: TextStyle(
                //                 fontSize: 16,
                //                 fontWeight: FontWeight.w600,
                //               ),
                //             ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
