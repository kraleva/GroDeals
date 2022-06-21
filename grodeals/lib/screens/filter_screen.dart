import 'package:flutter/material.dart';
import 'package:grodeals/common_widgets/app_button.dart';
import 'package:grodeals/common_widgets/app_text.dart';
import 'package:grodeals/styles/colors.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
        title: AppText(
          key: UniqueKey(),
          text: "Filters",
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        decoration: BoxDecoration(
          color: Color(0xFFF2F3F2),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getLabel("Categories"),
            const SizedBox(height: 15),
            const OptionItem(text: "Eggs"),
            const SizedBox(height: 15),
            const OptionItem(text: "Noodles & Pasta"),
            const SizedBox(height: 15),
            const OptionItem(text: "Chips & Crisps"),
            const SizedBox(height: 15),
            const OptionItem(text: "Fast Food"),
            const SizedBox(height: 30),
            getLabel("Brand"),
            const SizedBox(height: 15),
            const OptionItem(text: "Individual Collection"),
            const SizedBox(height: 15),
            const OptionItem(text: "Cocacola"),
            const SizedBox(height: 15),
            const OptionItem(text: "Ifad"),
            const SizedBox(height: 15),
            const OptionItem(text: "Kazi Formas"),
            const Spacer(),
            AppButton(
              key: UniqueKey(),
              label: "Apply Filter",
              fontWeight: FontWeight.w600,
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }

  Widget getLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}

class OptionItem extends StatefulWidget {
  final String text;

  const OptionItem({Key? key, this.text = "test"}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OptionItemState createState() => _OptionItemState();
}

class _OptionItemState extends State<OptionItem> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          checked = !checked;
        });
      },
      child: Row(
        children: [
          getCheckBox(),
          const SizedBox(
            width: 12,
          ),
          getTextWidget(),
        ],
      ),
    );
  }

  Widget getTextWidget() {
    return Text(
      widget.text,
      style: TextStyle(
        color: checked ? AppColors.primaryColor : Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget getCheckBox() {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      child: SizedBox(
        width: 25,
        height: 25,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                  width: checked ? 0 : 1.5, color: const Color(0xffB1B1B1)),
              borderRadius: BorderRadius.circular(8),
              color: checked ? AppColors.primaryColor : Colors.transparent),
          child: Theme(
            data: ThemeData(
              unselectedWidgetColor: Colors.transparent,
            ),
            child: Checkbox(
              value: checked,
              onChanged: (state) => setState(() => checked = !checked),
              activeColor: Colors.transparent,
              checkColor: Colors.white,
              materialTapTargetSize: MaterialTapTargetSize.padded,
            ),
          ),
        ),
      ),
    );
  }
}
