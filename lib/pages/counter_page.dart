import 'package:app_loja/providers/counter.dart';
import 'package:flutter/material.dart';

import '../utils/custom_app_bar.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Exemplo contator",
        fontColor: Colors.white,
        fontSize: 20,
        viewDrawerIcon: true,
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(CounterProvider.of(context)?.state.value.toString() ?? '0'),
          IconButton(
            onPressed: () {
              setState(() {
                CounterProvider.of(context)?.state.inc();
              });
            },
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                CounterProvider.of(context)?.state.desc();
              });
            },
            icon: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
