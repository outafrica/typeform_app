import 'package:typeform_app/core/data/datasources/remote_datasource_base.dart';
import 'package:typeform_app/core/data/network/network_service.dart';
import 'package:typeform_app/core/data/network/network_service_impl.dart';
import 'package:typeform_app/core/data/network/utilities/error_helpers.dart';
import 'package:typeform_app/features/home/data/datasources/home_endpoints.dart';
import 'package:typeform_app/features/home/data/models/home_models.dart';
import 'package:typeform_app/features/home/domain/params/home_params.dart';

abstract class HomeRemoteDataSource implements RemoteDataSource {
  Future<OptionModel> createOption({
    required AddOptionParams params,
  });
  Future<QuestionModel> createQuestion({
    required AddQuestionParams params,
  });
  Future<List<FormModel>> getForms({bool isAllForms = false});
  Future<List<QuestionModel>> getQuestions();
  Future<List<CategoryModel>> getCategories();
  Future<List<OptionTypeModel>> getOptionTypes();
}

class HomeDataSourceImpl implements HomeRemoteDataSource {
  final NetworkService _networkService;

  HomeDataSourceImpl(this._networkService);

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  Future<OptionModel> createOption({
    required AddOptionParams params,
  }) async {
    final result = await _networkService.postHttp(
      HomeEndpoints.options,
      body: {
        'form_question_id': params.questionId,
        'option': params.option,
      },
      tokenRequired: false,
    );

    if (result['error'] != null) {
      await handleApiFailure(
        source: 'createOption',
        errorMessage: result['message'] as String,
        errorCode: result['error'] as ApiErrors,
      );
    }

    final option = OptionModel.fromJson(result['data'] as Map);

    return option;
  }

  @override
  Future<QuestionModel> createQuestion({
    required AddQuestionParams params,
  }) async {
    final result = await _networkService.postHttp(
      HomeEndpoints.questions,
      body: {
        'user_id': params.userId,
        'form_id': params.formId,
        'form_question_category_id': params.questionCategoryId,
        'question': params.question,
        'form_question_option_type_id': params.questionOptionTypeId,
      },
      tokenRequired: false,
    );

    if (result['error'] != null) {
      await handleApiFailure(
        source: 'createQuestion',
        errorMessage: result['message'] as String,
        errorCode: result['error'] as ApiErrors,
      );
    }

    final question = QuestionModel.fromJson(result['data'] as Map);

    return question;
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    final result = await _networkService.getHttp(
      HomeEndpoints.categories,
      tokenRequired: false,
    );

    if (result['error'] != null) {
      await handleApiFailure(
        source: 'getCategories',
        errorMessage: result['message'] as String,
        errorCode: result['error'] as ApiErrors,
      );
    }

    return (result['data'] as List)
        .map((e) => CategoryModel.fromJson(e as Map))
        .toList();
  }

  @override
  Future<List<FormModel>> getForms({bool isAllForms = false}) async {
    final result = await _networkService.getHttp(
      isAllForms ? HomeEndpoints.getAllForms : HomeEndpoints.forms,
      tokenRequired: false,
    );

    if (result['error'] != null) {
      await handleApiFailure(
        source: 'getForms',
        errorMessage: result['message'] as String,
        errorCode: result['error'] as ApiErrors,
      );
    }

    return (result['data'] as List)
        .map((e) => FormModel.fromJson(e as Map))
        .toList();
  }

  @override
  Future<List<QuestionModel>> getQuestions() async {
    final result = await _networkService.getHttp(
      HomeEndpoints.questions,
      tokenRequired: false,
    );

    if (result['error'] != null) {
      await handleApiFailure(
        source: 'getQuestions',
        errorMessage: result['message'] as String,
        errorCode: result['error'] as ApiErrors,
      );
    }

    return (result['data'] as List)
        .map((e) => QuestionModel.fromJson(e as Map))
        .toList();
  }

  @override
  Future<List<OptionTypeModel>> getOptionTypes() async {
    final result = await _networkService.getHttp(
      HomeEndpoints.optiontypes,
      tokenRequired: false,
    );

    if (result['error'] != null) {
      await handleApiFailure(
        source: 'getOptionTypes',
        errorMessage: result['message'] as String,
        errorCode: result['error'] as ApiErrors,
      );
    }

    return (result['data'] as List)
        .map((e) => OptionTypeModel.fromJson(e as Map))
        .toList();
  }
}
