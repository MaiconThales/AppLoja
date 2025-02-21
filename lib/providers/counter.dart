import 'package:flutter/cupertino.dart';

// ignore: slash_for_doc_comments
/**
 * CLASSE APENAS PARA TESTE, FOI NECESSÁRIO COLOCAR TODA A APLIÇÃO DENTRO DELE.
 * PARA QUE POSSA SER ACESSADO POR TODOS.
 */

class CounterState {
  int _value = 0;

  void inc() => _value++;

  void desc() => _value--;

  int get value => _value;

  bool diff(CounterState old) {
    return old.value != _value;
  }
}

class CounterProvider extends InheritedWidget {
  final CounterState state = CounterState();

  CounterProvider({
    super.key,
    required super.child,
  });

  static CounterProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>();
  }

  @override
  bool updateShouldNotify(covariant CounterProvider oldWidget) {
    return oldWidget.state.diff(state);
  }
}
