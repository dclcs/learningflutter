import 'package:flutter/material.dart';
import 'package:learningflutter/main.dart';
import 'package:learningflutter/user.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    // List<User> users = Provider.of<ProviderDemoModel>(context).users;

    return Scaffold(
      appBar: AppBar(
        title: const Text('用户列表'),
      ),
      body: Consumer<ProviderDemoModel>(
        builder: (_, demoModel, child) {
          return ListView.builder(
              itemCount: demoModel.users.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(demoModel.users[index].name),
                  subtitle: Text(demoModel.users[index].age.toString()),
                );
              });
        },
      ),
    );
  }
}


// ListView.builder(
//         itemCount: users.length,
//         itemBuilder: (BuildContext context, int index) {
          // return ListTile(
          //   title: Text(users[index].name),
          //   subtitle: Text(users[index].age.toString()),
          // );
//         },
//       ),