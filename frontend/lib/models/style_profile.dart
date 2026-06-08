class SkeletonProfile {
  final String type;
  final String fitConcern;

  const SkeletonProfile({
    required this.type,
    required this.fitConcern,
  });
}

class PersonalColorProfile {
  final String type;
  final String label;
  final String summary;
  final List<String> colors;
  final List<String> bestHexColors;
  final List<String> additionalRecommendedColors;
  final List<String> avoidColors;

  const PersonalColorProfile({
    required this.type,
    required this.label,
    required this.summary,
    required this.colors,
    this.bestHexColors = const [],
    this.additionalRecommendedColors = const [],
    this.avoidColors = const [],
  });
}
