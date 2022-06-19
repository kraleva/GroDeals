import 'package:flutter/material.dart';
import "package:grodeals/providers/supermarkets.dart";
import "package:grodeals/providers/listprovider.dart";
import 'package:grodeals/widgets/shoppinglist_supermarket.dart';
import 'package:provider/provider.dart';

class MarketList extends StatefulWidget {
  final String supermarketid;
  const MarketList({Key? key, required this.supermarketid}) : super(key: key);

  @override
  State<MarketList> createState() => _MarketListState();
}

class _MarketListState extends State<MarketList> {
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
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: ShoppingListForSupermarket(
                    key: UniqueKey(), supermarketid: widget.supermarketid)),
            const Expanded(child: Text('test'))
          ],
        ));
  }
}
