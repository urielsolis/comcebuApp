import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:comcebu/providers/userProvider.dart';
import 'package:comcebu/utils/dimensiones.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final userProvider = new UserProvider();
  var loading = false;
  var _isButtonDisabled = false;
  var _isButtonFBDisabled = false;
  var _isButtonGODisabled = false;
  var _isButtonAPPleDisabled = false;
  var _isAppleOS = false;
  int idUserActual = 0;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    verificarPlatform();
  }

  verificarPlatform() {
    // _isAppleOS = Platform.isIOS;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double paddin = width * 0.03;
    return Scaffold(
        backgroundColor: Color(0xFF007632),
        body: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: height * 0.04,
                  ),
                  _getLogo(context),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Container(
                      width: width * 0.77,
                      child: Column(
                        children: <Widget>[
                          _getFielUser(context),
                          _getFieldContrasenia(context),
                          SizedBox(
                            height: height * 0.05,
                          ),
                          _getButtonIniciarSession(context),
                          SizedBox(
                            height: height * 0.035,
                          ),
                          Text(
                            'Esta funcionalidad es solo para Staff.',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: height * 0.24,
                          ),
                        ],
                      )),
                ],
              ),
              loading == true
                  ? new Positioned(
                      bottom: 0.0,
                      top: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        height: vh(context) * 1.2,
                        transform: Matrix4.translationValues(
                            0.0, vh(context) * 0.035, 0.0),
                        decoration: BoxDecoration(color: Colors.black26),
                        clipBehavior: Clip.antiAlias,
                        alignment: Alignment.center,
                        child: SpinKitFadingCircle(
                          color: Colors.white,
                          size: vw(context) * 0.15,
                        ),
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ));
  }

  Widget _getFielUser(BuildContext context) {
    return Container(
      width: vw(context) * 0.77,
      height: vh(context) * 0.06,
      margin: EdgeInsets.only(top: vh(context) * 0.03),
      child: TextField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: vw(context) * 0.03),
          filled: true,
          fillColor: Colors.white,
          hintText: "Usuario",
          hintStyle: TextStyle(
            fontSize: ((vw(context) * 0.045)),
            fontFamily: 'Raleway',
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(vh(context) * 0.018),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(vh(context) * 0.018),
          ),
        ),
        style: TextStyle(
          fontSize: (vw(context) * 0.045),
          fontFamily: 'Raleway',
        ),
      ),
    );
  }

  Widget _getFieldContrasenia(BuildContext context) {
    return Container(
      width: vw(context) * 0.77,
      height: vh(context) * 0.06,
      margin: EdgeInsets.only(top: vh(context) * 0.02),
      child: TextField(
        controller: _passwordController,
        obscureText: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: vw(context) * 0.03),
          filled: true,
          fillColor: Colors.white,
          hintText: "Contraseña",
          hintStyle: TextStyle(
            fontSize: (vw(context) * 0.045),
            fontFamily: 'Raleway',
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(vh(context) * 0.018),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(vh(context) * 0.018),
          ),
        ),
        style: TextStyle(
          fontSize: ((vw(context) * 0.045)),
          fontFamily: 'Raleway',
        ),
      ),
    );
  }

  Widget _getButtonIniciarSession(BuildContext context) {
    return SizedBox(
      width: vw(context) * 0.77,
      height: vh(context) * 0.07,
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
        onPressed: _isButtonDisabled
            ? null
            : () async {
                var email = _emailController.text;
                var password = _passwordController.text;
                setState(() {
                  loading = true;
                  _isButtonDisabled = true;
                });
                Map info = await userProvider.login(email, password);
                setState(() {
                  loading = false;
                  _isButtonDisabled = false;
                });
                if (info['ok']) {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('scaner', (route) => false);
                } else {
                  _MostrarAlerta(context, info['mensaje']);
                }
              },
        child: Text("INICIAR SESIÓN",
            style: TextStyle(
                color: Colors.white,
                fontSize: (vw(context) * 0.05),
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w600)),
      ),
    );
  }

  Widget _getTextRegistrar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "registro");
          },
          child: Text(
            "¿No tienes cuenta?. ",
            style: TextStyle(
              fontSize: (vw(context) * 0.036),
              color: Colors.white,
              fontFamily: 'Raleway',
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "registro");
          },
          child: Text(
            "Registrate aquí .",
            style: TextStyle(
                fontSize: (vw(context) * 0.036),
                color: Colors.white,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }

  Widget _getLogo(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(
            top: vh(context) * 0.15, bottom: vh(context) * 0.03),
        height: vh(context) * 0.15,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/LogoBlanco1.png"),
        )),
      ),
    );
  }

  void _MostrarAlerta(BuildContext context, String mensaje) {
    Fluttertoast.showToast(
        msg: mensaje,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
