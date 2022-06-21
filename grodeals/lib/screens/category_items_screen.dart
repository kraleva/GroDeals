import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:grodeals/common_widgets/app_text.dart';
import 'package:grodeals/models/grocery_item.dart';
import 'package:grodeals/screens/product_details/product_details_screen.dart';
import 'package:grodeals/screens/shopping_list.dart';
import 'package:grodeals/widgets/grocery_item_card_widget.dart';

class CategoryItemsScreen extends StatelessWidget {
  const CategoryItemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.only(left: 25),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CustomShoppingList(key: UniqueKey())),
              );
            },
            child: Container(
              padding: EdgeInsets.only(right: 25),
              child: Icon(
                Icons.sort,
                color: Colors.black,
              ),
            ),
          ),
        ],
        title: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: AppText(
            key: UniqueKey(),
            text: "Beverages",
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: StaggeredGridView.count(
        crossAxisCount: 4,
        staggeredTiles:
            beverages.map<StaggeredTile>((_) => StaggeredTile.fit(2)).toList(),
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
