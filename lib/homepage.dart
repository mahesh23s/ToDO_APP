import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:todo_app/todo_list.dart';
class HomePage extends StatefulWidget {
    HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  List todoList = [
    ['hi', false],
    ['welcome', false],
  ];

  void checkboxchange(int index){
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }
  void savedNewTask(){
    setState(() {
      todoList.add([_controller.text, false]);
      _controller.clear();
    });
  }
  void deleteTask(int index){
    setState(() {
      todoList.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent.shade200,
      appBar: AppBar(
        centerTitle: true,

        title: const Text('Todo App',
          style: TextStyle(
            color: Colors.white,
          ),

    ),
        backgroundColor: Colors.green,
        foregroundColor: Colors.lightBlue,
    ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (BuildContext context, index){
        return TodoList(
          task: todoList[index][0],
          taskcompleted: todoList[index][1],
          onChanged: (value) => checkboxchange(index),
          deleteFunction: (context) => deleteTask(index),
        );
      }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,
              ),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: "Enter a data",
                  filled: true,
                  fillColor: Colors.lightGreen.shade200,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.green,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.green,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    )
                ),
              ),
            )),
            FloatingActionButton(
              onPressed: savedNewTask,
     child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
