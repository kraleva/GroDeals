import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:grodeals/providers/supermarkets.dart";
import 'package:grodeals/widgets/shoppinglist_supermarket.dart';
import 'package:provider/provider.dart';
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
                    alignment: const Alignment(0.90, -0.99),
                    child: Text(
                        "Price ${supermarkets.getPrice(widget.supermarketid).toString()} €\nDistance ${supermarkets.getDistance(widget.supermarketid).toString()} km",
                        style: GoogleFonts.acme(
                            color: Colors.white, fontSize: 20)),
                  )),
            Expanded(
                child: ReplacecmentItemsList(
              supermarketid: widget.supermarketid,
            ))
          ],
        ));
  }
}
