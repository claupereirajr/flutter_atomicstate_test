import 'package:flutter/material.dart';
import 'package:flutter_atomicstate_test/reducers/counter_reducer.dart';
import 'package:flutter_atomicstate_test/states/states.dart';
import 'package:rx_notifier/rx_notifier.dart';

void main() {
  CounterReducer();
  runApp(const RxRoot(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final counter = context.select(() => counterState.value);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        children: [
          FloatingActionButton(
            onPressed: incrementAction,
            tooltip: 'Increment',
            child: const Icon(Icons.arrow_drop_up),
          ),
          FloatingActionButton(
            onPressed: decrementAction,
            tooltip: 'Decrement',
            child: const Icon(Icons.arrow_drop_down),
          ),
        ],
      ),
    );
  }
}
