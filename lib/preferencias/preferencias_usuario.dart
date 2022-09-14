import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  var _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // GET y SET del nombre
  String get usuario {
    return _prefs.getString('usuario') ?? '';
  }

  set usuario(String value) {
    _prefs.setString('usuario', value);
  }

  // GET y SET idusuario
  String get idusuario {
    return _prefs.getString('idusuario');
  }

  set idusuario(String value) {
    _prefs.setString('idusuario', value);
  }

  // GET y SET playServices
  bool get playServices {
    return _prefs.getBool('playServices');
  }

  set playServices(bool value) {
    _prefs.setBool('playServices', value);
  }

  void deleteAll() {
    _prefs.setString('usuario', "");
    _prefs.setString('idusuario', "");
    _prefs.setBool('playServices', false);
  }
}
