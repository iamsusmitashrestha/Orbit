import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:orbit/core/di/injection.dart';

import 'core/routes/auto_router.gr.dart';

void main() async {
  await GetStorage.init();
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: AutoRouter(),
    );
  }
}
