import 'package:comcebu/pages/qrscaner.dart';
import 'package:comcebu/preferencias/preferencias_usuario.dart';
import 'package:comcebu/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          canvasColor: Color(0xFFFBF9DE), primaryColor: Color(0xFF007632)),
      debugShowCheckedModeBanner: false,
      title: 'Comcebu',
      initialRoute: "scaner",
      routes: getApplicationRoutes(),
      // navigatorObservers: [NavigationHistoryObserver()],
      onGenerateRoute: (settings) {
        print('Ruta llamada: $settings.name');
        return MaterialPageRoute(builder: (context) => qrscaner());
      },
    );
  }
}
