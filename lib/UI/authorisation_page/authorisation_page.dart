import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app_admin/UI/authorisation_page/widgets/auth_text_field.dart';
import 'package:football_app_admin/UI/navigation_page/navigation_page.dart';
import 'package:football_app_admin/UI/navigation_page/widgets/loading_screen.dart';
import 'package:football_app_admin/blocs/auth_bloc/auth_bloc.dart';
import 'package:football_app_admin/blocs/chants_bloc/chants_bloc.dart';
import 'package:football_app_admin/helpers/helpers.dart';

// ignore: must_be_immutable
class AuthorisationPage extends StatelessWidget {
  final TextEditingController loginController = new TextEditingController();
  final TextEditingController pswdController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);

    /// Слушатель стейтов
    void _listener(BuildContext context, AuthState state) {
      if (state is AuthInitial && state.entered) {
        ChantsBloc chantsBloc = BlocProvider.of<ChantsBloc>(context);
        // Если пользователь авторизован, то переходим на главный экран
        chantsBloc.add(LoadChants());
        final page = BlocProvider.value(
          value: chantsBloc,
          child: NavPage(),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => page,
          ),
        );
      }
      if (state is AuthInitial && state.error) {
        // Если ошибка, то выводим её
        if (state.errorText.isNotEmpty)
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.errorText,
                style: TextStyle(
                  fontSize: Helpers.responsiveHeight(20, context),
                  fontWeight: FontWeight.bold,
                  fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
                  color: Colors.white,
                ),
              ),
            ),
          );
      }
    }

    Widget _mapStateToScreen(AuthBloc authBloc) {
      final AuthState currentState = authBloc.state;
      if (currentState is AuthInitial) {
        // Основной экран
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Helpers.responsiveHeight(80, context),
              ),
              Container(
                width: double.infinity,
                height: Helpers.responsiveHeight(75, context),
                margin: EdgeInsets.symmetric(
                  horizontal: Helpers.responsiveWidth(10, context),
                ),
                /*child: Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.cover,
                ),*/ //TODO: LOGO
              ),
              SizedBox(
                height: Helpers.responsiveHeight(90, context),
              ),
              AuthTextField(loginController, pswdController),
              SizedBox(
                height: Helpers.responsiveHeight(80, context),
              ),
              GestureDetector(
                onTap: () {
                  authBloc.add(
                    (LogIn(
                        loginController.value.text, pswdController.value.text)),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: Helpers.responsiveHeight(25, context),
                  ),
                  width: Helpers.responsiveWidth(212, context),
                  height: Helpers.responsiveHeight(52, context),
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'Войти',
                      style: TextStyle(
                        fontFamily:
                            Theme.of(context).textTheme.bodyText1.fontFamily,
                        color: Theme.of(context).textTheme.bodyText1.color,
                        fontSize: Helpers.responsiveWidth(18, context),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }
      if (currentState is AuthLoading) {
        // Загрузка
        return loadingScreen(caption: currentState.caption, context: context);
      }
      return Text('Что-то пошло не так');
    }

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: BlocConsumer<AuthBloc, AuthState>(
            listener: _listener,
            builder: (context, state) {
              return _mapStateToScreen(authBloc);
            },
          ),
        ),
      ),
    );
  }
}
