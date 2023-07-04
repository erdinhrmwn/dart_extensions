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
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {"/login": (_) => Login()},
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Home(),
    );
  }
}

class Routes {
  static final login = "/login";
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    print([1, 2, 3, 4].mapList((f) => f.toDouble()));
    return Scaffold(
      body: Container(
        height: 100,
        width: 100,
      )
          .withBackgroundColor(color: Colors.grey)
          .withBorder(border: Border.all(color: Colors.black, width: 1.0))
          .withRoundCorners()
          .withShadow()
          .alignAtCenter()
          .toCenter()
          .paddingOnly(left: 10)
          .paddingAll(20)
          .onTap(
            () async {
              final result = await context.pushNamed(Routes.login);
              print(result);
            },
          )
          .withTooltip('just a tooltip')
          .onLongPress(() => print('long press')),
    );
  }
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        child: Text('Go Back'),
        onPressed: () => context.back(),
      ).toCenter(),
    ).withBackgroundColor(color: Colors.blueGrey);
  }
}
