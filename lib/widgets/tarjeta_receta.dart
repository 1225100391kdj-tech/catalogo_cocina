import 'package:flutter/material.dart';
import '../models/receta.dart';
import '../views/pantalla_contenido.dart';

// WIDGET REUTILIZABLE: Tarjeta para la rejilla
class TarjetaReceta extends StatelessWidget {
  final Receta receta;

  const TarjetaReceta({super.key, required this.receta});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PantallaContenido(receta: receta),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Efecto Hero para la transición visual
              Hero(
                tag: 'receta_icon_${receta.id}',
                child: CircleAvatar(
                  radius: 32,
                  backgroundColor: receta.color,
                  child: Icon(receta.icono, color: Colors.white, size: 32),
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: Text(
                  receta.nombre,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    '${receta.calificacion}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}