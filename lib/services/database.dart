import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/models/todo.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference todoCollection = Firestore.instance.collection('todos');



  //add todo
  Future<void> addTodo(String task ) async {

    return await todoCollection.add({
      'task' : task,
      'completed': 'no',
      'user_id': uid,
    });
  }

  Future<void> deleteTodo(String toid) async {

    return await todoCollection.document(toid).delete();
  }

  Future<void> updateTodo(String toid ) async {

    return await todoCollection.document(toid).updateData({
      'completed': 'yes'
    });
  }

  List<Todo> _todoListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      //print(doc.data);
      return Todo(
          tid: doc.documentID,
          task: doc.data['task'] ?? '',
          completed: doc.data['completed'] ?? '',
          user_id: doc.data['user_id'] ?? '',
      );
    }).toList();
  }




  Stream<List<Todo>> get todos {
    return todoCollection.snapshots()
        .map(_todoListFromSnapshot);
  }



}