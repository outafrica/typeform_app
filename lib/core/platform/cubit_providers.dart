// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:typeform_app/features/authentication/domain/authentication_module_injector.dart';
import 'package:typeform_app/features/authentication/domain/usecases/authentication_usecases.dart';
import 'package:typeform_app/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:typeform_app/features/home/domain/home_module_injector.dart';
import 'package:typeform_app/features/home/domain/usecases/home_usecases.dart';
import 'package:typeform_app/features/home/presentation/cubit/home_cubit.dart';

// Project imports:

// Register cubits

// Authentication cubit definition
AuthenticationCubit? _authCubit;

AuthenticationCubit getAuthCubit() => _authCubit ??= AuthenticationCubit(
      AuthenticationModuleInjector.resolve<CheckLogin>(),
      AuthenticationModuleInjector.resolve<CreatePin>(),
      AuthenticationModuleInjector.resolve<FetchUser>(),
      AuthenticationModuleInjector.resolve<Login>(),
      AuthenticationModuleInjector.resolve<LogOut>(),
      AuthenticationModuleInjector.resolve<SignUp>(),
      AuthenticationModuleInjector.resolve<GetGenders>(),
      AuthenticationModuleInjector.resolve<GetRoles>(),
      AuthenticationModuleInjector.resolve<VerifyPin>(),
    )..checkLogin();

// Home cubit definition
HomeCubit? _homeCubit;

HomeCubit getHomeCubit() => _homeCubit ??= HomeCubit(
      HomeModuleInjector.resolve<CreateOption>(),
      HomeModuleInjector.resolve<CreateQuestion>(),
      HomeModuleInjector.resolve<GetCategories>(),
      HomeModuleInjector.resolve<GetForms>(),
      HomeModuleInjector.resolve<GetQuestions>(),
      HomeModuleInjector.resolve<GetOptionTypes>(),
    )..getForms(
        isAllForms: true,
      );

// Register providers
final List<BlocProvider> providers = [
  BlocProvider<AuthenticationCubit>(
    create: (context) => getAuthCubit(),
  ),
  BlocProvider<HomeCubit>(
    create: (context) => getHomeCubit(),
  ),
];
