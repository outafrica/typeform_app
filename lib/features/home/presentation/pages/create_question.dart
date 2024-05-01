// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:typeform_app/core/platform/platform.dart';
import 'package:typeform_app/core/presentation/pages/page_margin.dart';
import 'package:sizer/sizer.dart';
import 'package:typeform_app/core/presentation/widgets/buttons/buttons.dart';
import 'package:typeform_app/core/presentation/widgets/inputs/app_drop_down_with_border.dart';
import 'package:typeform_app/core/presentation/widgets/inputs/app_textfields.dart';
import 'package:typeform_app/features/home/data/models/home_models.dart';
import 'package:typeform_app/features/home/domain/params/add_question_param.dart';
import 'package:typeform_app/features/home/presentation/cubit/home_cubit.dart';

class CreateQuestion extends StatefulWidget {
  final List<FormModel> forms;
  final List<CategoryModel> categories;
  const CreateQuestion({
    super.key,
    required this.forms,
    required this.categories,
  });

  @override
  State<CreateQuestion> createState() => _CreateQuestionState();
}

class _CreateQuestionState extends State<CreateQuestion> {
  late bool isLoading;
  int selectedIndex = 0;
  late List<FormModel> forms;
  late List<CategoryModel> categories;
  late List<OptionTypeModel> optionTypes;
  late int formId;
  late String userId;
  late int categoryId;
  TextEditingController questionController = TextEditingController();
  late int optionTypeId;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    forms = widget.forms;
    optionTypes = [];
    categories = widget.categories;
    context.read<HomeCubit>().getOptionTypes();
  }

  @override
  void dispose() {
    super.dispose();
    questionController.dispose();
  }

  @override
  Widget build(BuildContext context) => _bodyWidget(context);

  Widget _bodyWidget(BuildContext context) {
    final sc = SizeConfig(context: context);

    Widget spacer() => SizedBox(height: sc.heightScaledSize(15));

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          addingQuestion: (payload) {
            EasyLoading.showInfo('Adding Question...', dismissOnTap: true);
          },
          addedQuestion: (payload) {
            EasyLoading.showSuccess('Question Added!', dismissOnTap: true).then(
              (value) => {
                context.read<HomeCubit>().getForms(isAllForms: true),
                context.go('/login'),
              },
            );
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
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            IconButton(
              onPressed: () {
                context.pop();
              },
              alignment: Alignment.topLeft,
              padding: EdgeInsets.zero,
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.primaryBlue,
                size: sc.size35HeightScaled,
              ),
            ),
            _titleWidget(context),
            spacer(),
            _formWidget(context),
            spacer(),
            AppButton(
              onTap: () {
                context.read<HomeCubit>().createQuestion(
                      params: AddQuestionParams(
                        userId: '9a70376e-a525-42e9-90d7-319428afd3ed',
                        formId: formId,
                        questionCategoryId: categoryId,
                        question: questionController.text,
                        questionOptionTypeId: optionTypeId,
                      ),
                    );
              },
              label: 'Submit',
              color: AppColors.primaryRed,
              fontColor: Colors.black,
              width: double.infinity,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }

  Widget _titleWidget(BuildContext context) => Center(
        child: Text(
          'Add Question',
          style: AppStyles.textStyleTitle().copyWith(
            color: AppColors.primaryBlue,
          ),
        ),
      );

  Widget _formWidget(BuildContext context) {
    final sc = SizeConfig(context: context);
    Widget spacer() => SizedBox(height: sc.heightScaledSize(15));

    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loadingOptionTypes: (payload) {},
          loadedOptionTypes: (payload) {
            setState(() {
              isLoading = false;
              optionTypes = payload.optionTypes;
            });
          },
        );
      },
      child: isLoading
          ? Center(
              child: CupertinoActivityIndicator(
                color: AppColors.orange,
                radius: 12.sp,
              ),
            )
          : ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                spacer(),
                ListTile(
                  minVerticalPadding: 0.0.h,
                  minLeadingWidth: 0.0.w,
                  title: Padding(
                    padding: EdgeInsets.only(
                      bottom: 1.0.h,
                    ),
                    child: Text(
                      'Select the form to which this question is to be added',
                      style: AppStyles.textStyleTitle().copyWith(
                        color: AppColors.deepBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: 9.0.sp,
                      ),
                    ),
                  ),
                  subtitle: AppDropDownWithBorders(
                    enabled: true,
                    hasBorders: true,
                    hasBottomBorder: true,
                    hasTopBorder: true,
                    color: AppColors.white,
                    maxWidth: false,
                    enableWidth: true,
                    initialSelectedIndex: selectedIndex,
                    menuItems: forms
                        .map(
                          (e) => Text(
                            e.title,
                            style: AppStyles.textStyleBody(context).copyWith(
                              color: AppColors.deepBlue,
                              fontWeight: FontWeight.w500,
                              fontSize: 8.0.sp,
                            ),
                          ),
                        )
                        .toList(),
                    onItemSelected: (index) {
                      setState(() {
                        formId = forms[index].id;
                      });
                    },
                  ),
                ),
                spacer(),
                ListTile(
                  minVerticalPadding: 0.0.h,
                  minLeadingWidth: 0.0.w,
                  title: Padding(
                    padding: EdgeInsets.only(
                      bottom: 1.0.h,
                    ),
                    child: Text(
                      'Select the category that this question belongs to',
                      style: AppStyles.textStyleTitle().copyWith(
                        color: AppColors.deepBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: 9.0.sp,
                      ),
                    ),
                  ),
                  subtitle: AppDropDownWithBorders(
                    enabled: true,
                    hasBorders: true,
                    hasBottomBorder: true,
                    hasTopBorder: true,
                    color: AppColors.white,
                    maxWidth: false,
                    enableWidth: true,
                    initialSelectedIndex: selectedIndex,
                    menuItems: categories
                        .map(
                          (e) => Text(
                            e.name,
                            style: AppStyles.textStyleBody(context).copyWith(
                              color: AppColors.deepBlue,
                              fontWeight: FontWeight.w500,
                              fontSize: 8.0.sp,
                            ),
                          ),
                        )
                        .toList(),
                    onItemSelected: (index) {
                      setState(() {
                        categoryId = categories[index].id;
                      });
                    },
                  ),
                ),
                spacer(),
                ListTile(
                  minVerticalPadding: 0.0.h,
                  minLeadingWidth: 0.0.w,
                  title: Padding(
                    padding: EdgeInsets.only(
                      bottom: 1.0.h,
                    ),
                    child: Text(
                      'Select the answer type accepted for this question',
                      style: AppStyles.textStyleTitle().copyWith(
                        color: AppColors.deepBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: 9.0.sp,
                      ),
                    ),
                  ),
                  subtitle: AppDropDownWithBorders(
                    enabled: true,
                    hasBorders: true,
                    hasBottomBorder: true,
                    hasTopBorder: true,
                    color: AppColors.white,
                    maxWidth: false,
                    enableWidth: true,
                    initialSelectedIndex: selectedIndex,
                    menuItems: optionTypes
                        .map(
                          (e) => Text(
                            e.optionType.name,
                            style: AppStyles.textStyleBody(context).copyWith(
                              color: AppColors.deepBlue,
                              fontWeight: FontWeight.w500,
                              fontSize: 8.0.sp,
                            ),
                          ),
                        )
                        .toList(),
                    onItemSelected: (index) {
                      setState(() {
                        optionTypeId = optionTypes[index].id;
                      });
                    },
                  ),
                ),
                spacer(),
                ListTile(
                  minVerticalPadding: 0.0.h,
                  minLeadingWidth: 0.0.w,
                  title: Padding(
                    padding: EdgeInsets.only(
                      bottom: 1.0.h,
                    ),
                    child: Text(
                      'Enter the question to be asked',
                      style: AppStyles.textStyleTitle().copyWith(
                        color: AppColors.deepBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: 9.0.sp,
                      ),
                    ),
                  ),
                  subtitle: AppTextFields(
                    hintText: 'Question',
                    keyboard: TextInputType.text,
                    controller: questionController,
                    minLines: 4,
                    maxLines: 7,
                  ),
                ),
              ],
            ),
    );
  }
}
