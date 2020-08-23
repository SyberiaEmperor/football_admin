import 'package:flutter/material.dart';
import 'package:football_app_admin/helpers/requests.dart';

class MessagePage extends StatelessWidget {
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    void showAlert(bool success) {
      //TODO: Доработать алёрт.
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: success ? Colors.green[200] : Colors.red[200],
              content: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Column(
                  children: <Widget>[
                    Container(
                        decoration: new BoxDecoration(
                          color: Colors.white10,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(success ? Icons.done : Icons.clear)),
                    Text(success
                        ? 'Сообщение успешно разослано'
                        : "Что-то пошло не так во время рассылки. Попробуйте позже."),
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text("Ок"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          });
    }

    void _buttonPressed(TextEditingController text) async {
      if (text.value.text.trim().isEmpty) {
        //showAlert('Вы не можете отправить пустое сообщение!');
        return;
      } else {
        bool result = await Requests.sendMessage(text.value.text);
        showAlert(result);
        if (result) {
          _textEditingController.clear();
        }
      }
    }

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 100,
            width: 100,
            child: TextFormField(
              //TODO: Сделать так, чтобы на новую строчку переходил
              controller: _textEditingController,
            ),
          ),
          FloatingActionButton(
              heroTag: 14,
              onPressed: () => _buttonPressed(_textEditingController)),
        ],
      ),
    );
  }
}
