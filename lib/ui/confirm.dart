import 'package:flutter/material.dart';
import 'package:flutter_bloc_counter/resources/custom_string.dart';
import 'package:flutter_bloc_counter/resources/custom_theme.dart';
import 'package:flutter_bloc_counter/resources/custom_widget.dart';
import 'package:flutter_bloc_counter/state/counter_state.dart';
import 'package:flutter_bloc_counter/ui/detail.dart';

class BlocConfirm extends StatelessWidget {
  final CounterState counterState;

  BlocConfirm({this.counterState});

  final ThemeData _customTheme = CustomTheme.getInstance().customTheme;
  final String _title =
      "${CustomString.getInstance().blocBtnTitle} ${CustomString.getInstance().confirmTitle} ";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: _customTheme,
      home: Scaffold(
        appBar: CustomWidget.getInstance()
            .secondaryAppBarWidget(context, _title, _customTheme),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Your counter value is: ${counterState.current}',
                style: TextStyle(fontSize: 18.0),
              ),
              RaisedButton(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Confirm'),
                  onPressed: () {
                    navigatorPages(context, counterState);
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Future navigatorPages(BuildContext context, CounterState state) async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BlocDetail(
                  counterState: state,
                )));
  }
}
