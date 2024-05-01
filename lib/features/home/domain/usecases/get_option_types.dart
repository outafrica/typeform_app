// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:typeform_app/core/data/network/utilities/error_helpers.dart';
import 'package:typeform_app/core/data/network/utilities/failure.dart';
import 'package:typeform_app/core/platform/utilities/usecase_typedefs.dart';
import 'package:typeform_app/features/home/data/models/home_models.dart';
import 'package:typeform_app/features/home/domain/repositories/home_repository.dart';

class GetOptionTypes implements Usecase<List<OptionTypeModel>, NoParams> {
  final HomeRepository repository;

  GetOptionTypes(this.repository);

  @override
  Future<Either<UIError, List<OptionTypeModel>>> call([params]) async {
    try {
      final optionTypes = await repository.getOptionTypes();
      return Right(optionTypes);
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
