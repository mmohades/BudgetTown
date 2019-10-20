import 'package:flutter/material.dart';

class SetupAccount extends StatelessWidget {
  final String title;
  const SetupAccount({
    Key key,
    this.title,
  }) : super(key: key);

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(),
    body: Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey
          ),
          child: Icon(Icons.person, size:100)
        ),
        SizedBox(height: 10),
        Text(
          title,
          style: Theme.of(context).textTheme.headline,
        ),
        Divider(),
        Expanded(
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: "What's your name?",
                  labelText: 'Name ',
                ),
                // onSaved: (name),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: "What's your email?",
                  labelText: 'Email',
                ),
                // onSaved: (email),
              )
            ],
          )
        )
      ]
    )
  );
}
}