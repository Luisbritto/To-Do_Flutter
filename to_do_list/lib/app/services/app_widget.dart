import 'package:flutter/material.dart';
import 'package:to_do_list/app/core/database/sqlite_adm_connection.dart';
import 'package:to_do_list/app/modules/splash/splash_page.dart';

class AppWidget extends StatefulWidget {

  const AppWidget({ Key? key }) : super(key: key);

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {

  final sqliteAdmConnection = SqliteAdmConnection();

  @override
  void initState() {
    
    super.initState();
    WidgetsBinding.instance?.addObserver(sqliteAdmConnection);
  }

  @override
  void dispose() {
    
    WidgetsBinding.instance?.removeObserver(sqliteAdmConnection);
    super.dispose();
  }

   @override
   Widget build(BuildContext context) {
       return MaterialApp(
         title: 'Todo List Provider',
         home: SplashPage(),
       );
  }
}