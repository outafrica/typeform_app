// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:typeform_app/core/data/network/utilities/error_helpers.dart';
import 'package:typeform_app/core/data/network/utilities/failure.dart';
import 'package:typeform_app/core/platform/utilities/utilities.dart';
import 'package:typeform_app/features/authentication/data/models/authentication_models.dart';
import 'package:typeform_app/features/authentication/domain/repositories/authentication_repository.dart';

class GetGenders implements Usecase<List<GenderModel>, NoParams> {
  final AuthenticationRepository _repo;

  GetGenders(this._repo);

  @override
  Future<Either<UIError, List<GenderModel>>> call([NoParams? params]) async {
    try {
      final res = await _repo.getGenders();
      return Right(res);
    } on NetworkFailure catch (e, s) {
      return Left(getUIErrorFromUsecaseFailure(e.message, e, s));
    } on CacheFailure catch (e, s) {
      return Left(getUIErrorFromUsecaseFailure(e.message, e, s));
    }
  }
}
