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
import 'package:flutter_test/flutter_test.dart';

main() {
  group('date time', () {
    test('toMilliseconds', () {
      expect(1.milliseconds, Duration(milliseconds: 1));
    });

    test('toSeconds', () {
      expect(1.seconds, Duration(seconds: 1));
    });

    test('toMinutes', () {
      expect(1.minutes, Duration(minutes: 1));
    });

    test('toHours', () {
      expect(1.hours, Duration(hours: 1));
    });

    test('toDays', () {
      expect(1.days, Duration(days: 1));
    });

    test('isFuture', () {
      expect(DateTime.now().add(1.days).isFuture, true);
    });

    test('isPast', () {
      expect(DateTime.now().subtract(1.days).isPast, true);
    });
  });
}
