import 'package:flutter/material.dart';
import 'package:mobile_store/constants/colors.dart';
import 'package:mobile_store/models/CartItem.dart';
import 'package:mobile_store/models/Mobile.dart';
import 'package:mobile_store/widgets/title_text.dart';
import 'package:mobile_store/widgets/extensions.dart';

class CartItemCard extends StatelessWidget {
  final CartItem product;
  final ValueChanged<CartItem>? onSelected;
  CartItemCard({Key? key, required this.product, this.onSelected}) : super(key: key);
  
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
      margin: EdgeInsets.symmetric(vertical: 20 ),
      child: SizedBox(
        height: 200,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              radius: 60,
                              backgroundColor: LightColor.orange.withAlpha(40),
                            ),
                            // CachedNetworkImage(
                            //   imageUrl: product.image,
                            //   placeholder: (context, url) => new CircularProgressIndicator(),
                            //   errorWidget: (context, url, error) => new Icon(Icons.error)
                            // ),
                            Image.network(
                              product.image,
                              fit: BoxFit.fill,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15, width: 40,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 60.0,top: 10.0,right: 10.0,bottom: 10.0),
                        child: TitleText(
                          text: product.mobile_name,
                          fontSize: 16,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 60.0,top: 10.0,right: 10.0,bottom: 10.0),
                        child: TitleText(
                          text: product.price.toString(),
                          fontSize: 18,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: (){},
                            padding: EdgeInsets.only(
                              left: 75.0, top: 50.0
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: (){},
                            padding: EdgeInsets.only(
                                left: 20.0, top: 50.0
                            ),
                            focusColor: Colors.green,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        )
      ),
    );
  }
}