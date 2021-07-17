import 'package:buss_app/src/modelos/modelo_prueba.dart';
import 'package:buss_app/src/providers/empresas_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  final empresasProvider = new EmpresasProvider();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: _mostrardatos(),
            ),
          ],
        ),
      ),
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
            return Center(
                child: CircularProgressIndicator(
              semanticsLabel: 'buscando...',
            ));
          }
        });
  }

  Widget _crearItem(EmpresasModelo empresa) {
    return Card(
      //shadowColor: Color(0xffff9000),
      color: Colors.green.shade50,
      margin: EdgeInsets.all(10),
      elevation: 6.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: [
          ListTile(
            onTap: () {},
            contentPadding: EdgeInsets.all(3),
            leading: Icon(
              Icons.directions_bus_sharp,
              color: Colors.greenAccent,
              size: 50,
            ),
            title: Text(empresa.nombre),
            subtitle: Text(empresa.contacto),
            //trailing: Text("asdasd"),
          ),
          Container(
            alignment: AlignmentDirectional.topStart,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(empresa.email),
          )
        ],
      ),
    );
  }
}
