class AddQuestionParams {
  final String userId;
  final int formId;
  final int questionCategoryId;
  final String question;
  final int questionOptionTypeId;

  AddQuestionParams({
    required this.userId,
    required this.formId,
    required this.questionCategoryId,
    required this.question,
    required this.questionOptionTypeId,
  });

  AddQuestionParams copyWith({
    String? userId,
    int? formId,
    int? questionCategoryId,
    String? question,
    int? questionOptionTypeId,
  }) =>
      AddQuestionParams(
        userId: userId ?? this.userId,
        formId: formId ?? this.formId,
        questionCategoryId: questionCategoryId ?? this.questionCategoryId,
        question: question ?? this.question,
        questionOptionTypeId: questionOptionTypeId ?? this.questionOptionTypeId,
      );

  @override
  String toString() => '''AddQuestionParams(userId: $userId, formId: $formId,
      questionCategoryId: $questionCategoryId,
      question: $question, questionOptionTypeId: $questionOptionTypeId)''';
}
