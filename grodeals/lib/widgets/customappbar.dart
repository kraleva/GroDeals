import 'package:flutter/material.dart';
import 'package:grodeals/providers/listprovider.dart';
import 'package:grodeals/screens/category_items_screen.dart';
import 'package:grodeals/screens/shopping_list.dart';
import 'package:grodeals/screens/product_details/product_details_screen.dart';
import 'package:grodeals/models/grocery_item.dart';
import 'package:provider/provider.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  CustomAppBar({
    Key key,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = ListProvider();
    return AppBar(actions: <Widget>[
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
            height: 150.0,
            width: 30.0,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        CustomShoppingList(key: UniqueKey())));
              },
              child: Stack(
                children: <Widget>[
                  const IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                    onPressed: null,
                  ),
                  list.itemCount == 0
                      ? Container()
                      : Positioned(
                          child: Stack(
                          children: <Widget>[
                            Icon(Icons.brightness_1,
                                size: 20.0, color: Colors.green[800]),
                            Positioned(
                                top: 3.0,
                                right: 4.0,
                                child: Center(
                                  child: Text(
                                    list.itemCount.toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )),
                          ],
                        )),
                ],
              ),
            )),
      )
    ]);
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
