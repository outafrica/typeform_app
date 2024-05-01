// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:typeform_app/core/data/network/utilities/error_helpers.dart';
import 'package:typeform_app/core/data/network/utilities/failure.dart';
import 'package:typeform_app/core/platform/utilities/usecase_typedefs.dart';
import 'package:typeform_app/features/authentication/domain/repositories/authentication_repository.dart';

class LogOut implements Usecase<VoidType, NoParams> {
  final AuthenticationRepository repository;

  LogOut(this.repository);

  @override
  Future<Either<UIError, VoidType>> call([params]) async {
    try {
      await repository.logout();
      return const Right(VoidType());
    } on NetworkFailure catch (e, s) {
      return Left(
        getUIErrorFromUsecaseFailure(
          e.message,
          e,
          s,
        ),
      );
    } on CacheFailure catch (e, s) {
      return Left(
        getUIErrorFromUsecaseFailure(
          e.message,
          e,
          s,
        ),
      );
    }
  }
}
