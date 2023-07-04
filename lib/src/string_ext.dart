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

extension StringOptExtensions on String? {
  bool get isEmptyOrNull => this == null || this == "";

  /// Returns the string if it is not `null`, or the empty string otherwise
  String get orEmpty => this ?? "";

  /// Parses the string as an double or returns `null` if it is not a number.
  double? toDoubleOrNull() => this == null ? null : double.tryParse(this!);

  /// Parses the string as an int or returns `null` if it is not a number.
  int? toIntOrNull() => this == null ? null : int.tryParse(this!);

  /// Indicates whether a specified string is `null`, `empty`, or consists only of `white-space` characters.
  bool get isNullOrWhiteSpace {
    var length = (this ?? "").split('').where((x) => x == ' ').length;
    return length == (this ?? "").length || this.isEmptyOrNull;
  }
}

extension StringExtensions on String {
  bool isNull(dynamic value) => value == null;

  /// Returns whether a dynamic value PROBABLY
  /// has the isEmpty getter/method by checking
  /// standard dart types that contains it.
  ///
  /// This is here to for the 'DRY'
  bool? _isEmpty(dynamic value) {
    if (value is String) {
      return value.toString().trim().isEmpty;
    }
    if (value is Iterable || value is Map) {
      return value.isEmpty as bool?;
    }
    return false;
  }

  /// Checks if string is a valid username.
  bool get isUsername => hasMatch(r'^[a-zA-Z0-9][a-zA-Z0-9_.]+[a-zA-Z0-9]$');

  /// Checks if string is Palindrome.
  bool get isPalindrome {
    final cleanString = this.toLowerCase().replaceAll(RegExp(r"\s+"), '').replaceAll(RegExp(r"[^0-9a-zA-Z]+"), "");

    for (var i = 0; i < cleanString.length; i++) {
      if (cleanString[i] != cleanString[cleanString.length - i - 1]) {
        return false;
      }
    }

    return true;
  }

  /// Checks if string is Currency.
  bool get isCurrency => hasMatch(
      r'^(S?\$|\₩|Rp|\¥|\€|\₹|\₽|fr|R\$|R)?[ ]?[-]?([0-9]{1,3}[,.]([0-9]{3}[,.])*[0-9]{3}|[0-9]+)([,.][0-9]{1,2})?( ?(USD?|AUD|NZD|CAD|CHF|GBP|CNY|EUR|JPY|IDR|MXN|NOK|KRW|TRY|INR|RUB|BRL|ZAR|SGD|MYR))?$');

  /// Checks if string is phone number.
  bool get isPhoneNumber {
    if (this.length > 16 || this.length < 9) return false;
    return hasMatch(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
  }

  /// Checks if string is email.
  bool get isEmail =>
      hasMatch(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  /// Checks if string is an html file.
  bool get isHTML => this.toLowerCase().endsWith(".html");

  /// Checks if string is an video file.
  bool get isVideo {
    var ext = this.toLowerCase();

    return ext.endsWith(".mp4") || ext.endsWith(".avi") || ext.endsWith(".wmv") || ext.endsWith(".rmvb") || ext.endsWith(".mpg") || ext.endsWith(".mpeg") || ext.endsWith(".3gp");
  }

  /// Checks if string is an audio file.
  bool get isAudio {
    final ext = this.toLowerCase();

    return ext.endsWith(".mp3") || ext.endsWith(".wav") || ext.endsWith(".wma") || ext.endsWith(".amr") || ext.endsWith(".ogg");
  }

  /// Checks if string is an image file.
  bool get isImage {
    final ext = this.toLowerCase();

    return ext.endsWith(".jpg") || ext.endsWith(".jpeg") || ext.endsWith(".png") || ext.endsWith(".gif") || ext.endsWith(".bmp");
  }

  bool hasMatch(String pattern) => RegExp(pattern).hasMatch(this);

  // Check if the string has any number in it, not accepting double, so don't
  // use "."
  bool isNumericOnly() => hasMatch(r'^\d+$');

  /// Checks if string consist only Alphabet. (No Whitespace)
  bool isAlphabetOnly() => hasMatch(r'^[a-zA-Z]+$');

  /// Checks if string contains at least one Capital Letter
  bool hasCapitalLetter() => hasMatch(r'[A-Z]');

  /// Checks if data is null or blank (empty or only contains whitespace).
  bool? isBlank() => _isEmpty(this);

  /// Checks if string is boolean.
  bool isBool() {
    if (isNull(this)) {
      return false;
    }

    return (this == 'true' || this == 'false');
  }

  Size get getTextSize {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: this),
      maxLines: 1,
    )..layout(
        minWidth: 0,
        maxWidth: double.infinity,
      );
    return textPainter.size;
  }

  // Will add new line if the sentence is bigger the 2 words.
  /// [afterWords] will add new line after the selected word
  /// Example
  /// 'Hi, my name is'.wrapString(2)
  ///
  /// will print:
  /// Hi, my
  /// name is

  String wrapString(int afterWords) {
    final wordsArr = this.split(' ');

    if (wordsArr.length > 2) {
      final int middle = this.indexOf(wordsArr[afterWords]) - 1;
      final prefix = this.substring(0, middle);
      final postfix = this.substring(middle + 1);
      return '$prefix\n$postfix';
    }

    return this;
  }

  bool validateEmail() {
    return hasMatch(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  }

  bool equalsIgnoreCase(String? other) => (other == null) || (this.toLowerCase() == other.toLowerCase());

  /// Return the string only if the delimiter exists in both ends, otherwise it will return the current string
  String? removeSurrounding(String delimiter) {
    final prefix = delimiter;
    final suffix = delimiter;

    if ((this.length >= prefix.length + suffix.length) && this.startsWith(prefix) && this.endsWith(suffix)) {
      return this.substring(prefix.length, this.length - suffix.length);
    }
    return this;
  }

  /// Return a bool if the string is null or empty
  bool get isEmptyOrNull => this.isEmpty;

  ///  Replace part of string after the first occurrence of given delimiter with the [replacement] string.
  ///  If the string does not contain the delimiter, returns [defaultValue] which defaults to the original string.
  String? replaceAfter(String delimiter, String replacement, [String? defaultValue]) {
    final index = this.indexOf(delimiter);
    return (index == -1)
        ? defaultValue.isEmptyOrNull
            ? this
            : defaultValue
        : this.replaceRange(index + 1, this.length, replacement);
  }

  ///
  /// Replace part of string before the first occurrence of given delimiter with the [replacement] string.
  ///  If the string does not contain the delimiter, returns [missingDelimiterValue?] which defaults to the original string.
  String? replaceBefore(String delimiter, String replacement, [String? defaultValue]) {
    final index = this.indexOf(delimiter);
    return (index == -1)
        ? defaultValue.isEmptyOrNull
            ? this
            : defaultValue
        : this.replaceRange(0, index, replacement);
  }

  ///Returns `true` if at least one element matches the given [predicate].
  /// the [predicate] should have only one character
  bool anyChar(bool predicate(String element)) => this.isEmptyOrNull ? false : this.split('').any((s) => predicate(s));

// if the string is empty perform an action
  String? ifEmpty(Function action) => this.isEmpty == true ? action() : this;

  String get lastIndex {
    if (isEmptyOrNull) return "";
    return this[this.length - 1];
  }

  /// prints to console this text if it's not empty or null
  void printThis() {
    if (isEmptyOrNull) return;
    print(toString());
  }

  /// Parses the string as an double or returns `null` if it is not a number.
  double toDouble() => double.tryParse(this) ?? 0;

  /// Parses the string as an int or returns `null` if it is not a number.
  int toInt() => int.tryParse(this) ?? 0;

  /// Returns a String without white space at all
  String removeAllWhiteSpace() => this.replaceAll(RegExp(r"\s+\b|\b\s"), "");

  /// Returns true if s is neither null, empty nor is solely made of whitespace characters.
  bool get isNotBlank => this.trim().isNotEmpty;

  /// Returns a list of chars from a String
  List<String> toCharArray() => isNotBlank ? this.split('') : [];

  /// Returns a new string in which a specified string is inserted at a specified index position in this instance.
  String insert(int index, String str) => (List<String>.from(this.toCharArray())..insert(index, str)).join();

  /// Indicates whether a specified string is `null`, `empty`, or consists only of `white-space` characters.
  bool get isNullOrWhiteSpace {
    var length = this.split('').where((x) => x == ' ').length;
    return length == this.length || this.isEmptyOrNull;
  }

  /// Shrink a string to be no more than [maxSize] in length, extending from the end.
  /// For example, in a string with 10 characters, a [maxSize] of 3 would return the last 3 charachters.
  String? limitFromEnd(int maxSize) => this.length < maxSize ? this : this.substring(this.length - maxSize);

  /// Shrink a string to be no more than [maxSize] in length, extending from the start.
  /// For example, in a string with 10 characters, a [maxSize] of 3 would return the first 3 charachters.
  String? limitFromStart(int maxSize) => this.length < maxSize ? this : this.substring(0, maxSize);

  /// Convert this string into boolean.
  ///
  /// Returns `true` if this string is any of these values: `"true"`, `"yes"`, `"1"`, or if the string is a number and greater than 0, `false` if less than 1. This is also case insensitive.
  bool get asBool {
    var s = this.trim().toLowerCase();
    num n;
    try {
      n = num.parse(s);
    } catch (e) {
      n = -1;
    }
    return s == 'true' || s == 'yes' || n > 0;
  }
}

extension StringCase on String {
  String toCamelCase() => ReCase(this).camelCase;

  String toConstantCase() => ReCase(this).constantCase;

  String toSentenceCase() => ReCase(this).sentenceCase;

  String toSnakeCase() => ReCase(this).snakeCase;

  String toDotCase() => ReCase(this).dotCase;

  String toParamCase() => ReCase(this).paramCase;

  String toPathCase() => ReCase(this).pathCase;

  String toPascalCase() => ReCase(this).pascalCase;

  String toHeaderCase() => ReCase(this).headerCase;

  String toTitleCase() => ReCase(this).titleCase;
}
