// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:typeform_app/core/platform/app_colors.dart';
import 'package:typeform_app/core/presentation/pages/page_margin.dart';
import 'package:typeform_app/features/authentication/presentation/cubit/authentication_cubit.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocListener<AuthenticationCubit, AuthenticationState>(
        listener: (_, state) => state.maybeWhen(
          orElse: () => {},
          error: (payload) => {
            context.go('/login'),
          },
          loggingIn: (payload) => {},
          loggedOut: (payload) => context.go('/login'),
          pinRequired: (payload) => {
            context.go('/enter-pin'),
          },
          onboardingRequired: (_) => context.go('/introSlider'),
        ),
        child: PageMargin(
          backgroundColor: AppColors.white,
          child: Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryRed,
              backgroundColor: AppColors.grey.withOpacity(0.5),
            ),
          ),
        ),
      );
}
