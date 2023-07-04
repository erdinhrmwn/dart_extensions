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

import 'dart:async';
import 'dart:collection';
import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart' as intl;
import 'package:path/path.dart' as p;
import 'package:quiver/iterables.dart';
import 'package:recase/recase.dart';
import 'package:timeago/timeago.dart' as timeago;

part './src/data_structures/stack.dart';
part './src/date.dart';
part './src/duration.dart';
part './src/equality.dart';
part './src/exceptions/range_exception.dart';
part './src/files.dart';
part './src/flutter/align.dart';
part './src/flutter/button.dart';
part './src/flutter/center.dart';
part './src/flutter/container.dart';
part './src/flutter/context/context.dart';
part './src/flutter/context/navigation.dart';
part './src/flutter/context/theme.dart';
part './src/flutter/gesture_detector.dart';
part './src/flutter/icon.dart';
part './src/flutter/list.dart';
part './src/flutter/margin.dart';
part './src/flutter/padding.dart';
part './src/flutter/responsive.dart';
part './src/flutter/sized_box.dart';
part './src/flutter/text.dart';
part './src/flutter/transforms.dart';
part './src/flutter/transforms/click_translate.dart';
part './src/flutter/widgets.dart';
part './src/http.dart';
part './src/iterable.dart';
part './src/map.dart';
part './src/num.dart';
part './src/ranges.dart';
part './src/search_algorithms.dart';
part './src/sort_algorithms.dart';
part './src/string_ext.dart';
