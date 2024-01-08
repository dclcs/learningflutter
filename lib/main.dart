import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:learningflutter/detail.dart';
import 'package:learningflutter/user.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Provider(
    create: (context) => ProviderDemoModel(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 显示用户信息，名称、年龄、和是否删除该用户 mock 数据

  @override
  Widget build(BuildContext context) {
    final _providerViewModel = Provider.of<ProviderDemoModel>(context);
    final _users = Provider.of<ProviderDemoModel>(context).undeleteUsers;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 详情页按钮
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(),
                  ),
                );
              },
              child: Text('详情页'),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _users.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${_users[index].name}',
                      ),
                      Text(
                        '${_users[index].age}',
                      ),

                      // 删除按钮
                      TextButton(
                        onPressed: () {
                          setState(() {
                            // initUsers.remove(_users[index]);
                            // deleteUsers.add(_users[index]);
                            _providerViewModel.addUser(_users[index]);
                          });
                        },
                        child: Text(
                          _users[index].isDelete ? '已经删除' : '删除',
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
