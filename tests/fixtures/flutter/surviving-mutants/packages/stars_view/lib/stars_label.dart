import 'package:flutter/widgets.dart';
import 'package:stars/stars.dart';

class StarsLabel extends StatelessWidget {
  const StarsLabel({required this.score, super.key});

  final double score;

  @override
  Widget build(BuildContext context) {
    final count = stars(score);
    final String noun;
    if (count == 1) {
      noun = 'star';
    } else {
      noun = 'stars';
    }
    return Text('$count $noun', textDirection: TextDirection.ltr);
  }
}
