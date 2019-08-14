import 'package:demo02/Moudle/Home/ExpentionDemo.dart';
import 'package:demo02/Moudle/Home/ScrollBottomBar.dart';
import 'package:demo02/Moudle/Home/ScrollToTopDemo.dart';
import 'package:demo02/Moudle/Home/TextFieldDemo.dart';
import 'package:demo02/Moudle/Home/WX9Button.dart';
import 'package:demo02/Router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(HomeList());

enum HomeItemEnum { Modal, WX9Button, TextField, ExpansionDemo,ScrollToTop,ScrollBottomBar }

class HomeListItemModel {
  String title;
  HomeItemEnum type;
  HomeListItemModel(this.title, this.type);
}

class HomeList extends StatelessWidget {
  final List<HomeListItemModel> _dataSource = [
    HomeListItemModel("Modal", HomeItemEnum.Modal),
    HomeListItemModel("微信九宫格", HomeItemEnum.WX9Button),
    HomeListItemModel("TextField聚焦", HomeItemEnum.TextField),
    HomeListItemModel("expansion_demo", HomeItemEnum.ExpansionDemo),
    HomeListItemModel("ScrollToTop", HomeItemEnum.ScrollToTop),
    HomeListItemModel("ScrollBottomBar", HomeItemEnum.ScrollBottomBar),
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
        ));
  }
}

class HomeListItem extends StatelessWidget {
  final HomeListItemModel model;
  final int index;
  HomeListItem(this.model, this.index);

  void _itemOnPress(
    BuildContext context,
  ) {
    print(this.model.type);
    switch (this.model.type) {
      case HomeItemEnum.Modal:
        {
          _routeJumpAction(context, Router(), true);
        }
        break;
      case HomeItemEnum.WX9Button:
        {
          _routeJumpAction(context, WX9Button(), false);
        }
        break;
      case HomeItemEnum.TextField:
        {
          _routeJumpAction(context, TextFieldDemo(), false);
        }
        break;
      case HomeItemEnum.ExpansionDemo:
        {
          _routeJumpAction(context, ExpentionDemo(), false);
        }
        break;
        case HomeItemEnum.ScrollToTop:
        {
          _routeJumpAction(context, ScrollToTopDemo(), false);
        }
        break;
         case HomeItemEnum.ScrollBottomBar:
        {
          _routeJumpAction(context, ScrollBottomBar(), false);
        }
        break;

      default:
    }
  }

  void _routeJumpAction(BuildContext context, Widget route, bool fullScurren) {
    Navigator.of(context).push(MaterialPageRoute(
        fullscreenDialog: fullScurren,
        builder: (BuildContext context) {
          return route;
        }));
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: () => _itemOnPress(context),
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
