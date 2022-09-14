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
import 'package:qrscan/qrscan.dart' as scanner;

class qrscaner extends StatefulWidget {
  qrscaner({Key? key}) : super(key: key);

  @override
  State<qrscaner> createState() => _qrscanerState();
}

class _qrscanerState extends State<qrscaner> {
  // final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  // Barcode? result;
  // QRViewController? controller;
  final _pref = new PreferenciasUsuario();
  String textCode = "";
  final userProvider = new UserProvider();
  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    // if (Platform.isAndroid) {
    //   controller!.pauseCamera();
    // } else if (Platform.isIOS) {
    //   controller!.resumeCamera();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: ''),
      body: Stack(
        children: <Widget>[
          // Expanded(
          //   flex: 5,
          //   child: QRView(
          //     key: qrKey,
          //     onQRViewCreated: _onQRViewCreated,
          //   ),
          // ),
          // Expanded(
          //   flex: 1,
          //   child: Center(
          //     child: (result != null)
          //         ? Text(
          //             'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
          //         : Text('Scan a code'),
          //   ),
          // ),
          Column(
            children: [
              Container(
                height: vh(context) * 0.05,
              ),
              Text(
                'Seleccione la opcion para leer el qr de acceso.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
              Container(
                height: vh(context) * 0.02,
              ),
              Row(
                children: [
                  Expanded(child: Container()),
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
                      child: Text("Camara",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: (vw(context) * 0.05),
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                  Expanded(child: Container()),
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
                      onPressed: _scanPhoto,
                      child: Text("storage",
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
            ],
          ),
          // Expanded(
          //   flex: 1,
          //   child: Center(
          //     child: (textCode != "") ? Text(textCode) : Text('Scan a code'),
          //   ),
          // ),
        ],
      ),
      drawer: MenuWidget().createState().build(context),
      backgroundColor: Color(0xFFFBF9DE),
      bottomNavigationBar: BotonNavegacion().build(context),
      // floatingActionButton: FloatingButtonWidget().createState().build(context),
    );
  }

  // void _onQRViewCreated(QRViewController controller) {
  //   this.controller = controller;
  //   controller.scannedDataStream.listen((scanData) {
  //     setState(() {
  //       result = scanData;
  //     });
  //   });
  // }

  Future _scan() async {
    await Permission.camera.request();
    String? barcode = await scanner.scan();
    if (barcode == null) {
      print('nothing return.');
    } else {
      this.textCode = barcode;
      setState(() {});
      scanServe(this.textCode);
    }
  }

  Future scanServe(String qr) async {
    Map info = await userProvider.qrScanner(qr);
    if (info['ok']) {
      // Navigator.of(context).pushNamedAndRemoveUntil('scaner', (route) => false);
      Map<String, dynamic> userscan = json.decode(info['usuario'].toString());
      var persona = userscan['Nombre'];
      if (_pref.usuario == "") {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text("¿Desea iniciar session como " + persona + "?"),
            actions: <Widget>[
              FlatButton(
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
    String barcode = await scanner.scanPhoto();
    this.textCode = barcode;
    setState(() {});
  }

  @override
  void dispose() {
    // controller?.dispose();
    super.dispose();
  }
}
