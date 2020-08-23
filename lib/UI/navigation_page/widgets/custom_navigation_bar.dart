import 'package:flutter/material.dart';
import 'package:football_app_admin/UI/on_stadium_page/on_stadium_page.dart';
import 'package:football_app_admin/helpers/helpers.dart';

import '../navbar_item_data.dart';
import 'navbar_button.dart';

class CustomNavigationBar extends StatelessWidget {
  final ValueChanged<int> itemTapped;
  final int currentIndex;
  final List<NavbarItemData> items;

  const CustomNavigationBar(
      {this.currentIndex = 0, this.itemTapped, this.items});

  NavbarItemData get selectedItem =>
      currentIndex >= 0 && currentIndex < items.length
          ? items[currentIndex]
          : null;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    List<Widget> buttons = items.map(
      (data) {
        if (data.flag == true) {
          return SizedBox(
            width: Helpers.responsiveWidth(40, context),
          );
        }
        return NavbarButton(
          data: data,
          isSelected: data == selectedItem,
          onTap: () {
            var index = items.indexOf(data);
            if (index == 2) {
              print(1);
            } else {
              itemTapped(index);
            }
          },
        );
      },
    ).toList();
    return Container(
      height: Helpers.responsiveHeight(64, context),
      padding: EdgeInsets.symmetric(
        horizontal: Helpers.responsiveWidth(10, context),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //TODO: Поиграть с ним, сделать красивым
        children: buttons,
      ),
    );
  }
}
