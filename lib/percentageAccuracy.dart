import 'package:collection/collection.dart';

class PercentageAccuracy {
  final double x;
  final double y;

  PercentageAccuracy({required this.x, required this.y});
}
  List<PercentageAccuracy> get percentages {
    final data = <double>[20, 40, 66.66, 55, 32, 53, 85, 56, 49];
    return data.mapIndexed((index, element) => PercentageAccuracy(x: index.toDouble(), y: element))
        .toList();

  }
