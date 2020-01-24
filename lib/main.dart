import 'package:flutter/material.dart';
import 'package:ui_product_shop/styles.dart';
import 'package:ui_product_shop/widgets.dart';
/* https://www.youtube.com/watch?v=8iYbcc5H5ps */
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final title = Center(
    heightFactor: 2.5,
    child: Text('STORE @kenbo', style: titleStyle),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.fromLTRB(25, 35, 25, 15),
          child: Column(
            children: <Widget>[
              title,
              BigProductTile(),
              Divider(
                height: 55,
              ),
              SmallProductTiles(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ProductShopNavigationBar(),
    );
  }

}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Hero(
                  tag: 'airpods',
                  child: Image.asset(
                    'assets/airpods_large.jpg',
                    height: MediaQuery.of(context).size.height / 2 + 65,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(25, 55, 25, 15),
                  child: FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: () => Navigator.pop(context),
                    elevation: 0,
                    child: Icon(Icons.arrow_back, color: Colors.black),
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.fromLTRB(25, 10, 25, 15),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('AirPods',
                            style: tileItemStyle.copyWith(fontSize: 28)),
                        Text('\$199',
                            style: tileItemPriceStyle.copyWith(fontSize: 28)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 25),
                    child: Text(
                        'AirPods are automatically on and always connected. Put them in your ears and they connect',
                        style: descriptionStyle),
                  ),
                  QuantitySelector(),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    height: 48,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.black,
                    ),
                    child: Center(child: Text('Add to cart', style: buttonStyle,)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductShopNavigationBar extends StatelessWidget {
  static const _iconSize = 30.0; 
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.shopping_basket,
                size: _iconSize,
              ),
              onPressed: (){},
            ),
            IconButton(
              icon: Icon(
                Icons.search,
                size: _iconSize,
              ),
              onPressed: (){},
            ),
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
                size: _iconSize,
              ),
              onPressed: (){},
            )            
          ],
        ),
      ),
    );
  }
}