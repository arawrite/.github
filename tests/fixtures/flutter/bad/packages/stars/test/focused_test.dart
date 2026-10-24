import 'package:stars/stars.dart';
import 'package:test/test.dart';

void main() {
  test('no score earns no stars', () {
    expect(stars(0.0), 0);
  }, solo: true);
}
