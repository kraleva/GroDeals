import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:grodeals/providers/supermarkets.dart';
import 'package:provider/provider.dart';
import 'package:grodeals/widgets/marketitem.dart';

class SuggestedMarketsList extends StatefulWidget {
  const SuggestedMarketsList({Key? key}) : super(key: key);

  @override
  State<SuggestedMarketsList> createState() => _SuggestedMarketsListState();
}

class _SuggestedMarketsListState extends State<SuggestedMarketsList> {
  @override
  Widget build(BuildContext context) {
    final supermarkets = Provider.of<SupermarketProvider>(context);
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Stack(children: const [
          Align(
              alignment: Alignment.centerLeft,
              child: Text("Title",
                  style: TextStyle(color: Colors.white, fontSize: 16))),
          Align(
              alignment: Alignment(0.65, -0.5),
              child: Text("Distance",
                  style: TextStyle(color: Colors.white, fontSize: 16))),
          Align(
              alignment: Alignment(0.3, -0.5),
              child: Text("Price",
                  style: TextStyle(color: Colors.white70, fontSize: 16))),
        ]),
        for (var supermarket in supermarkets.supermarkets.values)
          SupermarketItem(supermarket: supermarket)
      ],
    );
  }
}
