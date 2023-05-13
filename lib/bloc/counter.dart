import 'package:flutter_bloc/flutter_bloc.dart';

enum CounterEvent {
  Increment,
  Decrement,
  Reset,
}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0);

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.Increment:
        yield state + 1;
        break;

      case CounterEvent.Decrement:
        yield state - 1;
        break;

      case CounterEvent.Reset:
        yield state * 0 + 0;
        break;
    }
  }
}
