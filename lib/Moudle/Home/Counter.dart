import 'package:demo02/Blocs/Counter/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildContent(context);
  }

  Widget _buildContent(BuildContext context) {
    final CounterBloc _bloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("CountDemo"),
      ),
      body: BlocBuilder<CounterBloc, int>(
        bloc: _bloc,
        builder: (context, count) {
          return Center(
            child: Text('$count'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _bloc.dispatch(CounterEvent.Increment);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

void main() => runApp(CounterDemo());
