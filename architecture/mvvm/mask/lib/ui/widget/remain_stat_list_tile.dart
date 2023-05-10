import 'package:flutter/material.dart';
import 'package:mask/model/store.dart';

class RemainStatListTile extends StatelessWidget {
  const RemainStatListTile({Key? key,required this.store}) : super(key: key);

  final Store store;

  @override
  Widget build(BuildContext context) {
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

    return ListTile(
      title: Text(store.name ?? ''),
      subtitle: Text(store.addr ?? ''),
      trailing: Column(
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
      ),
    );
  }
}