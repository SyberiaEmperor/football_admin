import 'package:flutter/material.dart';

import 'package:football_app_admin/UI/on_stadium_page/widgets/users_count_row.dart';

import 'package:football_app_admin/helpers/helpers.dart';
import 'package:football_app_admin/helpers/requests.dart';

import 'lightes_show.dart';

class LightesPage extends StatefulWidget {
  @override
  _LightesPageState createState() => _LightesPageState();
}

class _LightesPageState extends State<LightesPage> {
  List<String> _titles = ['Волна', "Звезда", "Наплыв"];
  int _value = 1;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: Container(
          alignment: Alignment.centerRight,
          child: Text(
            'Световое шоу',
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
                  'Сценарий:',
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
                      value: _value,
                      items: [
                        DropdownMenuItem(
                          child: Text(_titles[0]),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text(_titles[1]),
                          value: 2,
                        ),
                        DropdownMenuItem(
                          child: Text(_titles[2]),
                          value: 3,
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Helpers.responsiveHeight(127, context),
            ),
            GestureDetector(
              onTap: () async {
                bool result = await Requests.startLightshow(_value);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return LightShows(
                        scen: _titles[_value - 1],
                      );
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
