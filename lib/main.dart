import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Scanner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'QR Scanner'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _result;

  Future<void> _scanQR() async {
    final result = await scanner.scan();
    setState(() {
      _result = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: _result != null
            ? Text('Result: $_result')
            : Text('Press the button to scan a QR code'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _scanQR,
        tooltip: 'Scan',
        child: Icon(Icons.qr_code_scanner),
      ),
    );
  }
}
