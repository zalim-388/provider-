import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class CounterModel with ChangeNotifier {
  int _count = 0;
  int get count => _count;
  void Increment() {
    _count++;
    notifyListeners();
  }

  void Decrement() {
    _count--;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
