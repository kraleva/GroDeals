import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:grodeals/common_widgets/app_text.dart';
import 'package:grodeals/models/grocery_item.dart';
import 'package:grodeals/screens/product_details/product_details_screen.dart';
import 'package:grodeals/screens/shopping_list.dart';
import 'package:grodeals/widgets/grocery_item_card_widget.dart';

import '../widgets/customappbar.dart';

class CategoryItemsScreen extends StatelessWidget {
  const CategoryItemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          height: 50,
      ),
      body: 
        Column(children: <Widget> [
          getHeader(context),
          Expanded(
            child: StaggeredGridView.count(
        crossAxisCount: 4,
        staggeredTiles: beverages
            .map<StaggeredTile>((_) => const StaggeredTile.fit(2))
            .toList(),
        mainAxisSpacing: 3.0,
        crossAxisSpacing: 0.0,
        // I only need two card horizontally
        children: beverages.asMap().entries.map<Widget>((e) {
          GroceryItem groceryItem = e.value;
          return GestureDetector(
            onTap: () {
              onItemClicked(context, groceryItem);
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              child: GroceryItemCardWidget(
                item: groceryItem,
                heroSuffix: "explore_screen",
              ),
            ),
          );
        }).toList(), // add some space
      ),
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
        Center(child:AppText(
              key: UniqueKey(),
              text: "Beverages",
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

  void onItemClicked(BuildContext context, GroceryItem groceryItem) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailsScreen(
          groceryItem,
          heroSuffix: "explore_screen",
        ),
      ),
    );
  }
}
