import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/user.dart';
import 'package:todo_app/services/database.dart';
import 'package:todo_app/shared/constants.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();

  // form values
  String _currentTask;

  @override
  Widget build(BuildContext context) {

    User user = Provider.of<User>(context);

    return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    'Add your todo here.',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    initialValue: '',
                    decoration: textInputDecoration,
                    validator: (val) => val.isEmpty ? 'Please enter your todo task' : null,
                    onChanged: (val) => setState(() => _currentTask = val),
                  ),
                  SizedBox(height: 10.0),

                  RaisedButton(
                      color: Colors.blueAccent,
                      child: Text(
                        'Add',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if(_formKey.currentState.validate()){
                          await DatabaseService(uid: user.uid).addTodo(
                              _currentTask
                          );
                          Navigator.pop(context);
                        }
                      }
                  ),
                ],
              ),
            );

  }
}