import 'package:flutter/material.dart';
import "package:grodeals/providers/supermarkets.dart";
import "package:grodeals/providers/listprovider.dart";
import 'package:grodeals/widgets/shoppinglist_supermarket.dart';
import 'package:provider/provider.dart';
import 'package:grodeals/widgets/replacementitem.dart';
import 'package:grodeals/widgets/replacementitemlist.dart';

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
    final supermarkets = Provider.of<SupermarketProvider>(context);
    final products = Provider.of<ListProvider>(context);
    final supermarketUnavailable =
        supermarkets.getUnavailable(widget.supermarketid);
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
            (supermarketUnavailable.isNotEmpty)
                ? const Expanded(
                    child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "It looks like one or more of your items is missing in the chosen supermarket. Here is a list of suggested missing categories.",
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                  ))
                : Expanded(
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                            "Price ${supermarkets.getPrice(widget.supermarketid).toString()}"))),
            Expanded(
                child: ReplacecmentItemsList(
              supermarketid: widget.supermarketid,
            ))
          ],
        ));
  }
}
