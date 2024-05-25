import 'package:flutter/material.dart';
import 'package:todo_app/add_todo.dart';
import 'package:todo_app/edit_todo.dart';
import 'package:todo_app/functions.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'TODO LIST',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
        ),
        backgroundColor: Colors.grey,
      ),
      body: SafeArea(
          child: RefreshIndicator(
              child: ValueListenableBuilder(
                  valueListenable: apinotifier,
                  builder: (ctx, item, child) {
                    final values = item.toList();
                    if (values.isEmpty) {
                      const Center(
                        child: Text(
                          'No Data',
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }
                    return ListView.builder(
                        itemCount: values.length,
                        itemBuilder: (ctx, index) {
                          final data = values[index] as Map;
                          final id = data['_id'] as String;
                          return Card(
                            color: Colors.blueGrey[500],
                            child: ListTile(
                              leading: CircleAvatar(
                                child: Text('${index + 1}'),
                              ),
                              title: Text(
                                data['title'],
                              ),
                              subtitle: Text(data['description']),
                              trailing: PopupMenuButton(onSelected: (v) {
                                if (v == 'edit') {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(builder: (ctx) {
                                    return Edittodo(tododetails: data);
                                  }));
                                } else if (v == 'delete') {
                                  deletealertdialogue(context, id);
                                }
                              }, itemBuilder: (context) {
                                return [
                                  const PopupMenuItem(
                                    value: 'edit',
                                    child: Text('Edit'),
                                  ),
                                  const PopupMenuItem(
                                      value: 'delete', child: Text('Delete')),
                                ];
                              }),
                            ),
                          );
                        });
                  }),
              onRefresh: () {
                return getdata();
              })),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
              return const AddTodoList();
            }));
          },
          label: const Icon(Icons.add)),
    );
  }
}
