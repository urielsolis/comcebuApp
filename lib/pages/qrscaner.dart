import 'dart:convert';
import 'dart:io' show Platform;
import 'package:comcebu/pages/viewotherprofile.dart';
import 'package:comcebu/preferencias/preferencias_usuario.dart';
import 'package:comcebu/providers/userProvider.dart';
import 'package:comcebu/utils/dimensiones.dart';
import 'package:comcebu/widgets/appbar_widget.dart';
import 'package:comcebu/widgets/botonnavegacionwidget.dart';
import 'package:comcebu/widgets/menuwidget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
// import 'package:qrscan/qrscan.dart' as scanner;

class qrscaner extends StatefulWidget {
  qrscaner({Key? key}) : super(key: key);

  @override
  State<qrscaner> createState() => _qrscanerState();
}

class _qrscanerState extends State<qrscaner> {
  final _pref = new PreferenciasUsuario();
  String textCode = "";
  int tipoScan = 1;
  int dia = 0;
  dynamic uss;
  List<dynamic> actividades = [];
  List<dynamic> actividadesMostradas = [];
  final userProvider = new UserProvider();
  @override
  void reassemble() {
    if (_pref.usuario != "") {
      this.uss = json.decode(_pref.usuario);
      actividades = uss['Actividades'];
    }
    getDia();
    setState(() {});
    super.reassemble();
  }

  @override
  void initState() {
    if (_pref.usuario != "") {
      this.uss = json.decode(_pref.usuario);
      actividades = uss['Actividades'];
    }
    getDia();
    setState(() {});
    super.initState();
  }

  Future<Null> getDia() async {
    Map info = await userProvider.getday();
    if (info['ok']) {
      dia = int.parse(info['dia']);
      actividadesMostradas = actividades
          .where((element) => int.parse(element['Dia']) == (dia))
          .toList();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: ''),
      body: Stack(
        children: <Widget>[
          _pref.usuario != ""
              ? (this.uss['Tipo'] == "Staff"
                  ? Container(
                      width: vw(context) * 0.8,
                      margin:
                          EdgeInsets.symmetric(horizontal: vw(context) * 0.1),
                      child: Image.asset('assets/Eventos Del Día.png'),
                    )
                  : Container())
              : Container(),
          _pref.usuario != ""
              ? (this.uss['Tipo'] == "Staff"
                  ? Container(
                      margin: EdgeInsets.only(top: vh(context) * 0.1),
                      child: Column(
                        children: _mosAct(),
                      ),
                    )
                  : Column(
                      children: [
                        Container(
                          height: vh(context) * 0.35,
                        ),
                        SizedBox(
                          width: vw(context) * 0.4,
                          height: vh(context) * 0.06,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF007632),
                              onSurface: Color(0xFF007632),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  vh(context) * 0.018,
                                ),
                              ),
                            ),
                            onPressed: _scan,
                            child: Text("Scanner",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: (vw(context) * 0.05),
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.w600)),
                          ),
                        ),
                      ],
                    ))
              : Column(
                  children: [
                    Container(
                      height: vh(context) * 0.35,
                    ),
                    SizedBox(
                      width: vw(context) * 0.4,
                      height: vh(context) * 0.06,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF007632),
                          onSurface: Color(0xFF007632),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              vh(context) * 0.018,
                            ),
                          ),
                        ),
                        onPressed: _scan,
                        child: Text("Scanner",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: (vw(context) * 0.05),
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ],
                ),
        ],
      ),
      drawer: MenuWidget().createState().build(context),
      backgroundColor: Color(0xFFFBF9DE),
      bottomNavigationBar: BotonNavegacion().build(context),
      // floatingActionButton: FloatingButtonWidget().createState().build(context),
    );
  }

  List<Widget> _mosAct() {
    List<Widget> res = [];
    print(actividadesMostradas);
    actividadesMostradas.forEach((element) {
      res.add(ListTile(
        contentPadding:
            EdgeInsets.symmetric(vertical: 0, horizontal: vw(context) * 0.1),
        dense: true,
        trailing: Icon(
          Icons.qr_code_scanner,
          color: Color(0xFF007632),
        ),
        title: Text(
          element['Actividad'],
          style: TextStyle(
            color: Color(0xFF007632),
            fontSize: vw(context) * 0.04,
          ),
        ),
        subtitle: Text(
          (element['feInicio'] != null ? element['feInicio'] : '') +
              '-' +
              (element['feFin'] != null ? element['feFin'] : ''),
          style: TextStyle(
            color: Color(0xFF007632),
            fontSize: vw(context) * 0.03,
          ),
        ),
        onTap: () => _scan2(element['Id']),
      ));
    });
    return res;
  }

  Future _scan() async {
    await Permission.camera.request();
    // try {
    //   String barcode = await BarcodeScanner.scan();
    //   setState(() => this._barcode = barcode);
    // } on PlatformException catch (e) {
    //   if (e.code == BarcodeScanner.CameraAccessDenied) {
    //     setState(() {
    //       this._barcode = 'El usuario no dio permiso para el uso de la cámara!';
    //     });
    //   } else {
    //     setState(() => this._barcode = 'Error desconocido $e');
    //   }
    // } on FormatException {
    //   setState(() => this._barcode =
    //       'nulo, el usuario presionó el botón de volver antes de escanear algo)');
    // } catch (e) {
    //   setState(() => this._barcode = 'Error desconocido : $e');
    // }

    String? barcode = (await BarcodeScanner.scan()).rawContent;
    if (barcode == null) {
      print('nothing return.');
    } else {
      this.textCode = barcode;
      setState(() {});
      scanServe(this.textCode, 0);
    }
  }

  Future _scan2(int act) async {
    await Permission.camera.request();
    String? barcode = (await BarcodeScanner.scan()).rawContent;
    if (barcode == null) {
      print('nothing return.');
    } else {
      this.textCode = barcode;
      setState(() {});
      scanServe(this.textCode, act);
    }
  }

  Future scanServe(String qr, int act) async {
    if (_pref.usuario == "") {
      this.tipoScan = 2;
      print(this.tipoScan);
    } else {
      if (this.uss['Tipo'] == 'Staff') {
        this.tipoScan = 1;
      } else {
        this.tipoScan = 2;
      }
      print('la puta');
      print(this.tipoScan);
    }
    print(this.uss);
    setState(() {});
    Map info = await userProvider.qrScanner(qr, this.tipoScan, act);
    if (info['ok']) {
      Map<String, dynamic> userscan = json.decode(info['usuario'].toString());
      var persona = userscan['Nombre'];
      if (_pref.usuario == "") {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text("¿Desea iniciar session como " + persona + "?"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  // Navigator.of(ctx).pop();
                  _pref.usuario = info['usuario'];
                  _pref.idusuario = userscan['Inscrito'].toString();
                  setState(() {});
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => viewotherprofile(cli: userscan),
                    ),
                  );
                },
                child: Text("Ok"),
              ),
            ],
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => viewotherprofile(cli: userscan),
          ),
        );
      }
    } else {
      // _MostrarAlerta(context, info['mensaje']);
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(info['mensaje']),
          actions: <Widget>[],
        ),
      );
    }
  }

  Future _scanPhoto() async {
    await Permission.storage.request();
    String? barcode = (await BarcodeScanner.scan()).rawContent;
    this.textCode = barcode;
    setState(() {});
  }

  @override
  void dispose() {
    // controller?.dispose();
    super.dispose();
  }
}
