/*
 * Copyright 2020 Idan Ayalon. All rights reserved.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import 'package:dart_extensions/dart_extensions.dart';
import 'package:test/test.dart';

main() {
  group('integers', () {
    test('inRangeOf', () {
      expect(1.inRangeOf(0, 3), 1);
      expect(2.inRangeOf(3, 4), 3);
      expect(5.inRangeOf(3, 4), 4);
    });

    test('isEven', () {
      expect(2.isEven, true);
      expect(3.isEven, false);
    });

    test('isOdd', () {
      expect(3.isOdd, true);
      expect(2.isOdd, false);
    });

    test('isPositive', () {
      expect(0.isPositive, false);
      expect(1.isPositive, true);
      expect((-1).isPositive, false);
    });

    test('isNegative', () {
      expect(0.isNegative, false);
      expect(1.isNegative, false);
      expect((-1).isNegative, true);
    });

    test('tenth', () {
      expect(100.tenth, 10);
    });

    test('fourth', () {
      expect(16.fourth, 4);
    });

    test('third', () {
      expect(9.third, 3);
    });

    test('half', () {
      expect(100.half, 50);
    });

    test('doubled', () {
      expect(100.doubled, 200);
    });

    test('tripled', () {
      expect(100.tripled, 300);
    });

    test('quadrupled', () {
      expect(100.quadrupled, 400);
    });

    test('squared', () {
      expect(2.squared, 4);
    });

    test('asBool', () {
      expect(1.asBool, true);
      expect(0.asBool, false);
      expect(9382.asBool, true);
      expect((-2272).asBool, false);
    });
  });
}
