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
    final reducedPrices =
        supermarkets.getPricesAsText(widget.supermarketid, true);
    final originalPrices =
        supermarkets.getPricesAsText(widget.supermarketid, false);
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemBuilder: (ctx, i) => Container(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        height: 70,
        width: double.maxFinite,
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.black, //color of border
              width: 1, //width of border
            ),
          borderRadius: BorderRadius.circular(5)
        ), 
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
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
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
                        color: Theme.of(context).primaryColor,
                        decoration: getStrikeThrough(availability[
                            products.items.values.toList()[i].id])),
                  ),
                  Row(children: <Widget>[
                    Text(
                      "Quantity ",
                      style: TextStyle(color: Theme.of(context).primaryColor),
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
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Price ",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    RichText(
                        text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: originalPrices[
                              products.items.values.toList()[i].id],
                          style: const TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        const TextSpan(text: "   "),
                        TextSpan(
                          text: reducedPrices[
                              products.items.values.toList()[i].id],
                        ),
                      ],
                    ))
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
      return const Color.fromARGB(179, 236, 236, 236);
    } else if (available) {
      return const Color.fromARGB(255, 255, 255, 255);
    } else {
      return const Color.fromARGB(179, 236, 236, 236);
    }
  }

  TextDecoration getStrikeThrough(bool? available) {
    if (available == null) {
      return TextDecoration.none;
    } else if (available) {
      return TextDecoration.none;
    } else {
      return TextDecoration.lineThrough;
    }
  }
}
