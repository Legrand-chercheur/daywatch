import 'package:daywatch/Acceuil.dart';
import 'package:flutter/material.dart';

import 'Bottom_bar.dart';
import 'Connexion.dart';
import 'details_films.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Connexion(),
    );
  }
}

