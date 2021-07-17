import 'package:buss_app/src/modelos/modelo_prueba.dart';
import 'package:buss_app/src/providers/empresas_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final empresasProvider = Provider.of<EmpresasProvider>(context);
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [_ListaEmpresas()],
      ),
    ));
  }
}

class _ListaEmpresas extends StatelessWidget {
  Color _color = Colors.green.shade100;
  @override
  Widget build(BuildContext context) {
    final empresasProvider = new EmpresasProvider();
    return Container(
      decoration: BoxDecoration(
        color: _color,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(0),
            topLeft: Radius.circular(0),
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25)),
      ),
      width: double.infinity,
      height: 50,
      child: FutureBuilder(
          future: empresasProvider.cargarEmpresas(),
          builder: (BuildContext context,
              AsyncSnapshot<List<EmpresasModelo>> snapshot) {
            final datos = snapshot.data;
            if (snapshot.hasData) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: datos.length,
                itemBuilder: (context, index) => _crearNombre(datos[index]),
              );
            } else {
              return Center(
                  child: CircularProgressIndicator(
                semanticsLabel: 'buscando...',
              ));
            }
          }),
    );
  }
}

Widget _crearNombre(EmpresasModelo empresa) {
  return Container(
    child: Card(
      margin: EdgeInsets.all(2),
      elevation: 0.2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        child: RawMaterialButton(
          child: Text(empresa.nombre),
          onPressed: () {},
        ),
      ),
    ),
  );
}
