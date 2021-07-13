import 'package:flutter/material.dart';
import 'user.dart';
import 'users.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<User> users = [];
  List<String> allIndex = [];

  @override
  void initState() {
    super.initState();

    users = getUsers();

    //allIndex = getUsers();
  }

  //List<int> number = [0, 1, 2, 3, 4, 5];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Move List Element"),
      ),
      body: ReorderableListView.builder(
        itemCount: users.length,
        onReorder: (oldIndex, newIndex) => setState(() {
          final index = newIndex > oldIndex ? newIndex - 1 : newIndex;

          final user = users.removeAt(oldIndex);
          users.insert(index, user);
          allIndex.add(user.name[index]);
          //allIndex.insert(index, user);
          // index print hoy
          print(index);
          for (var i = 0; i < users.length; i++) {
            //print(i);

            final a = 0;
          }
          print("---");
          // print(allIndex);
        }),
        itemBuilder: (context, index) {
          final user = users[index];

          return buildUser(index, user);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.shuffle),
        onPressed: shuffleList,
      ),
    );
  }

  Widget buildUser(int index, User user) => ListTile(
        key: ValueKey(user),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        // leading: CircleAvatar(
        //   backgroundImage: NetworkImage(user.urlImage),
        //   radius: 30,
        // ),
        title: Text(user.name),

        leading: Text(user.name[index]),

        // trailing: Row(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     IconButton(
        //       icon: Icon(Icons.edit, color: Colors.black),
        //       onPressed: () => edit(index),
        //     ),
        //     IconButton(
        //       icon: Icon(Icons.delete, color: Colors.black),
        //       onPressed: () => remove(index),
        //     ),
        //   ],
        // ),
      );

  // void remove(int index) => setState(() => users.removeAt(index));

  // void edit(int index) => showDialog(
  //       context: context,
  //       builder: (context) {
  //         final user = users[index];

  //         return AlertDialog(
  //           content: TextFormField(
  //             initialValue: user.name,
  //             onFieldSubmitted: (_) => Navigator.of(context).pop(),
  //             onChanged: (name) => setState(() => user.name = name),
  //           ),
  //         );
  //       },
  //     );

  void shuffleList() => setState(() => users.shuffle());
}
