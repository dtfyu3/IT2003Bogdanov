import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Инкремент',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Инкремент'),
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
  int _counter = 0;

 void _clearCounter(){
  setState(() {
    _counter = 0;
  });
 }
 void _decrementCounter(){
  setState(() {
    _counter--;
  });
 }
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    final style = ButtonStyle(
      foregroundColor: MaterialStateProperty.all(Colors.grey),
    );
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Text('Значение икремента'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    ElevatedButton(
                       style: ButtonStyle(
                      backgroundColor:MaterialStateProperty.all(Colors.red),
                    ),
                    onPressed: _decrementCounter, 
                    child: Text('-')
                    ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:MaterialStateProperty.all(Colors.green),
                      
                    ),
                    onPressed: _incrementCounter, 
                    child: Text('+')
                    ),
                ],
              ),
               SizedBox(
                height: 10,
              ),
              TextButton(
                style: style,
                onPressed: _clearCounter, 
                child: Text('Сбросить'),
                ),
          ], 
        ),
      ),
    );
  }
}
