// Flutter imports:
import 'package:country_pickers/country.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:typeform_app/core/platform/platform.dart';
import 'package:typeform_app/core/presentation/pages/page_margin.dart';
import 'package:typeform_app/core/presentation/widgets/buttons/buttons.dart';
import 'package:typeform_app/core/presentation/widgets/inputs/app_drop_down_with_border.dart';
import 'package:typeform_app/core/presentation/widgets/inputs/app_phonenumber_textfield.dart';
import 'package:typeform_app/core/presentation/widgets/inputs/app_textfields.dart';
import 'package:typeform_app/features/authentication/data/models/authentication_models.dart';
import 'package:typeform_app/features/authentication/domain/params/authentication_params.dart';
import 'package:typeform_app/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:typeform_app/features/authentication/presentation/widgets/accept_terms.dart';
import 'package:sizer/sizer.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late TextEditingController userNameController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  bool hidePassword = true;
  bool acceptedTerms = false;
  late String countryCode;
  late String phoneCode;
  int selectedGenderIndex = 0;
  int selectedGenderId = 0;
  int selectedRoleId = 0;
  List<RoleModel> roles = [];
  List<GenderModel> genders = [
    const GenderModel(id: 0, name: 'Select gender'),
  ];
  String? deviceId;

  @override
  void initState() {
    super.initState();
    context.read<AuthenticationCubit>().getRoles();
    context.read<AuthenticationCubit>().getGenders();
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
  }

  beginKycVerification(String url) => context.push('/webview', extra: {
        'url': url,
        'title': 'Complete Verification',
      });

  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) => _bodyWidget(context);

  Widget _bodyWidget(BuildContext context) =>
      BlocConsumer<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            gettingGenders: (payload) {},
            gettingRoles: (payload) {},
            gotGenders: (payload) => {
              setState(() {
                genders = payload.genders;
              }),
            },
            gotRoles: (payload) {
              var selectedRole = payload.roles.where(
                (element) => element.name == 'User',
              );

              setState(() {
                roles = payload.roles;
                selectedRoleId = selectedRole.first.id;
              });
            },
            gendersError: (payload) => {},
            rolesError: (payload) => {},
            signUpError: (payload) {
              EasyLoading.dismiss();
              return EasyLoading.showError(
                payload.error,
                dismissOnTap: true,
              );
            },
            signingUp: (payload) {
              EasyLoading.show(status: 'Signing Up');
            },
            loggedIn: (payload) {
              EasyLoading.dismiss();
              context.go('/home');
            },
            kycRequired: (payload) {
              EasyLoading.dismiss();
              context.go('/home');
              beginKycVerification(payload.user!.kycVerificationLink);
            },
          );
        },
        builder: (context, state) => PageMargin(
          backgroundColor: AppColors.white,
          padding: EdgeInsets.symmetric(
            horizontal: 3.0.h,
            vertical: 10.0.w,
          ),
          child: ListView(
            children: [
              _imageWidget(context),
              _titleWidget(context),
              _inputWidget(context),
              _signUpButtonAndWithBiometricsWidget(context),
              _signInWidget(context),
            ],
          ),
        ),
      );

  Widget _imageWidget(BuildContext context) => Center(
        child: Image.asset(
          AppImages.logo,
          height: 60.sp,
          width: 284.sp,
        ),
      );

  Widget _titleWidget(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(
          vertical: 5.0.w,
        ),
        child: Center(
          child: Text(
            'Create Your Profile',
            style: AppStyles.textStyleTitle().copyWith(
              color: AppColors.primaryBlue,
            ),
          ),
        ),
      );

  Widget _inputWidget(BuildContext context) {
    final _sc = SizeConfig(context: context);
    Widget spacer() => SizedBox(height: _sc.heightScaledSize(15));
    final bool keyBoardOpen = MediaQuery.of(context).viewInsets.bottom > 70;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: AppTextFields(
                  controller: firstNameController,
                  hintText: 'First Name',
                  validator: (String? v) {
                    if (v == null || v == '') {
                      return 'First Name is required';
                    }

                    return null;
                  },
                ),
              ),
              SizedBox(
                width: 3.0.w,
              ),
              Flexible(
                child: AppTextFields(
                  controller: lastNameController,
                  hintText: 'Last Name',
                  validator: (String? v) {
                    if (v == null || v == '') {
                      return 'Last Name is required';
                    }

                    return null;
                  },
                ),
              ),
            ],
          ),
          spacer(),
          AppTextFields(
            controller: emailController,
            hintText: 'Your Email Address',
            validator: (String? v) {
              if (v == null || v == '') {
                return 'Email is required';
              }

              if (!v.trim().isValidEmail()) {
                return 'Email must be valid';
              }

              return null;
            },
          ),
          spacer(),
          AppTextFields(
            controller: userNameController,
            hintText: 'Username',
            validator: (String? v) {
              if (v == null || v == '') {
                return 'Username is required';
              }
              return null;
            },
          ),
          spacer(),
          AppPhoneNumberTextField(
            numberController: phoneController,
            validator: (v) {
              if (v == null || v == '') {
                return 'PhoneNumber is required';
              }
              return null;
            },
            canChangeCountry: true,
            isContactEntry: false,
            onCountrySelected: (Country value) {
              setState(() {
                countryCode = value.iso3Code;
                phoneCode = '+' + value.phoneCode;
              });
            },
          ),
          spacer(),
          AppDropDownWithBorders(
            hasBorders: true,
            hasBottomBorder: true,
            hasTopBorder: true,
            color: AppColors.white,
            maxWidth: false,
            enableWidth: true,
            initialSelectedIndex: selectedGenderIndex,
            menuItems: genders
                .map(
                  (e) => Text(
                    e.name,
                    style: AppStyles.textStyleBody(context).copyWith(
                      color: AppColors.deepBlue,
                      fontWeight: FontWeight.w500,
                      fontSize: 10.0.sp,
                    ),
                  ),
                )
                .toList(),
            onItemSelected: (index) {
              setState(() {
                selectedGenderId = genders[index].id;
              });
            },
          ),
          spacer(),
          AppTextFields(
            controller: passwordController,
            hintText: 'Password',
            isObscure: hidePassword,
            suffix: InkWell(
              onTap: () {
                setState(() {
                  hidePassword = !hidePassword;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(right: 1.5.w),
                child: Icon(
                  hidePassword ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.silver,
                  size: _sc.size25HeightScaled,
                ),
              ),
            ),
            validator: (String? v) {
              if (v == null || v == '') {
                return 'Password is required';
              }

              return null;
            },
          ),
          spacer(),
          AppTextFields(
            controller: confirmPasswordController,
            hintText: 'Confirm Password',
            isObscure: hidePassword,
            suffix: InkWell(
              onTap: () {
                setState(() {
                  hidePassword = !hidePassword;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(right: 1.5.w),
                child: Icon(
                  hidePassword ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.silver,
                  size: _sc.size25HeightScaled,
                ),
              ),
            ),
            validator: (String? v) {
              if (v == null || v == '') {
                return 'Password confirmation is required';
              }

              return null;
            },
          ),
          spacer(),
          if (!keyBoardOpen)
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 2.0.w,
              ),
              child: AcceptTermsWidget(
                onChanged: (bool c) => setState(
                  () {
                    acceptedTerms = c;
                  },
                ),
              ),
            ),
          spacer(),
        ],
      ),
    );
  }

  Widget _signInWidget(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              child: RichText(
                text: TextSpan(
                  text: 'Already have an account? ',
                  style: AppStyles.textStyleBody(context).copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryBlue,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => context.go('/login'),
                      text: 'Sign In',
                      style: AppStyles.textStyleBody(context).copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryRed,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );

  Widget _signUpButtonAndWithBiometricsWidget(BuildContext context) => Padding(
        padding: EdgeInsets.only(
          top: 1.0.h,
          bottom: 1.0.h,
        ),
        child: AppButton(
          onTap: () async {
            deviceId = await getDeviceInfo();
            final phoneNumber = phoneCode +
                phoneController.text.trim().replaceAll(RegExp('-'), '');
            FocusManager.instance.primaryFocus?.unfocus();
            if (_formKey.currentState!.validate()) {
              if (!acceptedTerms) {
                await EasyLoading.showInfo(
                    'Please Accept our Privacy Policy and Terms & Conditions');

                return;
              }
              if (confirmPasswordController.text.trim() !=
                  passwordController.text.trim()) {
                await EasyLoading.showInfo('Passwords do not match!');
                return;
              }
              await context.read<AuthenticationCubit>().signup(
                      params: SignupParams(
                    userName: userNameController.text.trim(),
                    firstName: firstNameController.text.trim(),
                    lastName: lastNameController.text.trim(),
                    phone: phoneNumber,
                    email: emailController.text.trim(),
                    roleId: selectedRoleId,
                    genderId: selectedGenderId,
                    password: passwordController.text.trim(),
                    passwordConfirm: confirmPasswordController.text.trim(),
                    countryCode: countryCode,
                    deviceId: deviceId,
                  ));
            }
          },
          label: 'Sign Up',
          color: AppColors.primaryRed,
          fontColor: Colors.black,
          width: double.infinity,
          fontWeight: FontWeight.w500,
        ),
      );
}
