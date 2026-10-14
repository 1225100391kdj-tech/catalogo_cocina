import 'package:flutter/material.dart';
import '../models/receta.dart';

// DATOS MOCK: lista de recetas del catálogo.
const List<Receta> recetas = [
  Receta(
    id: '1',
    nombre: 'Pizza Margherita Italiana',
    icono: Icons.local_pizza,
    color: Color(0xFFE53935),
    categoria: 'Italiana',
    tiempoPreparacion: '30 min',
    dificultad: 'Fácil',
    calificacion: 4.9,
    descripcion:
        'Clásica pizza italiana hecha con una base crujiente, salsa de tomate '
        'fresco, mozzarella fresca y hojas de albahaca recién cortadas.',
    ingredientes: [
      'Masa para pizza',
      'Salsa de tomate casera',
      'Queso mozzarella fresco',
      'Albahaca fresca',
      'Aceite de oliva virgen extra'
    ],
  ),
  Receta(
    id: '2',
    nombre: 'Tacos al Pastor Tradicionales',
    icono: Icons.fastfood,
    color: Color(0xFFFB8C00),
    categoria: 'Mexicana',
    tiempoPreparacion: '45 min',
    dificultad: 'Media',
    calificacion: 5.0,
    descripcion:
        'Deliciosos tacos de carne de cerdo marinada con achiote y especias, '
        'servidos en tortillas de maíz con piña, cilantro y cebolla.',
    ingredientes: [
      'Carne de cerdo adobada',
      'Tortillas de maíz',
      'Piña asada',
      'Cilantro y cebolla picados',
      'Salsa verde o roja'
    ],
  ),
  Receta(
    id: '3',
    nombre: 'Ramen Tonkotsu Japonés',
    icono: Icons.ramen_dining,
    color: Color(0xFF8E24AA),
    categoria: 'Asiática',
    tiempoPreparacion: '60 min',
    dificultad: 'Avanzada',
    calificacion: 4.8,
    descripcion:
        'Sopa de fideos japonesa reconfortante en un caldo concentrado de '
        'cerdo, acompañada de chashu, huevo marinado y cebollín.',
    ingredientes: [
      'Fideos para ramen',
      'Caldo tonkotsu concentrado',
      'Lomo de cerdo chashu',
      'Huevo ajitama marinado',
      'Alga nori y cebollín'
    ],
  ),
  Receta(
    id: '4',
    nombre: 'Hamburguesa Gourmet BBQ',
    icono: Icons.lunch_dining,
    color: Color(0xFF43A047),
    categoria: 'Americana',
    tiempoPreparacion: '25 min',
    dificultad: 'Fácil',
    calificacion: 4.7,
    descripcion:
        'Jugosa hamburguesa de res con queso cheddar fundido, tocino '
        'crujiente, cebolla caramelizada y salsa BBQ de la casa.',
    ingredientes: [
      '200g de carne de res molida',
      'Pan brioche para hamburguesa',
      'Queso cheddar',
      'Tocino ahumado',
      'Salsa BBQ y cebolla caramelizada'
    ],
  ),
  Receta(
    id: '5',
    nombre: 'Pastel de Chocolate Supre',
    icono: Icons.cake,
    color: Color(0xFF5D4037),
    categoria: 'Postres',
    tiempoPreparacion: '50 min',
    dificultad: 'Media',
    calificacion: 4.9,
    descripcion:
        'Esponjoso pastel de chocolate amargo con cobertura húmeda de '
        'ganache de chocolate y chispas de cacao.',
    ingredientes: [
      'Harina de trigo',
      'Cacao en polvo amargo',
      'Azúcar y huevos',
      'Crema para batir',
      'Chocolate amargo 70%'
    ],
  ),
];