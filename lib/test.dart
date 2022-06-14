// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: UsersList(),
        appBar: AppBar(
          title: Container(
            alignment: Alignment.center,
            child: Counter(),
          ),
        ),
      ),
    ),
  );
}

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  int getValue() {
    return _CounterState().value;
  }

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int value = 0;

  increaseValue() {
    setState(() {
      value++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () => {increaseValue()},
          child: Text('Press'),
        ),
        Text('Value = $value')
      ],
    );
  }
}

class Person extends StatefulWidget {
  const Person({Key? key}) : super(key: key);

  @override
  _PersonState createState() => _PersonState();
}

class _PersonState extends State<Person> {
  String _name = 'Tom';
  _changeName(String text) {
    setState(() => _name = text);
  }

  @override
  Widget build(BuildContext context) {
    // ignore: sort_child_properties_last
    return Column(children: [
      Text("Имя пользователя: $_name", style: TextStyle(fontSize: 22)),
      TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Maybe u wanna enter something ?",
          fillColor: Colors.black12,
          filled: true,
          labelText: 'Login',
          icon: Icon(Icons.login),
          helperText: 'Someone',
        ),
        style: TextStyle(fontSize: 30),
        onChanged: _changeName,
        onSubmitted: (text) {
          print("onSubmitted");
          print("Введенный текст: $text");
        },
      )
    ], crossAxisAlignment: CrossAxisAlignment.start);
  }
}

class PersonOne extends StatefulWidget {
  PersonOne({Key? key}) : super(key: key);

  @override
  _PersonStateOne createState() => _PersonStateOne();
}

class _PersonStateOne extends State<PersonOne> {
  String _name = "Tom";
  final _controller = TextEditingController();

  _changeName() {
    setState(() => _name = _controller.text);
  }

  @override
  void initState() {
    super.initState();
    _controller.text = _name;
    _controller.addListener(_changeName);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: sort_child_properties_last
    return Column(children: [
      Text("Имя пользователя: $_name", style: TextStyle(fontSize: 22)),
      TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Maybe u wanna enter something ?",
            fillColor: Colors.black12,
            filled: true,
            labelText: 'Login',
            icon: Icon(Icons.login),
            helperText: 'Someone',
          ),
          style: TextStyle(fontSize: 22),
          controller: _controller)
    ], crossAxisAlignment: CrossAxisAlignment.start);
  }
}

class UsersList extends StatefulWidget {
  @override
  _UsersListState createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  final List<String> users = ["Tom", "Alice", "Sam", "Bob", "Kate"];
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Value = '),
      Person(),
      PersonOne(),
      Text(
          selectedIndex == -1
              ? "Не выбрано"
              : "Выбрано: ${users[selectedIndex]}",
          style: TextStyle(fontSize: 30)),
      Expanded(
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: _createListView,
        ),
      ),
    ]);
  }

  Widget _createListView(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // устанавливаем индекс выделенного элемента
          selectedIndex = index;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        padding: EdgeInsets.symmetric(vertical: 8),
        color: index == selectedIndex ? Colors.black12 : Colors.white60,
        child: Text(users[index], style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
