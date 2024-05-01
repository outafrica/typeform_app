// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:typeform_app/core/data/network/utilities/error_helpers.dart';
import 'package:typeform_app/core/data/network/utilities/failure.dart';
import 'package:typeform_app/core/platform/utilities/usecase_typedefs.dart';
import 'package:typeform_app/features/home/data/models/home_models.dart';
import 'package:typeform_app/features/home/domain/params/home_params.dart';
import 'package:typeform_app/features/home/domain/repositories/home_repository.dart';

class CreateOption implements Usecase<OptionModel, AddOptionParams> {
  final HomeRepository repository;

  CreateOption(this.repository);

  @override
  Future<Either<UIError, OptionModel>> call([params]) async {
    try {
      final option = await repository.createOption(params!);
      return Right(option);
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
