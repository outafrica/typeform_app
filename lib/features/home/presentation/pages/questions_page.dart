// Flutter imports:
// ignore_for_file: avoid_void_async

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:im_stepper/stepper.dart';
import 'package:typeform_app/core/presentation/pages/page_margin.dart';
import 'package:sizer/sizer.dart';

// Project imports:
import 'package:typeform_app/core/platform/platform.dart';
import 'package:typeform_app/core/presentation/widgets/inputs/app_textfields.dart';
import 'package:typeform_app/features/home/data/models/home_models.dart';
import 'package:typeform_app/features/home/presentation/cubit/home_cubit.dart';

class QuestionsPage extends StatefulWidget {
  final FormModel form;
  final List<CategoryModel> categories;
  const QuestionsPage({
    Key? key,
    required this.form,
    required this.categories,
  }) : super(key: key);

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  int activeStepIndex = 0;
  int upperBound = 0;
  late FormModel form;
  late List<CategoryModel> categories;
  late List<String> indexList;
  Map<String, GlobalKey<FormState>?> formKeys = {};
  Map<String, dynamic> answers = {}; // To store answers

  @override
  void initState() {
    super.initState();
    form = widget.form;
    categories = [];
    indexList = [];
    // create unique formKeys for each category
    for (var question in form.questions) {
      for (var category in widget.categories) {
        if (category.name == question.questionCategory &&
            !categories.contains(category)) {
          categories.add(category);
          indexList.add(category.name);
        }
      }
      formKeys.putIfAbsent(
          question.questionCategory, () => GlobalKey<FormState>());
    }
    upperBound = categories.length;
  }

  Widget loadStepForm() {
    return Visibility(
        visible: indexList[activeStepIndex].toLowerCase() ==
            categories[activeStepIndex].name.toLowerCase(),
        child: Form(
          key: formKeys[categories[activeStepIndex].name],
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              ...List.generate(form.questions.length, (index) {
                if (form.questions[index].questionCategory.toLowerCase() ==
                        indexList[activeStepIndex].toLowerCase() &&
                    form.questions[index].optionType ==
                        OptionType.RadioButton) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: 1.0.h,
                    ),
                    child: Column(
                      children: [
                        Text(form.questions[index].question,
                            style: AppStyles.textStyleTitle().copyWith(
                              color: AppColors.deepBlue,
                              fontWeight: FontWeight.bold,
                              fontSize: 9.0.sp,
                            )),
                        for (var option in form.questions[index].options)
                          RadioListTile(
                            title: Text(
                              option.option,
                              style: AppStyles.textStyleBody(context).copyWith(
                                color: AppColors.deepBlue,
                                fontWeight: FontWeight.w500,
                                fontSize: 8.0.sp,
                              ),
                            ),
                            value: option,
                            groupValue: form.questions[index].options.first,
                            onChanged: (value) {
                              setState(() {});
                            },
                          ),
                      ],
                    ),
                  );
                } else if (form.questions[index].questionCategory
                            .toLowerCase() ==
                        indexList[activeStepIndex].toLowerCase() &&
                    form.questions[index].optionType == OptionType.Checkbox) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: 1.0.h,
                    ),
                    child: Column(
                      children: [
                        Text(form.questions[index].question,
                            style: AppStyles.textStyleTitle().copyWith(
                              color: AppColors.deepBlue,
                              fontWeight: FontWeight.bold,
                              fontSize: 9.0.sp,
                            )),
                        for (var option in form.questions[index].options)
                          CheckboxListTile(
                            title: Text(
                              option.option,
                              style: AppStyles.textStyleBody(context).copyWith(
                                color: AppColors.deepBlue,
                                fontWeight: FontWeight.w500,
                                fontSize: 8.0.sp,
                              ),
                            ),
                            value: false,
                            onChanged: (value) {
                              setState(() {});
                            },
                          ),
                      ],
                    ),
                  );
                } else if (form.questions[index].questionCategory
                        .toLowerCase() ==
                    indexList[activeStepIndex].toLowerCase()) {
                  return ListTile(
                    minVerticalPadding: 0.0.h,
                    minLeadingWidth: 0.0.w,
                    title: Padding(
                      padding: EdgeInsets.only(
                        bottom: 1.0.h,
                        top: 1.0.h,
                      ),
                      child: Text(
                        form.questions[index].question,
                        style: AppStyles.textStyleTitle().copyWith(
                          color: AppColors.deepBlue,
                          fontWeight: FontWeight.bold,
                          fontSize: 9.0.sp,
                        ),
                      ),
                    ),
                    subtitle: AppTextFields(
                      onChanged: (String value) {
                        setState(() {});
                      },
                      keyboard: TextInputType.text,
                      minLines: 3,
                    ),
                  );
                } else {
                  return Padding(
                    padding: EdgeInsets.all(0.w),
                  );
                }
              }),
            ],
          ),
        ));
  }

  /// Returns the header wrapping the header text.
  Widget header() => Text(
        headerText(),
        style: AppStyles.textStyleTitle().copyWith(
          color: AppColors.deepBlue,
          fontWeight: FontWeight.bold,
          fontSize: 10.0.sp,
        ),
        textAlign: TextAlign.center,
      );

  // Returns the header text based on the activeStep.
  String headerText() {
    return categories[activeStepIndex].name;
  }

  /// Returns the next button.
  Widget nextButton() => ElevatedButton(
        onPressed: () {
          // Increment activeStep, when the next button is tapped. However, check for upper bound.
          if (activeStepIndex < upperBound) {
            if (formKeys[categories[activeStepIndex].name]!
                .currentState!
                .validate()) {
              if (activeStepIndex < categories.length) {
                setState(() {
                  activeStepIndex++;
                });
              } else if (activeStepIndex == categories.length) {}
            }
          }
        },
        child: Text(
          activeStepIndex == categories.length - 1 ? 'Submit' : 'Next',
          style: AppStyles.textStyleBody(context).copyWith(
            color: AppColors.deepBlue,
            fontWeight: FontWeight.bold,
            fontSize: 9.sp,
          ),
        ),
      );

  /// Returns the previous button.
  Widget previousButton() => ElevatedButton(
        onPressed: () {
          // Decrement activeStep, when the previous button is tapped. However, check for lower bound i.e., must be greater than 0.
          if (activeStepIndex > 0) {
            setState(() {
              activeStepIndex--;
            });
          }
        },
        child: Text(
          'Prev',
          style: AppStyles.textStyleBody(context).copyWith(
            color: AppColors.deepBlue,
            fontWeight: FontWeight.bold,
            fontSize: 9.sp,
          ),
        ),
      );

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sc = SizeConfig(context: context);

    Widget spacer() => SizedBox(height: sc.heightScaledSize(15));
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) => state.maybeWhen(
        orElse: () => {},
      ),
      builder: (context, state) => PageMargin(
        showBottomNav: false,
        backgroundColor: AppColors.white,
        child: Padding(
          padding: EdgeInsets.all(1.0.w),
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
              IconStepper(
                icons: [
                  ...List.generate(categories.length, (index) {
                    return Icon(
                      Icons.edit_note_sharp,
                      color: AppColors.deepBlue,
                      size: 6.0.w,
                    );
                  }),
                ],
                stepRadius: 5.0.w,
                stepColor: AppColors.lightBlue100,
                activeStepBorderColor: AppColors.greenish,
                activeStepColor: AppColors.mintGreen,
                activeStep: activeStepIndex,
                // This ensures step-tapping updates the activeStep.
                onStepReached: (index) {
                  setState(() {
                    activeStepIndex = index;
                  });
                },
              ),
              spacer(),
              header(),
              spacer(),
              loadStepForm(),
              spacer(),
              spacer(),
              Padding(
                padding: EdgeInsets.all(2.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: activeStepIndex > 0 && activeStepIndex < 3,
                      child: previousButton(),
                    ),
                    Visibility(
                      visible: activeStepIndex >= 0,
                      child: nextButton(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
