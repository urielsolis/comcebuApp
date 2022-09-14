import 'dart:convert';
import 'package:comcebu/preferencias/preferencias_usuario.dart';
import 'package:comcebu/utils/Utilsf.dart';
import 'package:http/http.dart' as http;

class UserProvider {
  final urlBase = Utilsf.urlBase + 'api';
  final _pref = new PreferenciasUsuario();
  Future<Map<String, dynamic>> login(String email, String password) async {
    final authData = {'user': email, 'password': password};
    final url = '$urlBase/loginApi';
    final resp = await http.post(Uri.parse(url), body: authData);
    Map<String, dynamic> decodeResp = json.decode(resp.body.toString());
    if (decodeResp.containsKey('data')) {
      _pref.usuario = json.encode(decodeResp['data']).toString();
      _pref.idusuario = decodeResp['data']['Inscrito'].toString();
      return {'ok': true, 'usuario': decodeResp['data']};
    } else {
      return {'ok': false, 'mensaje': decodeResp['mensaje']};
    }
  }

  Future<Map<String, dynamic>> qrScanner(String qr) async {
    final authData = {'codescan': qr};
    final url = '$urlBase/qrScanner';
    final resp = await http.post(Uri.parse(url), body: authData);
    Map<String, dynamic> decodeResp = json.decode(resp.body.toString());
    if (decodeResp.containsKey('data')) {
      // _pref.usuario = json.encode(decodeResp['data']).toString();
      // _pref.idusuario = decodeResp['data']['Inscrito'].toString();
      return {
        'ok': true,
        'usuario': json.encode(decodeResp['data']).toString(),
        'mensaje': decodeResp['mensaje']
      };
    } else {
      if (decodeResp.containsKey('mensaje')) {
        return {'ok': false, 'mensaje': decodeResp['mensaje']};
      } else {
        return {'ok': false, 'mensaje': "Error desconocido en el servicio."};
      }
    }
  }
}
