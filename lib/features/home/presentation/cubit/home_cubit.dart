import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:typeform_app/features/home/data/models/home_models.dart';
import 'package:typeform_app/features/home/domain/params/home_params.dart';
import 'package:typeform_app/features/home/domain/usecases/home_usecases.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final CreateOption _createOption;
  final CreateQuestion _createQuestion;
  final GetCategories _getCategories;
  final GetForms _getForms;
  final GetQuestions _getQuestions;
  final GetOptionTypes _getOptionTypes;

  HomeCubit(
    this._createOption,
    this._createQuestion,
    this._getCategories,
    this._getForms,
    this._getQuestions,
    this._getOptionTypes,
  ) : super(
          const HomeState.initial(
            payload: HomeStatePayload(
              error: '',
              forms: [],
              categories: [],
              questions: [],
              optionTypes: [],
            ),
          ),
        ) {}

  Future<void> createOption({required AddOptionParams params}) async {
    emit(HomeState.addingOption(payload: state.payload.copyWith()));

    final result = await _createOption(params);

    result.fold(
      (l) => emit(
        HomeState.addingOptionError(
          payload: state.payload.copyWith(error: l.message),
        ),
      ),
      (r) => emit(
        HomeState.addedOption(
          payload: state.payload.copyWith(option: r),
        ),
      ),
    );
  }

  Future<void> createQuestion({required AddQuestionParams params}) async {
    emit(HomeState.addingQuestion(payload: state.payload.copyWith()));

    final result = await _createQuestion(params);

    result.fold(
      (l) => emit(
        HomeState.addingQuestionError(
          payload: state.payload.copyWith(error: l.message),
        ),
      ),
      (r) => emit(
        HomeState.addedQuestion(
          payload: state.payload.copyWith(question: r),
        ),
      ),
    );
  }

  Future<void> getForms({required bool isAllForms}) async {
    emit(HomeState.loadingForms(payload: state.payload.copyWith()));

    final result = await _getForms(isAllForms);

    result.fold(
      (l) => emit(
        HomeState.loadingFormsError(
          payload: state.payload.copyWith(error: l.message),
        ),
      ),
      (r) => emit(
        HomeState.loadedForms(
          payload: state.payload.copyWith(forms: r),
        ),
      ),
    );
  }

  Future<void> getOptionTypes() async {
    emit(HomeState.loadingOptionTypes(payload: state.payload.copyWith()));

    final result = await _getOptionTypes();

    result.fold(
      (l) => emit(
        HomeState.loadingOptionTypesError(
          payload: state.payload.copyWith(error: l.message),
        ),
      ),
      (r) => emit(
        HomeState.loadedOptionTypes(
          payload: state.payload.copyWith(optionTypes: r),
        ),
      ),
    );
  }

  Future<void> getQuestions() async {
    emit(HomeState.loadingQuestions(payload: state.payload.copyWith()));

    final result = await _getQuestions();

    result.fold(
      (l) => emit(
        HomeState.loadingQuestionsError(
          payload: state.payload.copyWith(error: l.message),
        ),
      ),
      (r) => emit(
        HomeState.loadedQuestions(
          payload: state.payload.copyWith(questions: r),
        ),
      ),
    );
  }

  Future<void> getCategories() async {
    emit(HomeState.loadingCategories(payload: state.payload.copyWith()));

    final result = await _getCategories();

    result.fold(
      (l) => emit(
        HomeState.loadingCategoriesError(
          payload: state.payload.copyWith(error: l.message),
        ),
      ),
      (r) => emit(
        HomeState.loadedCategories(
          payload: state.payload.copyWith(categories: r),
        ),
      ),
    );
  }
}
