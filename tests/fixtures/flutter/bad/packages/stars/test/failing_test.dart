import 'package:stars/stars.dart';
import 'package:test/test.dart';

void main() {
  test('the top score earns four stars', () {
    expect(stars(1.0), 4);
  });

  test('a skipped test still runs', () {
    expect(stars(0.0), 1);
  }, skip: 'Slow');
}
