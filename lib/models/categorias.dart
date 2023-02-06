// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Categoria {
  final int id;
  final String tipo;
  final Icon icone;
  double gastos;

  Categoria({
    required this.id,
    required this.tipo,
    required this.icone,
    this.gastos = 0.0,
  });
}

Categoria lazerCategory =
    Categoria(id: 0, tipo: 'Lazer', icone: Icon(Icons.lunch_dining_rounded));

Categoria mercadoCategory =
    Categoria(id: 1, tipo: 'Mercado', icone: Icon(Icons.shopping_basket));

Categoria saudeCategory =
    Categoria(id: 2, tipo: 'Saúde', icone: Icon(Icons.health_and_safety));

Categoria transporteCategory =
    Categoria(id: 3, tipo: 'Transporte', icone: Icon(Icons.car_rental_rounded));

Categoria contasCategory =
    Categoria(id: 4, tipo: 'Contas', icone: Icon(Icons.monetization_on_sharp));

List<Categoria> categorias = [
  lazerCategory,
  mercadoCategory,
  saudeCategory,
  transporteCategory,
  contasCategory
];
