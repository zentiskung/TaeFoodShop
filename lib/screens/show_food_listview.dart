import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:taefoodshop/listview/food_listview.dart';
import 'dart:convert';

import 'package:taefoodshop/models/food_model.dart';

class ShowFoodListView extends StatefulWidget {
  final String nameString;

  ShowFoodListView({Key key, this.nameString}) : super(key: key);

  @override
  _ShowFoodListViewState createState() => _ShowFoodListViewState();
}

class _ShowFoodListViewState extends State<ShowFoodListView> {
  String nameUser;
  String urlString = 'http://androidthai.in.th/tae/getAllFoodTae.php';
  List<FoodModel> foodModels = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    nameUser = widget.nameString;

    readAllJson();
  }

  void readAllJson() async {
    // print('readAllJson Work');

    var response = await http.get(urlString);
    var result = json.decode(response.body);
    // print('result ==+> $result');

    for (var objJson in result) {
      // print(objJson);
      FoodModel foodModel = FoodModel.fromJSON(objJson);
      setState(() {
        foodModels.add(foodModel);
      });
      // print('Name Food ==> : ${foodModel.nameFood.toString()}');
    }
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
      appBar: AppBar(
        backgroundColor: Colors.orange[700],
        title: showTitleBar(),
      ),
      body: FoodListView(foodModels),
    );
  }
}
