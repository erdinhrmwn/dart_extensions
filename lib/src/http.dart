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

const _defaultHeaders = {"Content-Type": "application/json"};

extension HttpExtensions on String {
  /// Sends an HTTP GET request with the given headers to the given URL, which can
  /// be a [Uri] or a [String].
  /// [endPoint] - end point of current url
  /// example:
  /// current string is www.mydomain.com
  /// endpoint param - user
  /// result request -> www.mydomain.com/user
  Future<http.Response> httpGet(String endPoint) async {
    assert(!endPoint.isEmptyOrNull, 'Endpoint cannot be empty.');

    try {
      return await http.get(Uri.https(this, endPoint));
    } on Exception catch (e) {
      return Future.error(e);
    }
  }

  /// Sends an HTTP POST request with the given headers and body to the given URL,
  /// which can be a [Uri] or a [String].
  /// [endPoint] - end point of current url
  /// example:
  /// current string is www.mydomain.com
  /// endpoint param - user
  /// result request -> www.mydomain.com/user
  Future<http.Response> httpPost(String endPoint, Object? json, [Map<String, String> headers = _defaultHeaders]) async {
    try {
      return await http.post(Uri.https(this, endPoint), headers: headers, body: json);
    } on Exception catch (e) {
      return Future.error(e);
    }
  }

  /// Sends an HTTP PUT request with the given headers and body to the given URL,
  /// which can be a [Uri] or a [String].
  /// [endPoint] - end point of current url
  /// example:
  /// current string is www.mydomain.com
  /// endpoint param - user
  /// result request -> www.mydomain.com/user
  Future<http.Response> httpPut(String endPoint, Object? json, [Map<String, String> headers = _defaultHeaders]) async {
    assert(!endPoint.isEmptyOrNull, 'Endpoint cannot be empty.');

    try {
      return await http.put(Uri.https(this, endPoint), headers: headers, body: json);
    } on Exception catch (e) {
      return Future.error(e);
    }
  }

  /// Sends an HTTP DELETE request with the given headers to the given URL, which
  /// can be a [Uri] or a [String].
  /// [endPoint] - end point of current url
  /// example:
  /// current string is www.mydomain.com
  /// endpoint param - user
  /// result request -> www.mydomain.com/user
  Future<http.Response> httpDelete(String endPoint, [Map<String, String> headers = _defaultHeaders]) async {
    assert(!endPoint.isEmptyOrNull, 'Endpoint cannot be empty.');

    try {
      return await http.delete(Uri.https(this, endPoint), headers: headers);
    } on Exception catch (e) {
      return Future.error(e);
    }
  }
}
