import 'dart:collection';

import 'package:flutter/foundation.dart';

class User {
  final String name;
  final int age;
  bool isDelete;

  User({required this.name, required this.age, this.isDelete = false});
}

final List<User> initUsers = [
  User(name: '张三', age: 20),
  User(name: '李四', age: 21),
  User(name: '王五', age: 22),
  User(name: '赵六', age: 23),
  User(name: '孙七', age: 24),
  User(name: '周八', age: 25),
  User(name: '吴九', age: 26),
  User(name: '郑十', age: 27),
  User(name: '钱十一', age: 28),
  User(name: '孙十二', age: 29),
  User(name: '周十三', age: 30),
  User(name: '吴十四', age: 31),
  User(name: '郑十五', age: 32),
  User(name: '钱十六', age: 33),
  User(name: '孙十七', age: 34),
  User(name: '周十八', age: 35),
  User(name: '吴十九', age: 36),
  User(name: '郑二十', age: 37),
  User(name: '钱二十一', age: 38),
  User(name: '孙二十二', age: 39),
  User(name: '周二十三', age: 40),
  User(name: '吴二十四', age: 41),
];

final List<User> deleteUsers = [];

class ProviderDemoModel with ChangeNotifier {
  final List<User> _users = [];
  final List<User> _undeleteUsers = initUsers;
  get users => _users;
  get undeleteUsers => _undeleteUsers;
  get count => _users.length;
  void addUser(User user) {
    _undeleteUsers.remove(user);
    _users.add(user);
    notifyListeners();
  }

  void removeAll() {
    _users.clear();
    notifyListeners();
  }
}
