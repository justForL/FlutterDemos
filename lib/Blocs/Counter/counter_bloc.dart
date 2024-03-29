import 'package:bloc/bloc.dart';
import 'package:demo02/Blocs/Counter/index.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  @override
  get initialState => 0;

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    if (event == CounterEvent.Increment) {
      yield currentState + 1;
    } else if (event == CounterEvent.Decrement) {
      yield currentState - 1;
    }
  }
}
