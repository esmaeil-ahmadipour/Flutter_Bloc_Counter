import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_counter/event/counter_event.dart';
import 'package:flutter_bloc_counter/state/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  void onInc() {
    dispatch(Increment());
  }

  void onDec() {
    dispatch(Decrement());
  }

  @override
  // TODO: implement initialState
  CounterState get initialState => CounterState();

  @override
  Stream<CounterState> mapEventToState(
      CounterState currentState, CounterEvent event) async* {
    // After Call Any Event , Run This Method. We Can Management Events.
    if (event is Increment) {
      yield currentState..current += 1;
    } else if (event is Decrement) {
      yield currentState..current -= 1;
    }
  }
}
