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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Name',
                      labelText: "What's your name?",
                    ),
                    // onSaved: (name),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.email),
                      hintText: 'Email',
                      labelText: "What's your email?",
                    ),
                  // onSaved: (email),
                  )
                )
              ],
            )
          )
        ]
      )
    );
  }
}

class SetupBank extends StatelessWidget {
  final String title;
  const SetupBank({
    Key key,
    this.title,
  }) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.green
            ),
            child: Icon(Icons.attach_money, size:100)
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Bank Name',
                      labelText: "What's your Bank Insitution?",
                    ),
                    // onSaved: (name),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.email),
                      hintText: 'Number',
                      labelText: "What's your Account Number?",
                    ),
                  // onSaved: (email),
                  )
                )
              ],
            )
          )
        ]
      )
    );
  }
}

class SetupGoals extends StatelessWidget {
  final String title;
  const SetupGoals({
    Key key,
    this.title,
  }) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black
            ),
            child: Icon(Icons.person_pin, size:100)
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Number',
                      labelText: "What's your desired monthly budget?",
                    ),
                    // onSaved: (name),
                  ),
                ),
              ],
            )
          )
        ]
      )
    );
  }
}