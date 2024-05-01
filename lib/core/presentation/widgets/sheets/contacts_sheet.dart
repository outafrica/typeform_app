// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_size_text/auto_size_text.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

// Project imports:
import 'package:typeform_app/core/platform/platform.dart';
import 'package:typeform_app/core/presentation/pages/tap_outside_unfocus.dart';
import 'package:typeform_app/core/presentation/widgets/app_circular_image.dart';
import 'package:typeform_app/core/presentation/widgets/inputs/app_textfields.dart';

class ContactsSheet extends StatefulWidget {
  final ValueChanged<DeviceContactModel> onContactSelected;

  const ContactsSheet({
    super.key,
    required this.onContactSelected,
  });

  @override
  State<ContactsSheet> createState() => _ContactsSheetState();
}

class _ContactsSheetState extends State<ContactsSheet> {
  bool isLoading = true;

  List<DeviceContactModel> contacts = [];

  TextEditingController searchController = TextEditingController();
  FocusNode searchFocus = FocusNode();

  ValueNotifier<List<DeviceContactModel>> filtered =
      ValueNotifier<List<DeviceContactModel>>([]);

  @override
  void initState() {
    super.initState();

    getContacts();
  }

  getContacts() async {
    final deviceContacts = await ContactsManager.getDeviceContacts();

    setState(() {
      contacts = deviceContacts;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _sc = SizeConfig(context: context);

    Widget spacer() => SizedBox(height: _sc.heightScaledSize(15));

    return SafeArea(
      minimum: EdgeInsets.only(bottom: 3.5.h),
      child: TapOutSideUnfocus(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  height: 3,
                  width: 15.w,
                  decoration: BoxDecoration(
                    color: AppColors.grey3,
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                ),
              ),
              spacer(),
              IconButton(
                onPressed: () {
                  context.pop();
                },
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.close,
                  color: Colors.black,
                  size: _sc.size35HeightScaled,
                ),
              ),
              spacer(),
              AutoSizeText(
                'Your Contact List',
                style: AppStyles.textStyleTitle().copyWith(
                  color: Colors.black,
                  fontSize: 13.sp,
                ),
              ),
              spacer(),
              Expanded(
                child: isLoading
                    ? Center(
                        child: CupertinoActivityIndicator(
                          color: AppColors.orange,
                          radius: 12.sp,
                        ),
                      )
                    : ValueListenableBuilder<List<DeviceContactModel>>(
                        valueListenable: filtered,
                        builder: (context, List<DeviceContactModel> result, _) {
                          final showSearched = searchController.text.length > 1;

                          return Column(
                            children: [
                              AppTextFields(
                                hintText: 'Search Contact',
                                fillColor: Colors.white,
                                focusNode: searchFocus,
                                controller: searchController,
                                textFieldStyle: _sc.body1Theme.copyWith(
                                  color: Colors.black,
                                  fontSize: 11.sp,
                                ),
                                onChanged: (text) {
                                  if (text.isNotEmpty) {
                                    filtered.value = [];

                                    contacts.forEach(
                                      (item) {
                                        if (item.displayName!
                                            .toLowerCase()
                                            .contains(
                                              text.toLowerCase(),
                                            )) {
                                          filtered.value.add(item);
                                        }
                                      },
                                    );
                                  } else {
                                    filtered.value = [];
                                  }
                                },
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                enabledborder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                // textAlignVertical: TextAlignVertical.top,
                                prefix: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 1.5.w),
                                  child: Icon(
                                    Icons.search,
                                    color: Colors.black,
                                    size: _sc.size20HeightScaled,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: showSearched && result.isEmpty
                                    ? Center(
                                        child: AutoSizeText(
                                          'No results found',
                                          style: AppStyles.textStyleTitle()
                                              .copyWith(
                                            color: Colors.black,
                                            fontSize: 13.sp,
                                          ),
                                        ),
                                      )
                                    : (!showSearched && contacts.isEmpty)
                                        ? Center(
                                            child: AutoSizeText(
                                              'No contacts found',
                                              style: AppStyles.textStyleTitle()
                                                  .copyWith(
                                                color: Colors.black,
                                                fontSize: 13.sp,
                                              ),
                                            ),
                                          )
                                        : ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: showSearched
                                                ? result.length
                                                : contacts.length,
                                            itemBuilder: (context, index) {
                                              final item = showSearched
                                                  ? result[index]
                                                  : contacts[index];

                                              return ListTile(
                                                onTap: () {
                                                  widget
                                                      .onContactSelected(item);
                                                  context.pop();
                                                },
                                                contentPadding: EdgeInsets.zero,
                                                minVerticalPadding: 0,
                                                // horizontalTitleGap: 0,
                                                leading: AppCircularImage(
                                                  imageUrl: null,
                                                  imageType:
                                                      ImageType.networkImage,
                                                  borderWidth: 0,
                                                  radius: 20,
                                                  fallbackWidget: Text(
                                                    "${item.displayName?[0]}",
                                                    style: AppStyles
                                                            .textStyleTitle()
                                                        .copyWith(
                                                      fontSize: 11.sp,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                title: AutoSizeText(
                                                  "${item.displayName?.toLowerCase().capitalize()}",
                                                  style:
                                                      AppStyles.textStyleTitle()
                                                          .copyWith(
                                                    fontSize: 11.sp,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                subtitle: AutoSizeText(
                                                  "${item.phone}",
                                                  style:
                                                      AppStyles.textStyleBody(
                                                              context)
                                                          .copyWith(
                                                    fontSize: 10.sp,
                                                    color: Colors.black54,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                              ),
                            ],
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
