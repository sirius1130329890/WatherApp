import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'future/controller/controller.dart';
import 'future/page/search.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Controller>(
      create: (context) => Controller(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Search(),
      ),
    );
  }
}