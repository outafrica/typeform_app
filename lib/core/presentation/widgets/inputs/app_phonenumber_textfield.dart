// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:flutter_sim_country_code/flutter_sim_country_code.dart';
import 'package:sizer/sizer.dart';

// Project imports:
import 'package:typeform_app/core/platform/platform.dart';
import 'package:typeform_app/core/presentation/pages/app_sheets.dart';
import 'package:typeform_app/core/presentation/widgets/sheets/contacts_sheet.dart';
import 'app_textfields.dart';

class AppPhoneNumberTextField extends StatefulWidget {
  final TextEditingController numberController;
  final ValueChanged<Country> onCountrySelected;

  final ValueChanged<String>? onChanged;
  final bool isContactEntry;
  final bool isEnabled;
  final bool canChangeCountry;
  final Country? selectedCountry;
  final FormFieldValidator<String>? validator;

  final ValueChanged<String>? onContactSelected;
  final Function(bool hasFocus)? onFocusChanged;
  final TextStyle? textStyle;
  final TextStyle? hintTextStyle;
  final TextStyle? titleStyle;

  final bool? hasTitle;
  final String? title;
  final Widget? titleIcon;

  final Decoration? decoration;

  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledborder;

  final EdgeInsetsGeometry? padding;
  final Color? iconColor;
  final Color? fillColor;

  const AppPhoneNumberTextField({
    Key? key,
    required this.numberController,
    required this.onCountrySelected,
    this.onChanged,
    this.isContactEntry = false,
    this.isEnabled = true,
    this.canChangeCountry = true,
    this.validator,
    this.selectedCountry,
    this.onContactSelected,
    this.onFocusChanged,
    this.textStyle,
    this.hintTextStyle,
    this.border,
    this.focusedBorder,
    this.enabledborder,
    this.padding = EdgeInsets.zero,
    this.decoration = const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(7)),
    ),
    this.titleStyle,
    this.hasTitle,
    this.title,
    this.titleIcon,
    this.iconColor,
    this.fillColor,
  }) : super(key: key);

  @override
  State<AppPhoneNumberTextField> createState() =>
      _AppPhoneNumberTextFieldState();
}

class _AppPhoneNumberTextFieldState extends State<AppPhoneNumberTextField> {
  Country? _selectedCountry;

  final _focusNode = FocusNode();

  String flagPath = '';

  final availableCountries = ['kenya'];

  @override
  void initState() {
    _selectedCountry = CountryPickerUtils.getCountryByIsoCode('KE');

    if (widget.selectedCountry?.name != null) {
      _selectedCountry = widget.selectedCountry;
    } else {
      FlutterSimCountryCode.simCountryCode.then(
        (String? code) {
          _selectedCountry = CountryPickerUtils.getCountryByIsoCode(code!);

          logger.i(code);

          flagPath = CountryPickerUtils.getFlagImageAssetPath(code);

          widget.onCountrySelected(_selectedCountry!);
        },
      ).catchError((e) {
        logger.e(e);
        _selectedCountry = CountryPickerUtils.getCountryByIsoCode('KE');
        widget.onCountrySelected(_selectedCountry!);
      });
    }

    _focusNode.addListener(() {
      widget.onFocusChanged?.call(_focusNode.hasFocus);
    });

    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  Widget _buildCountryDialogItem(Country country, SizeConfig sc) => Padding(
        padding: EdgeInsets.all(sc.heightScaledSize(8)!),
        child: Row(
          children: <Widget>[
            CountryPickerUtils.getDefaultFlagImage(country),
            SizedBox(width: sc.heightScaledSize(16)),
            Flexible(
              child: Text(country.name, style: sc.body1Theme),
            )
          ],
        ),
      );

  void _openCountryPickerDialog(SizeConfig sc) => showDialog(
        context: context,
        builder: (context) => CountryPickerDialog(
          titlePadding: EdgeInsets.all(sc.heightScaledSize(8)!),
          searchInputDecoration: const InputDecoration(hintText: ' Search...'),
          isSearchable: true,
          title: Text(
            'Select your country',
            style: sc.h4Theme,
          ),
          itemFilter: (country) =>
              availableCountries.contains(country.name.toLowerCase()),
          onValuePicked: (Country country) {
            widget.onCountrySelected(country);
            flagPath =
                CountryPickerUtils.getFlagImageAssetPath(country.isoCode);
            setState(() => _selectedCountry = country);
          },
          itemBuilder: (item) => _buildCountryDialogItem(item, sc),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final _sc = SizeConfig(context: context);

    return Container(
      decoration: widget.decoration,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: _sc.heightScaledSize(60),
            decoration: BoxDecoration(
              color: widget.fillColor ?? AppColors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 1,
                color: AppColors.primaryBlue,
              ),
            ),
            child: GestureDetector(
              onTap: widget.canChangeCountry
                  ? () => _openCountryPickerDialog(_sc)
                  : null,
              child: SizedBox(
                child: Row(
                  children: [
                    SizedBox(width: _sc.heightScaledSize(8)),
                    Container(
                      width: _sc.heightScaledSize(30),
                      height: _sc.heightScaledSize(20),
                      child: CountryPickerUtils.getDefaultFlagImage(
                        _selectedCountry!,
                      ),
                    ),
                    // SizedBox(width: _sc.heightScaledSize(8)),
                    Container(
                      height: _sc.heightScaledSize(40),
                      width: 1,
                      margin: EdgeInsets.symmetric(horizontal: 2.0.w),
                      color: AppColors.primaryBlue,
                    ),
                    Text(
                      '+${_selectedCountry?.phoneCode}',
                      style: widget.textStyle ??
                          _sc.body1Theme.copyWith(
                            color: widget.iconColor ?? AppColors.primaryBlue,
                            fontSize: 10.0.sp,
                          ),
                    ),
                    SizedBox(width: _sc.heightScaledSize(8)),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: _sc.heightScaledSize(60),
              padding: EdgeInsets.only(left: _sc.heightScaledSize(8)!),
              child: Center(
                child: AppTextFields(
                  keyboard: TextInputType.number,
                  controller: widget.numberController,
                  onChanged: widget.onChanged,
                  enabled: widget.isEnabled,
                  focusNode: _focusNode,
                  multiline: false,
                  textFieldStyle: widget.textStyle,
                  hintTextStyle: widget.hintTextStyle,
                  focusedBorder: widget.focusedBorder,
                  border: widget.enabledborder,
                  enabledborder: widget.enabledborder,
                  hintText: "Phone number",
                  isHint: true,
                  fillColor: widget.fillColor,
                  // padding: widget.padding,
                  validator: widget.validator,
                  inputFormatters: [
                    LibPhonenumberTextFormatter(
                      country: CountryManager().countries.firstWhere(
                            (e) => e.phoneCode == _selectedCountry?.phoneCode,
                            orElse: () => const CountryWithPhoneCode.us(),
                          ),
                      additionalDigits:
                          _selectedCountry!.name.toLowerCase() == 'china'
                              ? 1
                              : 0,
                      onFormatFinished: (val) {
                        logger.i(val);
                      },
                      shouldKeepCursorAtEndOfInput: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (widget.isContactEntry)
            InkWell(
              onTap: () async {
                final hasPermission =
                    await checkUsersContactsPermissionStatus(context);

                if (hasPermission) {
                  // ignore: unawaited_futures, use_build_context_synchronously
                  AppSheets.showAppHeightEightSheet(
                    context: context,
                    builder: (_) => ContactsSheet(
                      onContactSelected: (DeviceContactModel contact) async {},
                    ),
                  );
                }
              },
              child: Container(
                height: _sc.heightScaledSize(52),
                margin: EdgeInsets.only(left: 3.w),
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                decoration: BoxDecoration(
                  color: widget.fillColor ?? AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    width: 1,
                    color: AppColors.primaryBlue,
                  ),
                ),
                child: Icon(
                  Icons.contacts,
                  color: widget.iconColor ?? AppColors.primaryBlue,
                  size: _sc.heightScaledSize(20),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
