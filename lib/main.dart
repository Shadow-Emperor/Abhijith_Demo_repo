import 'package:flutter/material.dart';
import 'package:userprofile/routes/routes.dart';
import 'package:userprofile/screen/HomeScreen.dart';

void main() async {
  String mainRoute = HomeScreen.routeName;
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: mainRoute,
      onGenerateRoute: AppRouter().generateRoute,
    ),
  );
}
