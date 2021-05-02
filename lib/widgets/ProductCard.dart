import 'package:flutter/material.dart';
import 'package:mobile_store/constants/colors.dart';
import 'package:mobile_store/models/Mobile.dart';
import 'package:mobile_store/widgets/title_text.dart';
import 'package:mobile_store/widgets/extensions.dart';

class ProductCard extends StatelessWidget {
  final Mobile product;
  final ValueChanged<Mobile> onSelected;
  ProductCard({Key key, this.product, this.onSelected}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: LightColor.background,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(color: Color(0xfff8f8f8), blurRadius: 15, spreadRadius: 10),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: !product.isSelected ? 20 : 0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(height: product.isSelected ? 15 : 0),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: LightColor.orange.withAlpha(40),
                      ),
                      Image.network(
                          product.image,
                        height: 150,
                      )
                    ],
                  ),
                ),
                // SizedBox(height: 5),
                TitleText(
                  text: product.name,
                  fontSize: product.isSelected ? 16 : 14,
                ),
                TitleText(
                  text: product.brand,
                  fontSize: product.isSelected ? 14 : 12,
                  color: LightColor.orange,
                ),
                TitleText(
                  text: product.price.toString(),
                  fontSize: product.isSelected ? 18 : 16,
                ),
              ],
            ),
          ],
        ),
      ).ripple(() {
        Navigator.of(context).pushNamed('/detail');
        onSelected(product);
      }, borderRadius: BorderRadius.all(Radius.circular(20))),
    );
  }
}