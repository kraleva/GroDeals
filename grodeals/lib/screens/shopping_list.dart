import 'package:flutter/material.dart';
import 'package:grodeals/widgets/shoppinglist.dart';
import 'package:grodeals/widgets/suggestedmarketslist.dart';

class CustomShoppingList extends StatefulWidget {
  const CustomShoppingList({
    required Key key,
  }) : super(key: key);

  @override
  State<CustomShoppingList> createState() => _CustomShoppingListState();
}

class _CustomShoppingListState extends State<CustomShoppingList> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          elevation: 0,
          title: const Text("GroDeals Shopping List"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: ShoppingListWithRemove(
              key: UniqueKey(),
            )),
            Container(
                padding: const EdgeInsets.only(bottom: 18),
                child: const Align(
                    alignment: Alignment.topCenter,
                    child: Text("Recommended supermarkets",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)))),
            Expanded(
                child: SuggestedMarketsList(
              key: UniqueKey(),
            ))
          ],
        ));
  }
}
