import 'package:buss_app/src/modelos/modelo_prueba.dart';
import 'package:buss_app/src/providers/empresas_provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final empresasProvider = new EmpresasProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _mostrardatos(),
    );
  }

  Widget _mostrardatos() {
    return FutureBuilder(
        future: empresasProvider.cargarEmpresas(),
        builder: (BuildContext context,
            AsyncSnapshot<List<EmpresasModelo>> snapshot) {
          final datos = snapshot.data;
          //print("estos son los $datos");
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: datos.length,
              itemBuilder: (context, index) => _crearItem(datos[index]),
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  Widget _crearItem(EmpresasModelo empresa) {
    return ListTile(
      title: Text(empresa.nombre),
      subtitle: Text(empresa.contacto),
      leading: Icon(Icons.directions_bus_sharp),
    );
  }
}
