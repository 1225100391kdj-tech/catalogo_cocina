import 'package:flutter/material.dart';

// MODELO: representa la información de cada receta de cocina.
class Receta {
  final String id;
  final String nombre;
  final IconData icono;
  final Color color;
  final String categoria;
  final String tiempoPreparacion;
  final String dificultad;
  final double calificacion;
  final String descripcion;
  final List<String> ingredientes;

  const Receta({
    required this.id,
    required this.nombre,
    required this.icono,
    required this.color,
    required this.categoria,
    required this.tiempoPreparacion,
    required this.dificultad,
    required this.calificacion,
    required this.descripcion,
    required this.ingredientes,
  });
}