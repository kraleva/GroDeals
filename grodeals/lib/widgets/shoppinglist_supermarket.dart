import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import "package:grodeals/providers/listprovider.dart";
import 'package:flutter/material.dart';
import 'package:grodeals/providers/supermarkets.dart';
import 'package:provider/provider.dart';

class ShoppingListForSupermarket extends StatefulWidget {
  final String supermarketid;
  const ShoppingListForSupermarket({Key? key, required this.supermarketid})
      : super(key: key);

  @override
  State<ShoppingListForSupermarket> createState() =>
      _ShoppingListForSupermarket();
}

class _ShoppingListForSupermarket extends State<ShoppingListForSupermarket> {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ListProvider>(context);
    final supermarkets = Provider.of<SupermarketProvider>(context);
    final availability = supermarkets.getAvailability(widget.supermarketid);
    return ListView.builder(
      itemBuilder: (ctx, i) => Container(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        height: 70,
        width: double.maxFinite,
        child: Dismissible(
          key: Key(products.items.values.toList()[i].id),
          direction: DismissDirection.endToStart,
          confirmDismiss: (direction) {
            return showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: const Text('Are You Sure?'),
                content:
                    const Text('Do Yoy want to remove item from the List?'),
                elevation: 6,
                actions: <Widget>[
                  TextButton(
                    child: const Text(
                      'No',
                      style: TextStyle(color: Colors.green),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                  TextButton(
                    child: const Text(
                      'Yes',
                      style: TextStyle(color: Colors.redAccent),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  )
                ],
              ),
            );
          },
          onDismissed: (direction) {
            setState(() {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                    "${products.items.values.toList()[i].title} Removed Form List"),
              ));
              Provider.of<ListProvider>(context, listen: false)
                  .removeItem(products.items.keys.toList()[i].toString());
            });
          },
          background: Padding(
            padding: const EdgeInsets.only(bottom: 22.0, top: 9),
            child: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20),
                color: Colors.red,
                child: Icon(
                  color: Colors.white,
                  Icons.delete,
                )),
          ),
          child: Card(
            elevation: 0,
            color: getBackgroundColor(
                availability[products.items.values.toList()[i].id]),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    products.items.values.toList()[i].title,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                  Row(children: <Widget>[
                    Text(
                      "Quantity ",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    products.items.values.toList()[i].quantity == 1
                        ? Container(
                            decoration: const BoxDecoration(
                                border: Border(
                              right: BorderSide(
                                width: 1,
                                color: Colors.grey,
                              ),
                              top: BorderSide(
                                width: 1,
                                color: Colors.grey,
                              ),
                              bottom: BorderSide(
                                width: 1,
                                color: Colors.grey,
                              ),
                            )),
                            child: const Icon(
                              Icons.remove,
                              color: Colors.black,
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              print("Item Removed");
                              Provider.of<ListProvider>(context, listen: false)
                                  .decQuantity(products.items.keys
                                      .toList()[i]
                                      .toString());
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                right: BorderSide(
                                  width: 2,
                                ),
                                top: BorderSide(
                                  width: 2,
                                ),
                                bottom: BorderSide(
                                  width: 2,
                                ),
                              )),
                              child: const Icon(Icons.remove),
                            ),
                          ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      products.items.values.toList()[i].quantity.toString(),
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        print(products.items.keys.toList()[i].toString());
                        Provider.of<ListProvider>(context, listen: false)
                            .incQuantity(
                                products.items.keys.toList()[i].toString());
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            border: Border(
                          left: BorderSide(width: 2),
                          top: BorderSide(
                            width: 2,
                          ),
                          bottom: BorderSide(
                            width: 2,
                          ),
                        )),
                        child: const Icon(Icons.add),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ]),
                ],
              ),
            ),
          ),
        ),
      ),
      itemCount: products.items.length,
    );
  }

  Color getBackgroundColor(bool? available) {
    if (available == null) {
      return Color.fromARGB(179, 236, 236, 236);
    } else if (available) {
      return Color.fromARGB(255, 255, 255, 255);
    } else {
      return Color.fromARGB(179, 236, 236, 236);
    }
  }
}
