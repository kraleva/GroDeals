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
        for (var supermarket in supermarkets.supermarkets.values)
          SupermarketItem(supermarket: supermarket)
        // Container(
        //   height: 50,
        //   color: Colors.amber[600],
        //   child: const Center(child: Text('Entry A')),
        // ),
        // Container(
        //   height: 50,
        //   color: Colors.amber[500],
        //   child: const Center(child: Text('Entry B')),
        // ),
        // Container(
        //   height: 50,
        //   color: Colors.amber[100],
        //   child: const Center(child: Text('Entry C')),
        // ),
      ],
    );
  }
}
