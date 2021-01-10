import 'package:flutter/material.dart';
import 'package:par_demo/models/emp_model.dart';
import 'package:par_demo/models/user_model.dart';
import 'package:par_demo/pages/detail_page.dart';
import 'package:par_demo/services/http_service.dart';

class HomePage extends StatefulWidget {

  static final String id = 'home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Employee> items =  new List();
  User userCreate;
  List<User> itemsUpdate = new List();
  String _id;

  _openDetailPage() {
    Navigator.pushNamed(context, DetailPage.id);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    User user = User(id: 21, name: 'Ali', salary: '2500', age: '22');
    _apiEmpList();
    _apiCreate(user);
    _apiUpdate(user);
    _apiDelete(2);
  }

  void _apiEmpList() {
    Network.GET(Network.API_EMP_LIST, Network.paramEmpty()).then((response) {
      print(response);
      setState(() {
        items = Network.parseEmpList(response).data;
      });
    });
  }

  void _apiCreate(User user) {
    Network.POST(Network.API_CREATE, Network.paramCreate(user)).then((response) {
      print('\nCreate Parsing');
      setState(() {
        userCreate = Network.parseCreate(response).data;
      });
      print('Name: ${userCreate.name}, Age: ${userCreate.age}, Salary: ${userCreate.salary}');
    });
  }

  void _apiUpdate(User user) {
    Network.PUT(Network.API_UPDATE + user.id.toString(), Network.paramUpdate(user)).then((response) {
      print('\nUpdate Parsing');
      print(response);
      setState(() {
        itemsUpdate = Network.parseUpdate(response).data;
      });
    });
  }

  void _apiDelete(int id) {
    Network.DEL(Network.API_DELETE + id.toString(), Network.paramEmpty()).then((response) {
      print('\nDelete Parsing');
      setState(() {
        _id = Network.parseDelete(response).data;
      });
      print(_id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee List'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (ctx, i) {
          return _itemOfList(i);
        },
      ),
    );
  }

  Widget _itemOfList(i) {
    return ListTile(
      title: Text('${i + 1}.${items[i].employee_name}(${items[i].employee_age.toString()})'),
      subtitle: Text(items[i].employee_salary + '\$'),
      onTap: () {
        _openDetailPage();
      },
    );
  }
}
