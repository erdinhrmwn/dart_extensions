import 'package:flutter_test/flutter_test.dart';

import '../lib/enum.dart';

enum TestEnum { testValue1, testValue2, testValue3 }

enum OtherEnumForTesting { helloImAnEnumValue }

void main() {
  test('it should convert enums to string', () {
    expect(TestEnum.testValue1.convertToString(), 'testValue1');
    expect(TestEnum.testValue2.convertToString(), 'testValue2');
    expect(TestEnum.testValue3.convertToString(), 'testValue3');
  });
}
