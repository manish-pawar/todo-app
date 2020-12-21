
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/screens/home/settings_form.dart';
import 'package:todo_app/screens/home/todo_list.dart';
import 'package:todo_app/services/auth.dart';
import 'package:todo_app/models/todo.dart';


import 'package:todo_app/services/database.dart';class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          color: Colors.amber[50],
          child: SettingsForm(),
        );
      });
    }

    return StreamProvider<List<Todo>>.value(
      value: DatabaseService().todos,
      child: Scaffold(
        backgroundColor: Colors.orange[50],
        appBar: AppBar(
          title: Text('Your todos'),
          backgroundColor: Colors.orange,
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.add_circle, color: Colors.white,),
              label: Text(
                  'Add todo',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () => _showSettingsPanel(),
            )
          ],
        ),
        body: TodoList()

      ),
    );
  }
}