import 'package:flutter/material.dart';
import "package:grodeals/providers/listprovider.dart";
import 'package:provider/provider.dart';

class CustomShoppingList extends StatefulWidget {
  const CustomShoppingList({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomShoppingList> createState() => _CustomShoppingListState();
}

class _CustomShoppingListState extends State<CustomShoppingList> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final products = ListProvider();
    final product = products.items;
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          elevation: 0,
          title: const Text("GroDeals Shopping List"),
        ),
        body: ListView.builder(
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
                padding: const EdgeInsets.only(bottom: 22.0, top: 5),
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        products.items.values.toList()[i].quantity == 1
                            ? Container(
                                decoration: const BoxDecoration(
                                    border: Border(
                                  right: BorderSide(
                                    width: 2,
                                    color: Colors.grey,
                                  ),
                                  top: BorderSide(
                                    width: 2,
                                    color: Colors.grey,
                                  ),
                                  bottom: BorderSide(
                                    width: 2,
                                    color: Colors.grey,
                                  ),
                                )),
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.grey,
                                ),
                              )
                            : GestureDetector(
                                onTap: () {
                                  print("Item Removed");
                                  Provider.of<ListProvider>(context,
                                          listen: false)
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
        ));
  }
}
