import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_counter/bloc/counter_bloc.dart';
import 'package:flutter_bloc_counter/resources/custom_string.dart';
import 'package:flutter_bloc_counter/resources/custom_theme.dart';
import 'package:flutter_bloc_counter/resources/custom_widget.dart';
import 'package:flutter_bloc_counter/state/counter_state.dart';
import 'package:flutter_bloc_counter/ui/confirm.dart';

class BlocPage extends StatelessWidget {
  final ThemeData _customTheme = CustomTheme.getInstance().customTheme;
  final String _title = CustomString.getInstance().blocBtnTitle;

  @override
  Widget build(BuildContext context) {
    final _bloc = CounterBloc();

    return MaterialApp(
      title: _title,
      theme: _customTheme,
      home: Scaffold(
        appBar:
            CustomWidget.getInstance().mainAppBarWidget(_title, _customTheme),
        body: BlocBuilder(
          bloc: _bloc,
          builder: (context, CounterState counterState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '${counterState.current}',
                    style: Theme.of(context).textTheme.display1,
                  ),
                  SizedBox(height: 10.0),
                  RaisedButton(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Submit'),
                      onPressed: () {
                        navigatorPages(context, counterState);
                      }),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () {
                            _bloc.onInc();
                          }, //_incrementCounter(_model),
                          child: Icon(Icons.add),
                        ),
                        Spacer(),
                        RaisedButton(
                          onPressed: () {
                            _bloc.onDec();
                          }, //_decrementCounter(_model),
                          child: Icon(Icons.remove),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Future navigatorPages(BuildContext context, CounterState state) async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BlocConfirm(
                  counterState: state,
                )));
  }
}
