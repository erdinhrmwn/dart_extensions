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

extension ContainerExtensions<T extends Container> on T {
  Container copyWith({
    Key? key,
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    Color? color,
    Decoration? decoration,
    Decoration? foregroundDecoration,
    double? width,
    double? height,
    BoxConstraints? constraints,
    EdgeInsetsGeometry? margin,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    Widget? child,
    Clip? clipBehavior,
  }) =>
      Container(
        key: key ?? this.key,
        child: child ?? this.child,
        alignment: alignment ?? this.alignment,
        padding: padding ?? this.padding,
        color: color ?? this.color,
        decoration: decoration ?? this.decoration,
        foregroundDecoration: foregroundDecoration ?? this.foregroundDecoration,
        constraints: constraints ?? this.constraints,
        margin: margin ?? this.margin,
        transform: transform ?? this.transform,
        transformAlignment: transformAlignment ?? this.transformAlignment,
        clipBehavior: clipBehavior ?? this.clipBehavior,
      );

  ///  Add background color to a Container
  T withBackgroundColor({required Color color}) => this.copyWith(
        decoration: ((this.decoration as BoxDecoration?) ?? BoxDecoration()).copyWith(
          color: color,
        ),
      ) as T;

  ///  Add round corners to a Container
  T withRoundCorners({double radius = 25}) => this.copyWith(
        decoration: ((this.decoration as BoxDecoration?) ?? BoxDecoration()).copyWith(
          borderRadius: BorderRadius.circular(radius),
        ),
      ) as T;

  ///  Add border to a Container
  ///  if the Container already has a color use [backgroundColor] instead and remove the
  ///  [Color] from the Container it self
  T withBorder({BoxBorder? border}) => this.copyWith(
        decoration: ((this.decoration as BoxDecoration?) ?? BoxDecoration()).copyWith(
          border: border,
        ),
      ) as T;

  /// A shadow cast by a box
  ///
  /// [shadowColor]
  T withShadow({
    Color shadowColor = Colors.grey,
    double blurRadius = 20.0,
    double spreadRadius = 1.0,
    Offset offset = const Offset(10.0, 10.0),
  }) =>
      this.copyWith(
        decoration: ((this.decoration as BoxDecoration?) ?? BoxDecoration()).copyWith(
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              blurRadius: blurRadius,
              spreadRadius: spreadRadius,
              offset: offset,
            ),
          ],
        ),
      ) as T;
}
