import 'package:demo02/Blocs/Weather/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherDemo extends StatefulWidget {
  const WeatherDemo({Key key}) : super(key: key);
  @override
  _WeatherDemoState createState() => _WeatherDemoState();
}

class _WeatherDemoState extends State<WeatherDemo> {
  TextEditingController _controller;
  FocusNode _node;
  WeatherBloc _bloc;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _node = FocusNode();
    _bloc = WeatherBloc();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("TimerDemo"),
        ),
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _node.unfocus();
      },
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            _buildTopRow(context),
            _buildTextInput(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTopRow(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      bloc: _bloc,
      builder: (context, state) {
        if (state is InitState) {
          return _buildInitState();
        } else if (state is LoadState) {
          return _buildLoading();
        } else {
          return _buildContent(state);
        }
      },
    );
  }

  Widget _buildInitState() {
    return Container(
      child: Text("james111"),
    );
  }

  Widget _buildLoading() {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildContent(WeatherState state) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 30, 0, 30),
      child: Column(
        children: <Widget>[
          Center(
            child: Text(
              state.cityName,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "30",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "°",
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _submitAction(String text) {
    _bloc.dispatch(GetWeather(cityName: text));
  }

  Widget _buildTextInput(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
        child: Center(
          child: TextField(
            controller: _controller,
            focusNode: _node,
            textInputAction: TextInputAction.done,
            onSubmitted: _submitAction,
            decoration: InputDecoration(
              hintText: "test",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
              contentPadding: EdgeInsets.all(10),
            ),
          ),
        ));
  }
}

void main() => runApp(WeatherDemo());
