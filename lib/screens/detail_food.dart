import 'package:flutter/material.dart';
import 'package:taefoodshop/models/food_model.dart';

class DetailFood extends StatefulWidget {
  final FoodModel foodModel;
  DetailFood({Key key, this.foodModel}) : super(key: key);

  @override
  _DetailFoodState createState() => _DetailFoodState();
}

class _DetailFoodState extends State<DetailFood> {
  FoodModel foodModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    foodModel = widget.foodModel;
  }

  Widget showName() {
    return Text(foodModel.nameFood);
  }

  Widget showImage() {
    return Image.network(foodModel.imagePath);
  }

  Widget showPrice() {
    return Text(foodModel.price);
  }

  Widget showDetail() {
    return Text(foodModel.detail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Food'),
      ),
      body: ListView(
        children: <Widget>[
          showName(),
          showImage(),
          showPrice(),
          showDetail(),
        ],
      ),
    );
  }
}
