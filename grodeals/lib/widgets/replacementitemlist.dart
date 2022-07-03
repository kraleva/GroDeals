import 'package:flutter/material.dart';
import 'package:grodeals/providers/listprovider.dart';
import 'package:grodeals/providers/supermarkets.dart';
import 'package:provider/provider.dart';
import 'package:grodeals/widgets/replacementitem.dart';

class ReplacecmentItemsList extends StatefulWidget {
  final String supermarketid;
  const ReplacecmentItemsList({Key? key, required this.supermarketid})
      : super(key: key);

  @override
  State<ReplacecmentItemsList> createState() => _ReplacementItemsListState();
}

class _ReplacementItemsListState extends State<ReplacecmentItemsList> {
  @override
  Widget build(BuildContext context) {
    final supermarkets = Provider.of<SupermarketProvider>(context);
    final products = Provider.of<ListProvider>(context);
    final supermarketUnavailable =
        supermarkets.getUnavailable(widget.supermarketid);
    return ListView(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      children: <Widget>[
        (supermarketUnavailable.isNotEmpty)
            ? Stack(children: const [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Missing item",
                        style: TextStyle(color: Colors.white, fontSize: 18))),
                Align(
                    alignment: Alignment(0.96, -0.5),
                    child: Text("See suggestions",
                        style: TextStyle(color: Colors.white, fontSize: 16))),
              ])
            : const SizedBox(height: 1),
        for (var unavailable in supermarketUnavailable)
          ReplacementItem(
            supermarketid: widget.supermarketid,
            category: products.getCategory(unavailable),
          )
      ],
    );
  }
}
