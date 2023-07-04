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

extension GestureDetectorExtensions on Widget {
  Widget get onTapAddJumpEffect => TranslateOnClick(child: this);

  Widget onTap(Function() function) => GestureDetector(onTap: function, child: this);

  Widget onDoubleTap(Function() function) => GestureDetector(onDoubleTap: function, child: this);

  Widget onLongPress(Function() function) => GestureDetector(onLongPress: function, child: this);
}
