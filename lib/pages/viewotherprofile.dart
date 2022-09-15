import 'dart:convert';
import 'dart:io' show Platform;
import 'package:comcebu/main.dart';
import 'package:comcebu/preferencias/preferencias_usuario.dart';
import 'package:comcebu/utils/dimensiones.dart';
import 'package:comcebu/widgets/appbar_widget.dart';
import 'package:comcebu/widgets/botonnavegacionwidget.dart';
import 'package:comcebu/widgets/menuwidget.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class viewotherprofile extends StatefulWidget {
  final dynamic cli;
  viewotherprofile({Key? key, @required this.cli}) : super(key: key);

  @override
  State<viewotherprofile> createState() => _viewotherprofileState();
}

class _viewotherprofileState extends State<viewotherprofile> {
  final _pref = new PreferenciasUsuario();
  var nombre = "-";
  var telefono = "-";
  var empresa = "-";
  var email = "-";
  var pais = "bolivia";
  var qr = "-";

  @override
  void initState() {
    // TODO: implement initState
    if (_pref.usuario != "") {
      Map<String, dynamic> user = json.decode(_pref.usuario);
      if (user != null) {
        nombre = widget.cli['Nombre'];
        telefono = widget.cli['Telefono'];
        empresa = user['Empresa'];
        email = widget.cli['Email'];
        pais = widget.cli['Pais'];
        qr = widget.cli['Qr'];
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Perfil'),
      body: Stack(
        children: <Widget>[
          Container(
            clipBehavior: Clip.none,
            height: vh(context) * 0.3,
            decoration: new BoxDecoration(
              color: Color(0xFFFBF9DE),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(200),
                bottomRight: Radius.circular(200),
              ),
            ),
          ),
          Positioned(
            top: vh(context) * 0.23,
            left: ((vw(context) * 0.5) - vh(context) * 0.07),
            child: Container(
              clipBehavior: Clip.antiAlias,
              height: vh(context) * 0.125,
              width: vh(context) * 0.125,
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(vh(context) * 0.125),
                ),
              ),
              child: Image.asset(
                'assets/' + pais.toLowerCase() + '.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(child: Container()),
          Container(
            margin: EdgeInsets.only(top: vh(context) * 0.4),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 0, horizontal: vw(context) * 0.1),
                  dense: true,
                  leading: Icon(
                    Icons.person,
                    color: Color(0xFFFBF9DE),
                  ),
                  title: Text(
                    nombre,
                    style: TextStyle(
                      color: Color(0xFFFBF9DE),
                      fontSize: vw(context) * 0.045,
                    ),
                  ),
                  onTap: () => null,
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 0, horizontal: vw(context) * 0.1),
                  dense: true,
                  leading: Icon(
                    Icons.phone_iphone,
                    color: Color(0xFFFBF9DE),
                  ),
                  title: Text(
                    telefono,
                    style: TextStyle(
                      color: Color(0xFFFBF9DE),
                      fontSize: vw(context) * 0.045,
                    ),
                  ),
                  onTap: () {
                    Uri url = Uri(scheme: 'tel', path: telefono);
                    launchUrl(url);
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 0, horizontal: vw(context) * 0.1),
                  dense: true,
                  leading: Icon(
                    Icons.mail,
                    color: Color(0xFFFBF9DE),
                  ),
                  title: Text(
                    email,
                    style: TextStyle(
                      color: Color(0xFFFBF9DE),
                      fontSize: vw(context) * 0.045,
                    ),
                  ),
                  onTap: () {
                    Uri url = Uri(scheme: 'mailto', path: email);
                    launchUrl(url);
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 0, horizontal: vw(context) * 0.1),
                  dense: true,
                  leading: Icon(
                    Icons.business_outlined,
                    color: Color(0xFFFBF9DE),
                  ),
                  title: Text(
                    empresa,
                    style: TextStyle(
                      color: Color(0xFFFBF9DE),
                      fontSize: vw(context) * 0.045,
                    ),
                  ),
                  onTap: () => null,
                ),
                Container(
                  height: vh(context) * 0.03,
                ),
                SizedBox(
                  width: vw(context) * 0.77,
                  height: vh(context) * 0.06,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF007632),
                      onSurface: Color(0xFF007632),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            vh(context) * 0.018,
                          ),
                          side: BorderSide(color: Colors.white, width: 1)),
                    ),
                    onPressed: () {
                      if (Platform.isAndroid) {
                        var whatsappURlAndroid =
                            "whatsapp://send?phone=" + telefono.split(',')[0];
                        var encoded = Uri.parse(whatsappURlAndroid);
                        launchUrl(encoded);
                      }
                      if (Platform.isIOS) {
                        var whatappURLIos =
                            "https://wa.me/" + telefono.split(',')[0];
                        var encoded = Uri.parse(whatappURLIos);
                        launchUrl(encoded);
                      }
                    },
                    // No disponible
                    child: Text("Ir a WhatssApp",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: (vw(context) * 0.05),
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w600)),
                  ),
                ),
                Expanded(child: Container()),
              ],
            ),
          )
        ],
      ),
      drawer: MenuWidget().createState().build(context),
      backgroundColor: Color(0xFF005329),
      bottomNavigationBar: BotonNavegacion().build(context),
      // floatingActionButton: FloatingButtonWidget().createState().build(context),
    );
  }

  @override
  void dispose() {
    // controller?.dispose();
    super.dispose();
  }
}
