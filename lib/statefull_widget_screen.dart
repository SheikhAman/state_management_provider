import 'package:flutter/material.dart';

class StateFulwidget extends StatefulWidget {
  const StateFulwidget({super.key});

  @override
  State<StateFulwidget> createState() => _StateFulwidgetState();
}

class _StateFulwidgetState extends State<StateFulwidget> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('StateFull Widget'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(DateTime.now().toString()),
          Container(
            child: Center(
              child: Text(
                count.toString(),
                style: const TextStyle(fontSize: 50),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          count++;
          print(count);
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
