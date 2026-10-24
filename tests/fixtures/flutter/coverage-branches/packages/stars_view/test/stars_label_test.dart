import 'package:flutter_test/flutter_test.dart';
import 'package:stars_view/stars_label.dart';

void main() {
  testWidgets('one star is singular', (tester) async {
    await tester.pumpWidget(const StarsLabel(score: 0.5));
    expect(find.text('1 star'), findsOneWidget);
  });
}
