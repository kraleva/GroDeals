import 'package:flutter/material.dart';
import 'package:grodeals/common_widgets/app_text.dart';
import 'package:grodeals/models/grocery_item.dart';
import 'package:grodeals/styles/colors.dart';
import "package:grodeals/providers/supermarkets.dart";
import 'package:provider/provider.dart';
import 'package:grodeals/providers/listprovider.dart';

class GroceryItemCardWidget extends StatelessWidget {
  const GroceryItemCardWidget(
      {Key? key, required this.item, required this.heroSuffix})
      : super(key: key);
  final GroceryItem item;
  final String heroSuffix;

  final double width = 174;
  final double height = 250;
  final Color borderColor = const Color(0xffE2E2E2);
  final double borderRadius = 18;

  @override
  Widget build(BuildContext context) {
    final supermarkets = Provider.of<SupermarketProvider>(context);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
        ),
        borderRadius: BorderRadius.circular(
          borderRadius,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Hero(
                  tag: "GroceryItem:${item.name}-$heroSuffix",
                  child: imageWidget(),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            AppText(
              text: item.name,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            AppText(
              text: item.description,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF7C7C7C),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                (supermarkets.getLowestPriceForProduct(item.id)[1] == true)
                    ? Text(
                        supermarkets
                            .getLowestPriceForProduct(item.id)[2]
                            .toString(),
                        style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.black,
                            fontSize: 18),
                      )
                    : const SizedBox(
                        width: 0,
                      ),
                AppText(
                  text:
                      "\$${supermarkets.getLowestPriceForProduct(item.id)[0].toStringAsFixed(2)}",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => {
                    Provider.of<ListProvider>(context, listen: false)
                        .addItemToList(item),
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                              title: const Text('Item added'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ))
                  },
                  child: addWidget(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget imageWidget() {
    return Image.asset(item.imagePath);
  }

  Widget addWidget() {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          color: AppColors.primaryColor),
      child: const Center(
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 25,
        ),
      ),
    );
  }
}
