import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(TextFieldDemo());

class TextFieldDemo extends StatefulWidget {
  @override
  State createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  TextEditingController _nameController, _pwController;
  FocusNode _nameFocus;
  FocusNode _pwFocus;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("TextFieldDemo")),
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              const SizedBox(height: 80),
              Center(
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 32.0),
                ),
              ),
              const SizedBox(
                height: 80.0,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Material(
                  borderRadius: BorderRadius.circular(16.0),
                  child: TextField(
                    focusNode: _nameFocus,
                    controller: _nameController,
                    obscureText: false,
                    textInputAction: TextInputAction.next,
                    onSubmitted: (input) {
                      _nameFocus.unfocus();
                      FocusScope.of(context).requestFocus(_pwFocus);
                    },
                    decoration: InputDecoration(labelText: "name"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Material(
                  borderRadius: BorderRadius.circular(10.0),
                  child: TextField(
                    focusNode: _pwFocus,
                    controller: _pwController,
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (input) {
                      _pwFocus.unfocus();
                    },
                    decoration: InputDecoration(labelText: "password"),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ButtonBar(
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      print("LoginBtn click");
                    },
                    child: Text("Login"),
                    color: Colors.white,
                  )
                ],
              )
            ],
          ),
        ));
  }
}
