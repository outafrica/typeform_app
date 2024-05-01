import 'package:typeform_app/core/data/network/utilities/guarded_datasource_calls.dart';
import 'package:typeform_app/features/home/data/datasources/home_remote_data_source.dart';
import 'package:typeform_app/features/home/data/models/category_model.dart';
import 'package:typeform_app/features/home/data/models/form_model.dart';
import 'package:typeform_app/features/home/data/models/option_model.dart';
import 'package:typeform_app/features/home/data/models/option_type_model.dart';
import 'package:typeform_app/features/home/data/models/question_model.dart';
import 'package:typeform_app/features/home/domain/params/home_params.dart';
import 'package:typeform_app/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;

  HomeRepositoryImpl(this._remoteDataSource);

  @override
  Future<OptionModel> createOption(AddOptionParams params) async =>
      guardedApiCall<OptionModel>(
        () => _remoteDataSource.createOption(params: params),
      );

  @override
  Future<QuestionModel> createQuestion(AddQuestionParams params) async =>
      guardedApiCall<QuestionModel>(
        () => _remoteDataSource.createQuestion(params: params),
      );

  @override
  Future<List<FormModel>> getForms(bool isAllForms) async =>
      guardedApiCall<List<FormModel>>(
        () => _remoteDataSource.getForms(isAllForms: isAllForms),
      );

  @override
  Future<List<QuestionModel>> getQuestions() async =>
      guardedApiCall<List<QuestionModel>>(
        () => _remoteDataSource.getQuestions(),
      );

  @override
  Future<List<CategoryModel>> getCategories() async =>
      guardedApiCall<List<CategoryModel>>(
        () => _remoteDataSource.getCategories(),
      );

  @override
  Future<List<OptionTypeModel>> getOptionTypes() async =>
      guardedApiCall<List<OptionTypeModel>>(
        () => _remoteDataSource.getOptionTypes(),
      );
}
