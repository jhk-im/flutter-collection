import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mask/model/store.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mask',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomPage(),
    );
  }
}

class MyHomPage extends StatefulWidget {
  const MyHomPage({Key? key}) : super(key: key);

  @override
  State<MyHomPage> createState() => _MyHomPageState();
}

class _MyHomPageState extends State<MyHomPage> {
  List<Store> stores = [];
  var isLoading = true;

  Future getStore() async {
    setState(() {
      isLoading = true;
    });
    var url = Uri.https('gist.githubusercontent.com',
        'junsuk5/bb7485d5f70974deee920b8f0cd1e2f0/raw/063f64d9b343120c2cb01a6555cf9b38761b1d94/sample.json');
    var response = await http.get(url);
    final jsonResult = jsonDecode(response.body);
    final jsonStores = jsonResult['stores'];
    setState(() {
      stores.clear();
      jsonStores.forEach((jsonStore) {
        Store store = Store.fromJson(jsonStore);
        stores.add(store);
      });
      stores
          .sort((a, b) => a.getRemainStatNum().compareTo(b.getRemainStatNum()));

      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getStore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('마스크 재고 있는 곳 : ${stores.where((element) => element.getRemainStatNum() > 0).length}곳'),
        actions: [
          IconButton(
            onPressed: () {
              getStore();
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: isLoading ? loadingWidget() : listViewWidget(),
    );
  }

  Widget listViewWidget() {
    return ListView(
      children: stores
          .where((element) => element.getRemainStatNum() > 0)
          .map((store) {
        return ListTile(
          title: Text(store.name ?? ''),
          subtitle: Text(store.addr ?? ''),
          trailing: _buildRemainStatWidget(store),
        );
      }).toList(),
    );
  }

  Widget _buildRemainStatWidget(Store store) {
    var remainStat = '';
    var description = '';
    var color = Colors.black;
    switch (store.getRemainStatNum()) {
      case 1:
        remainStat = '충분';
        description = '100개 이상';
        color = Colors.green;
        break;
      case 2:
        remainStat = '보통';
        description = '30 ~ 100개';
        color = Colors.orange;
        break;
      case 3:
        remainStat = '부족';
        description = '2 ~ 30개';
        color = Colors.redAccent;
        break;
      case 4:
        remainStat = '소진임박';
        description = '1개 이하';
        color = Colors.grey;
        break;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          remainStat,
          style: TextStyle(color: color),
        ),
        Text(
          description,
          style: TextStyle(color: color),
        ),
      ],
    );
  }

  Widget loadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('정보를 가져오는 중'),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
