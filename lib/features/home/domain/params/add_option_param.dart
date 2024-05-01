class AddOptionParams {
  final String questionId;
  final String option;

  AddOptionParams({
    required this.questionId,
    required this.option,
  });

  AddOptionParams copyWith({
    String? questionId,
    String? option,
  }) =>
      AddOptionParams(
        questionId: questionId ?? this.questionId,
        option: option ?? this.option,
      );

  @override
  String toString() =>
      '''AddOptionParams(questionId: $questionId, option: $option)''';
}
