import 'package:flutter/material.dart';

class ShowFoodListView extends StatefulWidget {
  final String nameString;

  ShowFoodListView({Key key, this.nameString}) : super(key: key);

  @override
  _ShowFoodListViewState createState() => _ShowFoodListViewState();
}

class _ShowFoodListViewState extends State<ShowFoodListView> {
  String nameUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    nameUser = widget.nameString;
  }

  Widget showTitleBar() {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment(-1, -1),
          child: Text('Show Food List'),
        ),
        Container(
          alignment: Alignment(-1, -1),
          child: Text(
            'Login by => $nameUser',
            style: TextStyle(fontSize: 15.0),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.orange[700],
        title: showTitleBar(),
      ),
      body: Text('body'),
    );
  }
}
