import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../model/todo.dart';

class LocalSave extends StatefulWidget {
  const LocalSave({Key? key}) : super(key: key);

  @override
  State<LocalSave> createState() => _LocalSaveState();
}

class _LocalSaveState extends State<LocalSave> {
  List<TodoModel> todoList = [];

  Future<List<TodoModel>> getModel() async {
    List<TodoModel> t = [];
    var pref = await SharedPreferences.getInstance();
    await pref.reload();

    List<String>? data = pref.getStringList('localSaves');
    if (data != null) {
      t = data
          .map((e) => jsonDecode(e))
          .toList()
          .map((e) => TodoModel.fromJson(e))
          .toList();
      todoList = t;
      return t;
    } else {
      return t;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<TodoModel>>(
        future: getModel(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].title),
                  subtitle: Text(snapshot.data![index].msg),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () async {
                            try {
                              Supabase.instance.client
                                  .from('todo_list')
                                  .insert(snapshot.data![index].toJson());
                            } catch (e) {
                              print(e);
                            }
                          },
                          icon: Icon(Icons.cloud),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Center(child: CupertinoActivityIndicator());
        },
      ),
    );
  }
}
