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
      title: 'Futures2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyFuturesPage(),
    );
  }
}

class MyFuturesPage extends StatefulWidget {
  const MyFuturesPage({super.key});

  @override
  State<MyFuturesPage> createState() => _MyFuturesPageState();
}

class _MyFuturesPageState extends State<MyFuturesPage> {
  String message = 'Heute scheint die Sonne';
  List<String> text = ['Text 1', 'Text 2', 'Text 3'];
  List<String> images = ['Image 1', 'Image 2', 'Image 3'];

  Future<void> delayedMessage() async {
    await Future.delayed(const Duration(seconds: 2));
    debugPrint(message);
    setState(() {
      message = 'Heute scheint die Sonne';
    });
  }

  Future<void> myText() async {
    await Future.delayed(const Duration(seconds: 3));
    debugPrint(text.toString());
    setState(() {
      text = ['Text 1', 'Text 2', 'Text 3'];
    });
  }

  Future<void> myImages() async {
    await Future.delayed(const Duration(seconds: 5));
    debugPrint(images.toString());
    setState(() {
      images = ['Image 1', 'Image 2', 'Image 3'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Futures2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: delayedMessage,
              child: const Text('Klick mich!'),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: myText,
              child: const Text('Texte ausgeben'),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: myImages,
              child: const Text('Images ausgeben'),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
