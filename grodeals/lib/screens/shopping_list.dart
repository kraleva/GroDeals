import 'package:flutter/material.dart';
import 'package:grodeals/widgets/shoppinglist.dart';
import 'package:grodeals/widgets/suggestedmarketslist.dart';
import 'package:grodeals/screens/explore_screen.dart';

import '../common_widgets/app_text.dart';
import '../widgets/customappbar.dart';

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
        appBar: const CustomAppBar(
          height: 50,
      ),
      body: 
        Column(children: <Widget> [
          getHeader(context),
          Expanded(
            child: Column(
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
        )
          )
        ])
    );
  }

  Widget getHeader(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Center(child: AppText(
              key: UniqueKey(),
              text: "Shopping List",
              fontWeight: FontWeight.bold,
              fontSize: 20,
              textAlign: TextAlign.center
            )
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
