import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:comcebu/preferencias/preferencias_usuario.dart';
import 'package:comcebu/utils/dimensiones.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class MenuWidget extends StatefulWidget {
  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  final _pref = new PreferenciasUsuario();
  String vers = "Version 1.0.0";
  int historyCount = 0;
  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    vers = "Version " + info.version;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Drawer build(BuildContext context) {
    final _pref = new PreferenciasUsuario();
    // historyCount = historyObserver.history.length;
    var nombre = "-";
    var media = "-";
    if (_pref.usuario != "") {
      Map<String, dynamic> user = json.decode(_pref.usuario);
      print(user);
      if (user != null) {
        nombre = user['Nombre'];
      }
    }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(height: vh(context) * 0.05),
          _pref.usuario == ""
              ? Container(
                  height: vh(context) * 0.2,
                  padding: EdgeInsets.all(vw(context) * 0.05),
                  child: Image.asset('assets/LogoVerde.png'),
                )
              : Container(
                  height: vh(context) * 0.2,
                  padding: EdgeInsets.all(vw(context) * 0.05),
                  child: Image.asset('assets/iconoverde.png'),
                ),
          _pref.usuario == ""
              ? Container()
              : Container(
                  margin: EdgeInsets.only(bottom: vh(context) * 0.03),
                  child: Text(
                    nombre,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF007632),
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
          _pref.usuario == ""
              ? Container(
                  height: vh(context) * 0.68,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: vw(context) * 0.05),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 0, horizontal: vw(context) * 0.05),
                          dense: true,
                          leading: Icon(
                            Icons.login,
                            color: Color(0xFF007632),
                          ),
                          title: Text('Iniciar Sesion',
                              style: TextStyle(
                                color: Color(0xFF007632),
                                fontSize: vw(context) * 0.045,
                                fontFamily: 'Raleway',
                              )),
                          onTap: () => Navigator.pushNamed(context, "login"),
                        ),
                        decoration: new BoxDecoration(
                          border: new Border(
                            top: new BorderSide(color: Color(0xFF007632)),
                            bottom: new BorderSide(color: Color(0xFF007632)),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Container(
                  height: vh(context) * 0.6073,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: vw(context) * 0.05),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 0, horizontal: vw(context) * 0.05),
                          dense: true,
                          leading: Icon(
                            Icons.person,
                            color: Color(0xFF007632),
                          ),
                          title: Text(
                            'Mi Perfil',
                            style: TextStyle(
                              color: Color(0xFF007632),
                              fontSize: vw(context) * 0.045,
                              fontFamily: 'Raleway',
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).popAndPushNamed('perfil');
                          },
                        ),
                        decoration: new BoxDecoration(
                          border: new Border(
                            top: new BorderSide(color: Color(0xFF007632)),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: vw(context) * 0.05),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 0, horizontal: vw(context) * 0.05),
                          dense: true,
                          leading: Icon(
                            Icons.list,
                            color: Color(0xFF007632),
                          ),
                          title: Text('Lista de Eventos',
                              style: TextStyle(
                                color: Color(0xFF007632),
                                fontSize: vw(context) * 0.045,
                                fontFamily: 'Raleway',
                              )),
                          onTap: () {
                            Navigator.of(context).popAndPushNamed('eventos');
                          },
                        ),
                        decoration: new BoxDecoration(
                          border: new Border(
                            top: new BorderSide(color: Color(0xFF007632)),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: vw(context) * 0.05),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 0, horizontal: vw(context) * 0.05),
                          dense: true,
                          leading: Icon(
                            Icons.handshake,
                            color: Color(0xFF007632),
                          ),
                          title: Text('Auspiciadores',
                              style: TextStyle(
                                color: Color(0xFF007632),
                                fontSize: vw(context) * 0.045,
                                fontFamily: 'Raleway',
                              )),
                          onTap: () {
                            Navigator.of(context)
                                .popAndPushNamed('auspiciadores');
                          },
                        ),
                        decoration: new BoxDecoration(
                          border: new Border(
                            top: new BorderSide(color: Color(0xFF007632)),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: vw(context) * 0.05),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 0, horizontal: vw(context) * 0.05),
                          dense: true,
                          leading: Icon(
                            Icons.location_on,
                            color: Color(0xFF007632),
                          ),
                          title: Text('ubicaciones',
                              style: TextStyle(
                                color: Color(0xFF007632),
                                fontSize: vw(context) * 0.045,
                                fontFamily: 'Raleway',
                              )),
                          onTap: () {
                            Navigator.of(context)
                                .popAndPushNamed('ubicaciones');
                          },
                        ),
                        decoration: new BoxDecoration(
                          border: new Border(
                            top: new BorderSide(color: Color(0xFF007632)),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: vw(context) * 0.05),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 0, horizontal: vw(context) * 0.05),
                          dense: true,
                          leading: Icon(
                            Icons.airplanemode_active_rounded,
                            color: Color(0xFF007632),
                          ),
                          title: Text('Uyuni',
                              style: TextStyle(
                                color: Color(0xFF007632),
                                fontSize: vw(context) * 0.045,
                                fontFamily: 'Raleway',
                              )),
                          onTap: () {
                            Navigator.of(context).popAndPushNamed('uyuni');
                          },
                        ),
                        decoration: new BoxDecoration(
                          border: new Border(
                            top: new BorderSide(color: Color(0xFF007632)),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: vw(context) * 0.05),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 0, horizontal: vw(context) * 0.05),
                          dense: true,
                          leading: Icon(
                            Icons.support_agent_rounded,
                            color: Color(0xFF007632),
                          ),
                          title: Text('Contactanos',
                              style: TextStyle(
                                color: Color(0xFF007632),
                                fontSize: vw(context) * 0.045,
                                fontFamily: 'Raleway',
                              )),
                          onTap: () {
                            Navigator.of(context).popAndPushNamed('contacto');
                          },
                        ),
                        decoration: new BoxDecoration(
                          border: new Border(
                            top: new BorderSide(color: Color(0xFF007632)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          Container(
            alignment: Alignment.center,
            child: Text(
              vers,
              style: TextStyle(
                color: Color(0xFF007632),
                fontSize: vw(context) * 0.037,
                fontFamily: 'Raleway',
              ),
            ),
          ),
          _pref.usuario == ""
              ? Container()
              : Container(
                  height: vh(context) * 0.06,
                  padding: EdgeInsets.only(left: vw(context) * 0.14),
                  color: Color(0xFF007632),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 0, horizontal: vw(context) * 0.05),
                    dense: true,
                    leading: Icon(
                      Icons.logout,
                      color: Color(0xFFFFFFFF),
                    ),
                    title: Text('Cerrar Sesion',
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: vw(context) * 0.045,
                          fontFamily: 'Raleway',
                        )),
                    onTap: () {
                      _pref.deleteAll();
                      Navigator.of(context).pushNamed("/");
                    },
                  ),
                ),
        ],
      ),
    );
  }

  Widget _getBotonCerrarSesion(
      BuildContext context, PreferenciasUsuario _pref) {
    return Container(
      height: vw(context) * 0.1,
      width: vw(context) * 0.366,
      child: ElevatedButton(
        onPressed: () {
          _pref.deleteAll();
          // Navigator.of(context).pushNamed("/");
          Navigator.of(context).popAndPushNamed('scaner');
        },
        style: ElevatedButton.styleFrom(
          primary: Color.fromRGBO(26, 24, 24, 1),
        ),
        child: Text(
          "Cerrar Sesion",
          style: TextStyle(
            color: Colors.white,
            fontSize: vw(context) * 0.04,
            fontFamily: 'Raleway',
          ),
        ),
      ),
    );
  }

  Widget button(BuildContext context, PreferenciasUsuario _pref) {
    if (_pref.usuario != "") {
      return Container(
        height: vw(context) * 0.1,
        width: vw(context) * 0.366,
        child: ElevatedButton(
          onPressed: () {
            _pref.deleteAll();
            Navigator.of(context).pushNamed("/");
          },
          style: ElevatedButton.styleFrom(
            primary: Color.fromRGBO(26, 24, 24, 1),
          ),
          child: Text(
            "Cerrar Sesión",
            style: TextStyle(
              color: Colors.white,
              fontSize: vw(context) * 0.04,
              fontFamily: 'Raleway',
            ),
          ),
        ),
      );
    } else {
      return Container(
        height: vw(context) * 0.1,
        width: vw(context) * 0.366,
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/");
          },
          style: ElevatedButton.styleFrom(
            primary: Color.fromRGBO(26, 24, 24, 1),
          ),
          child: Text(
            "Iniciar Sesión",
            style: TextStyle(
              color: Colors.white,
              fontSize: vw(context) * 0.04,
              fontFamily: 'Raleway',
            ),
          ),
        ),
      );
    }
  }
}
