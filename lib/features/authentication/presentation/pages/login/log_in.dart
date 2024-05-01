// Flutter imports:
import 'package:auto_size_text/auto_size_text.dart';
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
import 'package:typeform_app/features/home/data/models/home_models.dart';
import 'package:typeform_app/features/home/presentation/cubit/home_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late bool isLoading;
  late List<FormModel> forms;
  late List<CategoryModel> categories;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    forms = [];
    categories = [];
    context.read<HomeCubit>().getForms(
          isAllForms: true,
        );
    context.read<HomeCubit>().getCategories();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => _bodyWidget(context);

  Widget _bodyWidget(BuildContext context) {
    final _sc = SizeConfig(context: context);

    Widget spacer() => SizedBox(height: _sc.heightScaledSize(15));

    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loadingForms: (payload) {},
          loadingCategories: (payload) {},
          loadedCategories: (payload) {
            setState(() {
              categories = payload.categories;
            });
          },
          loadedForms: (payload) {
            setState(() {
              isLoading = false;
              forms = payload.forms;
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
          : PageMargin(
              backgroundColor: AppColors.white,
              padding: EdgeInsets.symmetric(
                horizontal: 3.0.h,
                vertical: 10.0.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _titleWidget(context),
                  spacer(),
                  _formsWidget(context),
                  spacer(),
                ],
              ),
            ),
    );
  }

  Widget _titleWidget(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'All Forms',
            style: AppStyles.textStyleTitle().copyWith(
              color: AppColors.primaryBlue,
            ),
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(
                left: 25.0.w,
              ),
              child: AppButton(
                onTap: () async {
                  context.push('/questions/create', extra: {
                    'forms': forms,
                    'categories': categories,
                  });
                },
                label: 'Add Question',
                color: AppColors.green,
                fontColor: Colors.black,
                width: double.infinity,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      );

  Widget _formsWidget(BuildContext context) {
    final sc = SizeConfig(context: context);

    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          if (forms[index].questions.isEmpty) {
            EasyLoading.showInfo(
              'This form has no questions!',
              dismissOnTap: true,
            );
          } else {
            context.push('/questions', extra: {
              'forms': forms[index],
              'categories': categories,
            });
          }
        },
        child: Padding(
          padding: EdgeInsets.only(
            bottom: 1.0.h,
          ),
          child: AnimatedContainer(
            width: 100.0.w,
            height: 14.0.h,
            duration: kThemeAnimationDuration,
            padding: EdgeInsets.all(
              5.w,
            ),
            decoration: BoxDecoration(
              color: AppColors.mintGreen,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  sc.heightScaledSize(20)!,
                ),
              ),
            ),
            child: ListTile(
              minLeadingWidth: 0,
              minVerticalPadding: 0,
              contentPadding: EdgeInsets.zero,
              title: AutoSizeText(
                forms[index].title,
                style: sc.h5Theme.copyWith(
                  color: AppColors.gray32,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: AutoSizeText(
                forms[index].description,
                style: sc.body2Theme.copyWith(
                  color: AppColors.gray32,
                  fontSize: 10.5.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ),
      itemCount: forms.length,
    );
  }
}
