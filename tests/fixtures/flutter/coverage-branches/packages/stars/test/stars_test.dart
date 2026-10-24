import 'package:stars/stars.dart';
import 'package:test/test.dart';

void main() {
  test('each threshold earns a star', () {
    expect([0.39, 0.40, 0.65, 0.85].map(stars), [0, 1, 2, 3]);
  });
}
