part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial({
    required HomeStatePayload payload,
  }) = _InitialHomeState;

  const factory HomeState.loadingForms({
    required HomeStatePayload payload,
  }) = _LoadingFormsHomeState;

  const factory HomeState.loadingQuestions({
    required HomeStatePayload payload,
  }) = _LoadingQuestionsHomeState;

  const factory HomeState.loadingOptionTypes({
    required HomeStatePayload payload,
  }) = _LoadingOptionTypesHomeState;

  const factory HomeState.loadingCategories({
    required HomeStatePayload payload,
  }) = _LoadingCategoriesHomeState;

  const factory HomeState.addingOption({
    required HomeStatePayload payload,
  }) = _AddingOptionHomeState;

  const factory HomeState.addingQuestion({
    required HomeStatePayload payload,
  }) = _AddingQuestionHomeState;

  const factory HomeState.loadedForms({
    required HomeStatePayload payload,
  }) = _LoadedFormsHomeState;

  const factory HomeState.loadedQuestions({
    required HomeStatePayload payload,
  }) = _LoadedQuestionsHomeState;

  const factory HomeState.loadedOptionTypes({
    required HomeStatePayload payload,
  }) = _LoadedOptionTypesHomeState;

  const factory HomeState.loadedCategories({
    required HomeStatePayload payload,
  }) = _LoadedCategoriesHomeState;

  const factory HomeState.addedOption({
    required HomeStatePayload payload,
  }) = _AddedOptionHomeState;

  const factory HomeState.addedQuestion({
    required HomeStatePayload payload,
  }) = _addedQuestionHomeState;

  const factory HomeState.loadingFormsError({
    required HomeStatePayload payload,
  }) = _LoadingFormsErrorHomeState;

  const factory HomeState.loadingQuestionsError({
    required HomeStatePayload payload,
  }) = _LoadingQuestionsErrorHomeState;

  const factory HomeState.loadingOptionTypesError({
    required HomeStatePayload payload,
  }) = _LoadingOptionTypesErrorHomeState;

  const factory HomeState.loadingCategoriesError({
    required HomeStatePayload payload,
  }) = _LoadingCategoriesErrorHomeState;

  const factory HomeState.addingOptionError({
    required HomeStatePayload payload,
  }) = _AddingOptionErrorHomeState;

  const factory HomeState.addingQuestionError({
    required HomeStatePayload payload,
  }) = _AddingQuestionErrorHomeState;
}

@freezed
class HomeStatePayload with _$HomeStatePayload {
  const factory HomeStatePayload({
    required String error,
    required List<FormModel> forms,
    required List<OptionTypeModel> optionTypes,
    required List<CategoryModel> categories,
    required List<QuestionModel> questions,
    OptionModel? option,
    QuestionModel? question,
  }) = _HomeStatePayload;
}
