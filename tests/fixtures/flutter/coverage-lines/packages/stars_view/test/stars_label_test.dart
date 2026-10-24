import 'package:flutter_test/flutter_test.dart';
import 'package:stars_view/stars_label.dart';

void main() {
  testWidgets('one star is singular', (tester) async {
    await tester.pumpWidget(const StarsLabel(score: 0.5));
    expect(find.text('1 star'), findsOneWidget);
  });

  testWidgets('other counts are plural', (tester) async {
    await tester.pumpWidget(const StarsLabel(score: 0.9));
    expect(find.text('3 stars'), findsOneWidget);
  });
}
