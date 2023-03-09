import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_is_awesome/flutter_is_awesome.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Trap',
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map _contact = {};
  Future<void> requestPermission() async {
    final status = await Permission.contacts.request();

    print(status);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter is '),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.red,
              textColor: Colors.white,
              child: Text('Picker'),
              onPressed: () => _getAContact(),
            ),
          ],
        ),
      ),
    );
  }

  _getAContact() async {
    Map contact;
    try {
      contact = await FlutterIsAwesome.getAContact();
    } on PlatformException {
      contact = {};
    }
    if (!mounted) return;
    setState(() {
      print(contact);
      _contact = contact;
    });
  }
}
