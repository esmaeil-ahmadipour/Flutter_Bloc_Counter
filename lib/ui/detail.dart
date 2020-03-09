import 'package:flutter/material.dart';
import 'package:flutter_bloc_counter/resources/custom_string.dart';
import 'package:flutter_bloc_counter/resources/custom_theme.dart';
import 'package:flutter_bloc_counter/resources/custom_widget.dart';
import 'package:flutter_bloc_counter/state/counter_state.dart';


class BlocDetail extends StatelessWidget {
  final CounterState counterState;

  BlocDetail({this.counterState});

  final ThemeData _customTheme = CustomTheme.getInstance().customTheme;
  final String _title =
      "${CustomString.getInstance().blocBtnTitle} ${CustomString.getInstance().detailTitle} ";

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: _title,
      theme: _customTheme,
      home: Scaffold(
        appBar: CustomWidget.getInstance().secondaryAppBarWidget(context,_title,_customTheme),
        body: Center(
          child: Text(
            '${counterState.current}',
            style: TextStyle(fontSize: 80.0),
          ),
        ),
      ),
    );
  }
}
