import 'package:bubbles/core/enum.dart';
import 'package:bubbles/views/screens/chat_view/widgets/chat_item.widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bubble Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Text Bubble Demo'),
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
  List messages = [
    {'text': "Willkommen bei Diadic", 'role': DiadicRole.diadic},
    {'text': "Wie gehts?", 'role': DiadicRole.user},
    {'text': "Muss ja", 'role': DiadicRole.partner},
    {'text': "Das stimmt", 'role': DiadicRole.user},
    {
      'text': '''Wie man so schön sagt:
      Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ''',
      'role': DiadicRole.user
    },
    {'text': "Du mich auch", 'role': DiadicRole.partner},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: ListView.builder(
          itemCount: messages.length,
          itemBuilder: ((context, index) {
            return ChatItemWidget(
                text: messages[index]['text'], role: messages[index]['role']);
          }),
        )));
  }
}
