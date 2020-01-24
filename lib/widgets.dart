import 'package:flutter/material.dart';
import 'package:ui_product_shop/styles.dart';

import 'main.dart';

class BigProductTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DetailsScreen()));
      },
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('What\'s new', style: tileTitleStyle),
                  Opacity(
                    opacity: 0.45,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Icon(Icons.sort),
                        ),
                        Text('Filter', style: filterStyle),
                      ],
                    ),
                  ),
                ]),
            Container(
                margin: EdgeInsets.only(top: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Hero(
                    tag: 'airpods',
                    child: Image.asset(
                      'assets/airpods.jpg',
                      alignment: Alignment.center,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width - 20,
                    ),
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Airpods',
                    style: tileItemStyle,
                  ),
                  Text('\$199', style: tileItemPriceStyle)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SmallProductTiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Text picked for you', style: tileTitleStyle),
              Opacity(
                opacity: 0.6,
                child: Text('Show all', style: filterStyle),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Row(
              children: <Widget>[
                Flexible(
                  flex: 5,
                  child: SmallProductTile(
                    name: 'Console',
                    price: 149,
                    asset: 'assets/console.jpg',
                    padding: EdgeInsets.only(right: 14),
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: SmallProductTile(
                    name: 'Watch',
                    price: 299,
                    asset: 'assets/watch.jpg',
                    padding: EdgeInsets.only(left: 14),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SmallProductTile extends StatelessWidget {
  final String name;
  final int price;
  final String asset;
  final EdgeInsets padding;

  SmallProductTile({this.name, this.price, this.asset, this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              asset,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('$name', style: smallTileName),
                Text('\$$price', style: smallTilePrice),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class QuantitySelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Quantity', style: quantityStyle),
            Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black.withOpacity(0.06),
                  ),
                  alignment: Alignment.center,
                  width: 40,
                  height: 40,
                  child: Text('-', style: quantityIconStyle),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text('1', style: quantityIconStyle.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  )),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black.withOpacity(0.06),
                  ),
                  alignment: Alignment.center,
                  width: 40,
                  height: 40,
                  child: Text('+', style: quantityIconStyle),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
