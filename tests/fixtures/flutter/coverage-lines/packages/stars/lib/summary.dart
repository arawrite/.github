import 'package:stars/stars.dart';

String summary(double first, double second) {
  final firstStars = stars(first);
  final secondStars = stars(second);
  final joined = [firstStars, secondStars].join(', ');
  return 'Stars: $joined';
}
