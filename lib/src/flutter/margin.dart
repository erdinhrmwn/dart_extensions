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

extension MarginExtensions<T extends Container> on T {
  T marginAll(double value) => this.copyWith(margin: EdgeInsets.all(value)) as T;

  T marginLTRB(
    double left,
    double top,
    double right,
    double bottom,
  ) =>
      this.copyWith(
        margin: EdgeInsets.fromLTRB(
          left,
          top,
          right,
          bottom,
        ),
      ) as T;

  T marginSymmetric({double v = 0.0, double h = 0.0}) => this.copyWith(
        margin: EdgeInsets.symmetric(
          vertical: v,
          horizontal: h,
        ),
      ) as T;

  T marginOnly({
    double left = 0.0,
    double right = 0.0,
    double top = 0.0,
    double bottom = 0.0,
  }) =>
      this.copyWith(
        margin: EdgeInsets.only(
          left: left,
          right: right,
          top: top,
          bottom: bottom,
        ),
      ) as T;
}
