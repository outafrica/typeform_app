// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:typeform_app/core/data/network/utilities/error_helpers.dart';
import 'package:typeform_app/core/data/network/utilities/failure.dart';
import 'package:typeform_app/core/platform/utilities/usecase_typedefs.dart';
import 'package:typeform_app/features/authentication/data/models/user_model.dart';
import 'package:typeform_app/features/authentication/domain/repositories/authentication_repository.dart';

class CheckLogin implements Usecase<UserModel?, NoParams> {
  final AuthenticationRepository repository;

  CheckLogin(this.repository);

  @override
  Future<Either<UIError, UserModel?>> call([params]) async {
    try {
      final user = await repository.checkLogin();
      return Right(user);
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
