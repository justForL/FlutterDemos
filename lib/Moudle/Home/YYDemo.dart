import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(YYDemo());

class YYDemo extends StatefulWidget {
  @override
  State createState() => _YYDemoState();
}

class _YYDemoState extends State<YYDemo> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListDemo"),
        // automaticallyImplyLeading: false
        
      ),
      body: Container(child: _buildListView()),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        if (index == 0) {
          return SingleStoryItem();
        }
        return ListItem(index);
      },
    );
  }
}

class ListItem extends StatelessWidget {
  final int index;
  ListItem(this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Container(
            // width: 335,
            // height: 335,
            // color: Colors.red,
            child: Wrap(children: <Widget>[
              StoryItem(),
              StoryItem(),
              StoryItem(),
              StoryItem(),
              StoryItem(),
              StoryItem()
            ]),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.red,
                border: Border.all(color: Colors.grey, width: 1)),
          )),
    );
  }
}

class StoryItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final itemWidth = ((width - 4 * 10 - 40) ~/ 3).toDouble();
    return Container(
        child: Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
      child: Column(
        children: <Widget>[
          Container(
            width: itemWidth,
            height: 114,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                color: Colors.green,
                borderRadius: BorderRadius.circular(10)),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
              child: Text(
                "刻薄女孩",
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    ));
  }
}

class SingleStoryItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Container(
          child: Container(
              width: 335,
              height: 335,
              child: Stack(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[Text("123")],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "12312312313123123123123ssssssseeeeeeeess1",
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 20, 20),
                            child: FloatingActionButton(
                              onPressed: () {},
                              child: (Icon(Icons.add)),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: FloatingActionButton(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              )),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              color: Colors.green,
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
