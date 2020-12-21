import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/screens/home/todo_tile.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {

    final todos = Provider.of<List<Todo>>(context) ?? [];
    if ( todos.length == 0){
      return Text(
                'You havent added any todo yet!!!',
              style: TextStyle(
                fontSize: 20.0,
              ),
          );
    }
    else{
      return ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return TodoTile(todo: todos[index]);
        },
      );
    }

  }
}