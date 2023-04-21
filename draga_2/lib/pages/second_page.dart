import 'package:draga_2/create_widget.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late Widget w;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'MyApp',
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: Center(child: w),
    );
  }

  @override
  void initState() {
    setState(() {
      w = CreateWidget.getColumn('table', context);
    });
    super.initState();
  }
}
