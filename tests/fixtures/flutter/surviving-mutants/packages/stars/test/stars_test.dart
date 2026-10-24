import 'package:stars/stars.dart';
import 'package:test/test.dart';

void main() {
  test('a top score earns three stars', () {
    expect(stars(0.9), 3);
  });
}
