import 'package:flutter/material.dart';
import "package:grodeals/providers/listprovider.dart";
import 'package:provider/provider.dart';
import 'package:grodeals/widgets/shoppinglist.dart';
import 'package:grodeals/widgets/suggestedmarketslist.dart';

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
    final products = Provider.of<ListProvider>(context);
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          elevation: 0,
          title: const Text("GroDeals Shopping List"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: ShoppingListWithRemove(
              key: UniqueKey(),
            )),
            Expanded(
                child: SuggestedMarketsList(
              key: UniqueKey(),
            ))
          ],
        ));
  }
}
