import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/services/database.dart';

class TodoTile extends StatelessWidget {

  final Todo todo;
  TodoTile({ this.todo });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        color: (todo.completed == 'yes') ?Colors.orange : Colors.white,
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.blueAccent
          ),
          title: Text('${todo.task}',style: TextStyle(color: Colors.black87, fontSize: 30.0)),
          subtitle: (todo.completed == 'yes') ? Text('Completed the task'):Text('not completed'),
          trailing: (todo.completed == 'yes') ?
                RaisedButton(
                    color: Colors.red,
                    child: Text(
                      'delete',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {

                      await DatabaseService().deleteTodo(todo.tid);

                    }
                )
              : RaisedButton(
              color: Colors.pink[400],
              child: Text(
                'complete?',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {

                await DatabaseService().updateTodo(todo.tid);

              }
          ),
        ),
      ),
    );
  }
}


// Card(
// margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
// child: ListTile(
// title: Text(todo.task),
// subtitle: Text('${todo.completed} '),
// ),
// ),
// );


// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: <Widget>[
// Text('${todo.task}',style: TextStyle(color: Colors.black87, fontSize: 30.0),
// ),
//
// SizedBox(width: 70.0,),
// RaisedButton(
// color: Colors.pink[400],
// child: Text(
// 'complete?',
// style: TextStyle(color: Colors.white),
// ),
// onPressed: () async {
//
// await DatabaseService().updateTodo(todo.tid);
//
// }
// ),
// SizedBox(width: 10.0,),
// RaisedButton(
// color: Colors.pink[400],
// child: Text(
// 'delete',
// style: TextStyle(color: Colors.white),
// ),
// onPressed: () async {
//
// await DatabaseService().deleteTodo(todo.tid);
//
// }
// ),
//
//
//
// ],
// )