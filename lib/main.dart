import 'package:flutter/material.dart';
import 'package:sibeton/models/app_state.dart';
import 'package:sibeton/redux/actions.dart';
import 'package:sibeton/redux/reducers.dart';
import 'package:sibeton/pages/login_page.dart';
import 'package:sibeton/pages/products_page.dart';
import 'package:sibeton/pages/register_page.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

void main() {
  final store = Store<AppState>(appReducer,
      initialState: AppState.initial(), middleware: [thunkMiddleware]);
  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  MyApp({this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
            title: 'Sibeton E-Commerce',
            routes: {
              '/products': (BuildContext context) => ProductsPage(onInit: () {
                    StoreProvider.of<AppState>(context).dispatch(getUserAction);
                  }),
              '/login': (BuildContext context) => LoginPage(),
              '/register': (BuildContext context) => RegisterPage()
            },
            theme: ThemeData(
                brightness: Brightness.light,
                primaryColor: Colors.red[800],
                accentColor: Colors.deepOrange[300],
                textTheme: TextTheme(
                    headline:
                        TextStyle(fontSize: 62.0, fontWeight: FontWeight.bold),
                    title:
                        TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
                    body1: TextStyle(fontSize: 18.0))),
            home: RegisterPage()));
  }
}
