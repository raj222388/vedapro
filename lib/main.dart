import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MyProvider(),
      child: MaterialApp(
        title: 'Dependency Injection Demo',
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')), 
      body: Center(
        child: Text('Value: ${provider.value}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => provider.increment(),
        child: Icon(Icons.add),
      ),
    );
  }
}

class MyProvider with ChangeNotifier {
  int _value = 0;
  int get value => _value;

  void increment() {
    _value++;
    notifyListeners();
  }
}