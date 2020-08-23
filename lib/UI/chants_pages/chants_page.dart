import 'package:flutter/material.dart';
import 'package:football_app_admin/UI/on_stadium_page/widgets/users_count_row.dart';
import 'package:football_app_admin/helpers/helpers.dart';
import 'package:football_app_admin/helpers/requests.dart';
import 'package:football_app_admin/models/chants.dart';

import '../../main.dart';
import 'chant_page.dart';

class ChantsPage extends StatefulWidget {
  @override
  _ChantsPageState createState() => _ChantsPageState();
}

class _ChantsPageState extends State<ChantsPage> {
  int _chant;
  Chants _selectedChant;
  List<Chants> _chants;
  bool _lightshow = false;
  bool _checked = false;
  @override
  void initState() {
    _chants = MyApp.chantsBloc.chants;
    _selectedChant = _chants[0];
    _chant = _chants.first.id - 1;
    super.initState();
  }

  List<DropdownMenuItem> _getItems() {
    List<DropdownMenuItem> _list = [];
    for (var i in _chants) {
      _list.add(
        DropdownMenuItem(
          value: i.id - 1,
          child: Text(i.title),
        ),
      );
    }
    return _list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: Container(
          alignment: Alignment.centerRight,
          child: Text(
            'Фанатская кричалка',
            style: TextStyle(
              color: Colors.black,
              fontSize: Helpers.responsiveHeight(21, context),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        leading: FlatButton(
          onPressed: Navigator.of(context).pop,
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: Helpers.responsiveHeight(24, context),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Helpers.responsiveWidth(24, context),
        ),
        child: Column(
          children: [
            SizedBox(
              height: Helpers.responsiveHeight(20, context),
            ),
            UsersCountRow(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
            ),
            SizedBox(
              height: Helpers.responsiveHeight(45, context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Кричалка:',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: Helpers.responsiveHeight(18, context),
                  ),
                ),
                Container(
                  color: Color(0xffC4C4C4),
                  height: Helpers.responsiveWidth(31, context),
                  width: Helpers.responsiveWidth(165, context),
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: DropdownButton(
                      value: _chant,
                      items: _getItems(),
                      onChanged: (value) {
                        setState(() {
                          _selectedChant = _chants[value];
                          print(value);
                          _chant = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Helpers.responsiveHeight(20, context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Световое сопровождение',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: Helpers.responsiveHeight(18, context),
                  ),
                ),
                Switch(
                  value: _lightshow,
                  onChanged: (_) => setState(() {
                    _lightshow = !_lightshow;
                  }),
                )
              ],
            ),
            SizedBox(
              height: Helpers.responsiveHeight(107, context),
            ),
            GestureDetector(
              onTap: () async {
                bool result = await Requests.startChant(
                    _selectedChant.id,
                    _lightshow
                        ? 1
                        : 0); //TODO: В зависимости от результата переходит на след страницу или же показывать алёрт
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return ChantPage(_selectedChant);
                    },
                  ),
                );
              },
              child: Container(
                width: Helpers.responsiveHeight(250, context),
                height: Helpers.responsiveHeight(250, context),
                decoration: BoxDecoration(
                  color: Color(0xff033452),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    'ЗАПУСТИТЬ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Helpers.responsiveHeight(28, context),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
