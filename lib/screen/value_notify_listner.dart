import 'package:flutter/material.dart';
import 'package:statepract_1/stateless_widget_screen.dart';

class NotifyListerScreen extends StateLessWidget {
  NotifyListerScreen({super.key});

  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  final ValueNotifier<bool> _toggle = ValueNotifier<bool>(false);

  Widget build(BuildContext context) {
    print('build');

    return Scaffold(
      appBar: AppBar(
        title: const Text('NotifyListener Screen'),
      ),
      body: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: _toggle,
            builder: (context, value, child) {
              return TextFormField(
                obscureText: _toggle.value,
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: InkWell(
                    onTap: () {
                      _toggle.value = !_toggle.value;
                    },
                    child: Icon(
                      _toggle.value
                          ? Icons.visibility_off_sharp
                          : Icons.visibility,
                    ),
                  ),
                ),
              );
            },
          ),
          Center(
            child: ValueListenableBuilder(
              valueListenable: _counter,
              builder: (context, value, child) {
                return Text(
                  _counter.value.toString(),
                  style: const TextStyle(fontSize: 50),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
          print(_counter.value.toString());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
