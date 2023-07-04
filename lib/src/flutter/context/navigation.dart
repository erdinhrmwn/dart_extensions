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

extension NavigationExtensions on BuildContext {
  /// Navigate to another widget
  Future<T?> push<T>(
    Widget route, {
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) =>
      Navigator.of(this).push(
        MaterialPageRoute(
          builder: (c) => route,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
        ),
      );

  /// Navigate to widget by the route name
  Future<T?> pushNamed<T>(String routeName, {Object? args}) => Navigator.of(this).pushNamed(routeName, arguments: args);

  /// Navigate to another widget and replace remove the current one
  Future<T?> pushReplacement<T>(
    Widget route, {
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) =>
      Navigator.of(this).pushReplacement(
        MaterialPageRoute(
          builder: (c) => route,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
        ),
      );

  /// Navigate to another widget and replace remove the current one by the route name
  Future<T?> pushReplacementNamed<T>(String routeName, {Object? args}) => Navigator.of(this).pushReplacementNamed(routeName, arguments: args);

  /// Navigate to another widget with predicate
  Future<T?> pushUntil<T>(
    Widget route, {
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
    bool routes = false,
  }) =>
      Navigator.of(this).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => route,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
        ),
        (Route<dynamic> route) => routes,
      );

  /// Pop current route
  void back<T>([T? result]) => Navigator.of(this).pop(result);

  /// Pop current route until the given route
  void popUntil<T>(String routeName) => Navigator.of(this).popUntil(ModalRoute.withName(routeName));

  /// Check if current route can pop
  bool canPop() => Navigator.of(this).canPop();
}
