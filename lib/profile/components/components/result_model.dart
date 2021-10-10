enum ProteryType { water, care, sun }

class Result {
  final ProteryType property;
  final String comment;
  final bool correct;
  final double changes;

  Result(
      {required this.property,
      required this.comment,
      required this.correct,
      required this.changes});
}
