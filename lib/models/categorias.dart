// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Categoria {
  final int id;
  final String tipo;
  double gastos;

  Categoria({
    required this.id,
    required this.tipo,
    this.gastos = 0.0,
  });

  Map<String, dynamic> toMap() {
    return {'id': id, 'tipo': tipo, 'gastos': gastos};
  }
}

Categoria lazerCategory = Categoria(id: 0, tipo: 'Lazer');

Categoria mercadoCategory = Categoria(id: 1, tipo: 'Mercado');

Categoria saudeCategory = Categoria(id: 2, tipo: 'Saúde');

Categoria transporteCategory = Categoria(id: 3, tipo: 'Transporte');

Categoria contasCategory = Categoria(id: 4, tipo: 'Contas');

List<Categoria> categorias = [
  lazerCategory,
  mercadoCategory,
  saudeCategory,
  transporteCategory,
  contasCategory
];
