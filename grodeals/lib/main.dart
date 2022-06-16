import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:grodeals/widgets/customappbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'GroDeals',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: const Scaffold(
            appBar: CustomAppBar(
              height: 50,
            ),
            body: Center(
              child: RandomWords(),
            )));
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.00),
      itemBuilder: (context, i) {
        if (i.isOdd) return const Divider();

        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return Text(_suggestions[index].asPascalCase, style: _biggerFont);
      },
    );
  }
}
