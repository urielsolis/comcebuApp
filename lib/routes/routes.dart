import 'package:comcebu/pages/Contacto.dart';
import 'package:comcebu/pages/auspiciadores.dart';
import 'package:comcebu/pages/eventos.dart';
import 'package:comcebu/pages/login.dart';
import 'package:comcebu/pages/perfil.dart';
import 'package:comcebu/pages/qrscaner.dart';
import 'package:comcebu/pages/ubicaciones.dart';
import 'package:comcebu/pages/uyuni.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => qrscaner(),
    'scaner': (BuildContext context) => qrscaner(),
    'login': (BuildContext context) => LoginPage(),
    'perfil': (BuildContext context) => perfil(),
    'eventos': (BuildContext context) => eventos(),
    'auspiciadores': (BuildContext context) => auspicia(),
    'ubicaciones': (BuildContext context) => ubicaciones(),
    'uyuni': (BuildContext context) => uyuni(),
    'contacto': (BuildContext context) => contacto(),
  };
}
