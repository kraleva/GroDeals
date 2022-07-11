import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:grodeals/common_widgets/app_text.dart';
import 'package:grodeals/models/category_item.dart';
import 'package:grodeals/widgets/category_item_card_widget.dart';
import 'package:grodeals/widgets/customappbar.dart';
import 'package:grodeals/widgets/search_bar_widget.dart';

import 'category_items_screen.dart';

List<Color> gridColors = [
  const Color.fromARGB(255, 253, 201, 145),
];

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          height: 50,
        ),
        body: SafeArea(
          child: Column(
            children: [
              getHeader(),
              Expanded(
                child: getStaggeredGridView(context),
              ),
            ],
          ),
        ));
  }

  Widget getHeader() {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Center(
          child: AppText(
            key: UniqueKey(),
            text: "Find Products",
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SearchBarWidget(),
        ),
      ],
    );
  }

  Widget getStaggeredGridView(BuildContext context) {
    return StaggeredGridView.count(
      crossAxisCount: 4,

      //Here is the place that we are getting flexible/ dynamic card for various images
      staggeredTiles: categoryItemsDemo
          .map<StaggeredTile>((_) => const StaggeredTile.fit(2))
          .toList(),
      mainAxisSpacing: 3.0,
      crossAxisSpacing: 4.0,
      children: categoryItemsDemo.asMap().entries.map<Widget>((e) {
        int index = e.key;
        CategoryItem categoryItem = e.value;
        return GestureDetector(
          onTap: () {
            onCategoryItemClicked(context, categoryItem);
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            child: CategoryItemCardWidget(
              item: categoryItem,
              color: gridColors[index % gridColors.length],
            ),
          ),
        );
      }).toList(), // add some space
    );
  }

  void onCategoryItemClicked(BuildContext context, CategoryItem categoryItem) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) {

        return CategoryItemsScreen(categoryItem: categoryItem,);
      },
    ));
  }
}
