import 'package:typeform_app/features/home/data/models/home_models.dart';
import 'package:typeform_app/features/home/domain/params/home_params.dart';

abstract class HomeRepository {
  Future<List<FormModel>> getForms(bool isAllForms);
  Future<List<CategoryModel>> getCategories();
  Future<List<OptionTypeModel>> getOptionTypes();
  Future<List<QuestionModel>> getQuestions();
  Future<QuestionModel> createQuestion(AddQuestionParams params);
  Future<OptionModel> createOption(AddOptionParams params);
}
