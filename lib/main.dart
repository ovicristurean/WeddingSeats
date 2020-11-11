import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:weddings_seats/di/provider_module.dart';
import 'package:weddings_seats/inherited/inherited_wedding_data.dart';
import 'package:weddings_seats/ui/screens/login_screen.dart';
import 'package:weddings_seats/util/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InheritedWeddingData(
      ProviderModule.getWeddingSeatsBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Themes.PrimaryColor,
          primaryColorDark: Themes.DarkPrimaryColor,
          primaryColorLight: Themes.LightPrimaryColor,
          accentColor: Themes.ColorAccent,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginScreen(),
    );
  }
}
