import 'package:flutter/material.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';
import 'package:football_app_admin/UI/chants_pages/chants_page.dart';
import 'package:football_app_admin/UI/message_page/message_page.dart';
import 'package:football_app_admin/UI/on_stadium_page/on_stadium_page.dart';
import 'package:football_app_admin/helpers/helpers.dart';

import '../../main.dart';
import 'navbar_item_data.dart';
import 'widgets/custom_navigation_bar.dart';

class NavPage extends StatefulWidget {
  @override
  _NavPageState createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  GifController _controller;
  void _tapHandler(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<NavbarItemData> _items;

  List<Widget> pages = [
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];
  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  void initState() {
    _controller = GifController(vsync: this);
    _items = [
      NavbarItemData(icon: 'home', text: "Дом"),
      NavbarItemData(icon: 'ladder', text: "Лидеры"),
      NavbarItemData(icon: 'ladder', text: "Matches", flag: true),
      NavbarItemData(icon: 'market', text: "Магазин"),
      NavbarItemData(icon: 'profile', text: "профиль"),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: Добавить заголовки, типа "Рассылка" и "Кричалки" для 1 и 2 стр соответственно
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => OnStadiumPage(),
          ),
        ),
        child: GifImage(
          width: Helpers.responsiveHeight(26, context),
          height: Helpers.responsiveHeight(26, context),
          image: AssetImage('assets/ball.gif'),
          controller: _controller
            ..repeat(
              min: 0,
              max: 28,
              period: Duration(milliseconds: 1300),
            ),
        ),
      ),
      key: MyApp.globalKey,
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _selectedIndex,
        itemTapped: _tapHandler,
        items: _items,
      ),
      body: Center(
        child: IndexedStack(
          children: pages,
          index: _selectedIndex,
        ),
      ),
    );
  }
}
