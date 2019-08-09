import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(HomeList());

class HomeList extends StatelessWidget {
  final List<HomeListItemModel> _dataSource = [
    HomeListItemModel("Modal"),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text("HomeList"),
        ),
        body: ListView.builder(
          itemCount: _dataSource.length,
          itemBuilder: (BuildContext context, int index) {
            return HomeListItem(_dataSource[index], index);
          },
          // separatorBuilder: (BuildContext context, int index) {
          //   return Container(
          //     height: 0.5,
          //     color: Colors.grey,
          //     margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
          //   );
          // }
        ));
  }
}

class HomeListItem extends StatelessWidget {
  final HomeListItemModel model;
  final int index;
  HomeListItem(this.model, this.index);

  @override
  Widget build(
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: () {
        //处理点击事件
        print(this.index);
      },
      child: Container(
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(this.model.title),
              Text(this.index.toString())
            ],
          )),
    );
  }
}

class HomeListItemModel {
  String title;
  HomeListItemModel(this.title);
}
