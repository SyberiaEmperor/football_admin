import 'package:flutter/material.dart';
import 'package:football_app_admin/UI/chants_pages/chants_page.dart';
import 'package:football_app_admin/UI/chants_pages/light.dart';
import 'package:football_app_admin/UI/on_stadium_page/widgets/flashmob.dart';
import 'package:football_app_admin/UI/on_stadium_page/widgets/users_count_row.dart';
import 'package:football_app_admin/helpers/helpers.dart';

class OnStadiumPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 10,
        leading: Padding(
          padding: EdgeInsets.only(
            left: Helpers.responsiveWidth(12, context),
          ),
          child: Image.asset(
            'assets/logo.png',
            width: Helpers.responsiveWidth(46, context),
            height: Helpers.responsiveHeight(46, context),
          ),
        ),
        title: Container(
            width: Helpers.responsiveWidth(250, context),
            height: Helpers.responsiveWidth(31, context),
            child: Text(
              'На стадионе',
              textAlign: TextAlign.right,
              style: TextStyle(
                  fontSize: 21,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
            )),
      ),
      body: Stack(children: [
        Positioned(
          top: Helpers.responsiveHeight(20, context),
          left: Helpers.responsiveHeight(24, context),
          right: Helpers.responsiveHeight(24, context),
          child: UsersCountRow(),
        ),
        Positioned(
          top: Helpers.responsiveHeight(91, context),
          left: Helpers.responsiveHeight(28, context),
          right: Helpers.responsiveHeight(28, context),
          child: Container(
              alignment: Alignment.center,
              height: Helpers.responsiveHeight(114, context),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(Helpers.responsiveHeight(8, context))),
              ),
              child: Text(
                'Болельщики ждут, запустите один из флешмобов',
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xffA3AEB3),
                ),
                textAlign: TextAlign.center,
              )),
        ),
        Positioned(
          top: Helpers.responsiveHeight(236, context),
          child: Column(children: [
            Flashmob(
                text: 'Фанатская кричалка',
                onTap: () => {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ChantsPage(),
                        ),
                      )
                    },
                asset: 'assets/bolely.png'),
            Flashmob(
                text: 'Световое шоу',
                onTap: () => {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LightesPage(),
                        ),
                      ),
                    },
                asset: 'assets/light_show.png'),
          ]),
        )
      ]),
    );
  }
}
