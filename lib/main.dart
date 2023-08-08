import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled3/controller/counter_provider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  final int _counter = 0;

  @override
  Widget build(BuildContext context, ref) {
    final counterLogic = ref.read(counterProviderScreen);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: InkWell(onTap: counterLogic.incrementAll,child: const Text('Flutter Demo Home Page')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: counterLogic.increment2,
              child: const Text(
                'You have pushed the button this many times:',
              ),
            ),
            Consumer(
              builder: (context, ref, child) {
                final counter = ref.watch(counterLogic.counter.provider);
                log('counter: $counter', name: 'counter');
                return Text(
                  counter.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                final counter = ref.watch(counterLogic.counter2.provider);
                log('counter2: $counter', name: 'counter');
                return Text(
                  counter.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counterLogic.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
