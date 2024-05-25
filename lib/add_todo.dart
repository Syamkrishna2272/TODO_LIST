import 'package:flutter/material.dart';
import 'package:todo_app/functions.dart';

class AddTodoList extends StatefulWidget {
  const AddTodoList({super.key});

  @override
  State<AddTodoList> createState() => _AddTodoListState();
}

class _AddTodoListState extends State<AddTodoList> {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
            centerTitle: true,
            title: const Text(
              'ADD TODO',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            ),
            backgroundColor: Colors.blueGrey),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller: titlecontroller,
                    maxLines: 1,
                    textCapitalization: TextCapitalization.words,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        label: Text(
                      'Title',
                    )),
                  ),
                  TextFormField(
                    controller: descriptioncontroller,
                    maxLines: 1,
                    textCapitalization: TextCapitalization.sentences,
                    keyboardType: TextInputType.multiline,
                    style: const TextStyle(color: Colors.white),
                    decoration:
                        const InputDecoration(label: Text('Description')),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        submitdata(
                            titlecontroller, descriptioncontroller, context);
                      },
                      child: const Text('Submit'))
                ],
              ),
            ),
          ),
        ));
  }
}
