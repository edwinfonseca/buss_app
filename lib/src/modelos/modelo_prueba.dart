// To parse this JSON data, do
//
//     final empresasModelo = empresasModeloFromJson(jsonString);

import 'dart:convert';

EmpresasModelo empresasModeloFromJson(String str) =>
    EmpresasModelo.fromJson(json.decode(str));

String empresasModeloToJson(EmpresasModelo data) => json.encode(data.toJson());

class EmpresasModelo {
  EmpresasModelo({
    this.id,
    this.contacto,
    this.email,
    this.nombre,
  });

  String id;
  String contacto;
  String email;
  String nombre;

  factory EmpresasModelo.fromJson(Map<String, dynamic> json) => EmpresasModelo(
        id: json["id"],
        contacto: json["contacto"],
        email: json["email"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "contacto": contacto,
        "email": email,
        "nombre": nombre,
      };
}
