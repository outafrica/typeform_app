// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:typeform_app/core/data/network/utilities/error_helpers.dart';
import 'package:typeform_app/core/data/network/utilities/failure.dart';
import 'package:typeform_app/core/platform/utilities/utilities.dart';
import 'package:typeform_app/features/authentication/domain/params/authentication_params.dart';
import 'package:typeform_app/features/authentication/domain/repositories/authentication_repository.dart';

class CreatePin implements Usecase<VoidType, PinParams> {
  final AuthenticationRepository _repo;

  CreatePin(this._repo);

  @override
  Future<Either<UIError, VoidType>> call([PinParams? params]) async {
    try {
      await _repo.createPin(params!);

      return const Right(VoidType());
    } on NetworkFailure catch (e, s) {
      return Left(getUIErrorFromUsecaseFailure(e.message, e, s));
    } on CacheFailure catch (e, s) {
      return Left(getUIErrorFromUsecaseFailure(e.message, e, s));
    }
  }
}
