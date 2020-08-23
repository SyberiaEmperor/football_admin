import 'package:flutter/material.dart';
import 'package:football_app_admin/UI/on_stadium_page/widgets/users_count_row.dart';
import 'package:football_app_admin/helpers/helpers.dart';
import 'package:football_app_admin/models/chants.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

import 'chants_page.dart';

class ChantPage extends StatefulWidget {
  const ChantPage(this.chant);
  final Chants chant;

  @override
  _ChantPageState createState() => _ChantPageState();
}

class _ChantPageState extends State<ChantPage> {
  @override
  void initState() {
    super.initState();
  }

  bool _inProccess = true;
  final CountdownController countdownController = CountdownController();

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
        leading: Image.asset(
          'assets/logo.png',
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
              height: Helpers.responsiveHeight(40, context),
            ),
            Container(
              width: Helpers.responsiveWidth(304, context),
              child: Text(
                _inProccess ? 'Сейчас запущена кричалка' : "Событие завершено:",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xffA3AEB3),
                  fontSize: Helpers.responsiveHeight(24, context),
                ),
              ),
            ),
            SizedBox(
              height: Helpers.responsiveHeight(4, context),
            ),
            Container(
              width: Helpers.responsiveWidth(304, context),
              child: Text(
                '"${widget.chant?.title}"',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xffA3AEB3),
                  fontSize: Helpers.responsiveHeight(24, context),
                ),
              ),
            ),
            SizedBox(
              height: Helpers.responsiveHeight(60, context),
            ),
            Countdown(
              controller: countdownController,
              onFinished: () {
                setState(() {
                  _inProccess = false;
                });
              },
              seconds: widget.chant.duration,
              build: (context, time) => Text(
                "00:${time.truncate() < 10 ? "0" + time.truncate().toString() : time.truncate()}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Helpers.responsiveHeight(64, context),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: Helpers.responsiveHeight(150, context),
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                width: Helpers.responsiveWidth(212, context),
                height: Helpers.responsiveHeight(64, context),
                decoration: BoxDecoration(
                  color: Color(0xff033452),
                  borderRadius: BorderRadius.circular(
                    Helpers.responsiveHeight(8, context),
                  ),
                ),
                child: Center(
                  child: Text(
                    _inProccess ? 'Остановить' : 'Назад',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Helpers.responsiveHeight(18, context),
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
