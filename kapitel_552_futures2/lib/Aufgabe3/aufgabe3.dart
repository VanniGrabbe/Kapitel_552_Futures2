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
  String message = '';
  List<String> text = [''];
  List<String> images = [''];

  var test = 
    Future.delayed(const Duration(seconds: 2), () => 'Heute scheint die Sonne');
    

  var myText =
     Future.delayed(const Duration(seconds: 3), () => ['Text 1', 'Text 2', 'Text 3']);
    

  var myImages = 
    Future.delayed(const Duration(seconds: 5), () => ['Image 1', 'Image 2', 'Image 3']);
    

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
            FutureBuilder(
              future: test,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text('${snapshot.data}');
                } else if (snapshot.hasError) {
                  return const Text('Es ist ein Fehler aufgetreten');
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            ElevatedButton(
              onPressed: (){},
              child: const Text('Klick mich!'),
            ),
            const SizedBox(
              height: 30,
            ),
            FutureBuilder(
              future: myText,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text('${snapshot.data}');
                } else if (snapshot.hasError) {
                  return const Text('Es ist ein Fehler aufgetreten');
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            ElevatedButton(
              onPressed: (){},
              child: const Text('Texte ausgeben'),
            ),
            const SizedBox(
              height: 30,
            ),
            FutureBuilder(
              future: myImages,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text('${snapshot.data}');
                } else if (snapshot.hasError) {
                  return const Text('Es ist ein Fehler aufgetreten');
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            ElevatedButton(
              onPressed: (){},
              child: const Text('Images ausgeben'),
            ),
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
