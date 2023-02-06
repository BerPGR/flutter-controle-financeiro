// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:controle/models/categorias.dart';

class Usuario {
  final String nome;
  final String username;
  List<Categoria>? categoria = categorias;

  Usuario({
    required this.nome,
    required this.username,
    this.categoria,
  });
}
