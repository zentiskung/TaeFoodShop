import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:taefoodshop/models/food_model.dart';
import 'package:taefoodshop/screens/detail_food.dart';

class FoodListView extends StatelessWidget {
  List<FoodModel> foodModels;

  FoodListView(this.foodModels);

  @override
  Widget build(BuildContext context) {
    Widget showImageFood(String urlImage) {
      return Container(
        width: 120.0,
        height: 100.0,
        margin: EdgeInsets.all(8.0),
        child: Image.network(
          urlImage,
          fit: BoxFit.cover,
        ),
      );
    }

    Widget showName(String name) {
      return Container(
        padding: EdgeInsets.only(right: 30.0),
        alignment: Alignment(1, -1),
        child: Text(
          name,
          style: TextStyle(
              fontSize: 23.0,
              color: Colors.orange[700],
              fontWeight: FontWeight.bold),
        ),
      );
    }

    Widget showPrice(String price) {
      return Container(
        padding: EdgeInsets.only(right: 30.0),
        alignment: Alignment(1, -1),
        child: Text(
          '$price บาท',
          style: TextStyle(fontSize: 50.0, color: Colors.orange[300]),
        ),
      );
    }

    return ListView.builder(
      itemCount: foodModels.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: Container(
            decoration: index % 2 == 0
                ? BoxDecoration(color: Colors.orange[50])
                : BoxDecoration(color: Colors.orange[100]),
            child: Row(
              children: <Widget>[
                showImageFood(foodModels[index].imagePath.toString()),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      showName(foodModels[index].nameFood),
                      showPrice(foodModels[index].price)
                    ],
                  ),
                )
              ],
            ),
          ),
          onTap: () {
            print('You Click Position = $index');

            var detailRoute = MaterialPageRoute(
                builder: (BuildContext context) => DetailFood(
                      foodModel: foodModels[index],
                    ));
                    Navigator.of(context).push(detailRoute);
          },
        );
      },
    );
  }
}
