import 'dart:convert';

import 'package:buss_app/src/modelos/modelo_prueba.dart';
import 'package:http/http.dart' as http;

class EmpresasProvider {
  final String _url = 'https://bussapp-dfda5-default-rtdb.firebaseio.com';

  //--------------parte para editar campos

  Future<bool> crearEmpresa(EmpresasModelo empresa) async {
    final url = Uri.parse('$_url/empresas');
    final resp = await http.post(url, body: empresasModeloToJson(empresa));

    final dataRespuesta = json.decode(resp.body);
    return true;
  }

  Future<List<EmpresasModelo>> cargarEmpresas() async {
    final url = Uri.parse('$_url/empresas.json');
    final resp = await http.get(url);

    final Map<String, dynamic> dataRespuesta = json.decode(resp.body);

    final List<EmpresasModelo> empresas = [];
    //print(dataRespuesta);
    if (dataRespuesta == null) {
      return [];
    } else {
      dataRespuesta.forEach((id, empre) {
        final empreTemp = EmpresasModelo.fromJson(empre);
        empreTemp.id = id;
        empresas.add(empreTemp);
        //print(empresas);
      });
      //print('las empresas${empresas}');
      return empresas;
    }
  }
}
