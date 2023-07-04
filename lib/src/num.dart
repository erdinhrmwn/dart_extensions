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

part of '/dart_extensions.dart';

extension NumExtensions on num {
  /// Return the min if this number is smaller then minimum
  /// Return the max if this number is bigger the the maximum
  /// Return this number if it's between the range
  num inRangeOf(num min, num max) {
    if (min > max) throw ArgumentError('min must be smaller the max');

    if (this < min) return min;
    if (this > max) return max;
    return this;
  }

  /// Returns the absolute value
  num get absolute => abs();

  /// Returns number of digits in this number
  int get numberOfDigits => toString().length;

  /// Returns if the number is zero
  bool get isZero => this == 0;

  /// Returns if the number is even
  bool get isEven => this % 2 == 0;

  /// Returns if the number is odd
  bool get isOdd => this % 2 != 0;

  /// Returns if the number is positive
  bool get isPositive => this > 0;

  /// Returns if the number is negative
  bool get isNegative => this < 0;

  /// Returns tenth of the number
  double get tenth => this / 10;

  /// Returns fourth of the number
  double get fourth => this / 4;

  /// Returns third of the number
  double get third => this / 3;

  /// Returns half of the number
  double get half => this / 2;

  /// Return this number time two
  num get doubled => this * 2;

  /// Return this number time three
  num get tripled => this * 3;

  /// Return this number time four
  num get quadrupled => this * 4;

  /// Return squared number
  num get squared => this * this;

  /// Convert this integer into boolean.
  ///
  /// Returns `true` if this num is equal to *1*.
  bool get asBool => this == 1;
}

extension NumDuration on num {
  Duration get milliseconds => Duration(microseconds: (this * 1000).round());

  Duration get seconds => Duration(milliseconds: (this * 1000).round());

  Duration get minutes => Duration(seconds: (this * 60).round());

  Duration get hours => Duration(minutes: (this * 60).round());

  Duration get days => Duration(hours: (this * 24).round());

  Duration get weeks => Duration(days: (this * 7).round());

  Duration get months => Duration(days: (this * 30).round());

  Duration get years => Duration(days: (this * 365).round());
}

extension NumTimer on num {
  Future delay([FutureOr Function()? callback]) async => Future.delayed(seconds, callback);

  Timer interval(void Function(Timer) callback) => Timer.periodic(seconds, callback);

  Timer timer(Function() onDone) => Timer.periodic(1.seconds, (timer) {
        if (timer.tick == round()) {
          timer.cancel();
          onDone();
        }
      });
}

extension NumMoney on num {
  String format({String? prefix, int decimalDigits = 0}) {
    final format = intl.NumberFormat.currency(name: prefix, decimalDigits: decimalDigits);
    final currency = format.format(this.abs());
    final firstNumber = currency.indexOf(RegExp('[0-9]'));

    return currency.replaceFirst(currency[firstNumber], ' ${this < 0 ? '-' : ''}${currency[firstNumber]}');
  }

  String compactFormat({String? prefix, int decimalDigits = 0}) {
    final format = intl.NumberFormat.compactCurrency(decimalDigits: decimalDigits);
    final currency = format.format(this.abs());
    final firstNumber = currency.indexOf(RegExp('[0-9]'));

    return currency.replaceFirst(currency[firstNumber], ' ${this < 0 ? '-' : ''}${currency[firstNumber]}');
  }
}
