import 'package:flutter/material.dart';
import '../models/receta.dart';

// PANTALLA 3: DETALLE DE LA RECETA
class PantallaContenido extends StatefulWidget {
  final Receta receta;

  const PantallaContenido({super.key, required this.receta});

  @override
  State<PantallaContenido> createState() => _PantallaContenidoState();
}

class _PantallaContenidoState extends State<PantallaContenido> {
  bool _esFavorito = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle de la Receta'),
        actions: [
          IconButton(
            icon: Icon(
              _esFavorito ? Icons.favorite : Icons.favorite_border,
              color: _esFavorito ? Colors.red : null,
            ),
            onPressed: () {
              setState(() {
                _esFavorito = !_esFavorito;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    _esFavorito
                        ? 'Guardada en tus recetas favoritas'
                        : 'Eliminada de favoritos',
                  ),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 12),
            // Transición Hero
            Hero(
              tag: 'receta_icon_${widget.receta.id}',
              child: CircleAvatar(
                radius: 55,
                backgroundColor: widget.receta.color,
                child: Icon(
                  widget.receta.icono,
                  color: Colors.white,
                  size: 55,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.receta.nombre,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Bloque de métricas informativas
            Card(
              color: Colors.orange.shade50,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _InfoItem(
                      icon: Icons.timer,
                      label: 'Tiempo',
                      value: widget.receta.tiempoPreparacion,
                    ),
                    _InfoItem(
                      icon: Icons.bar_chart,
                      label: 'Dificultad',
                      value: widget.receta.dificultad,
                    ),
                    _InfoItem(
                      icon: Icons.star,
                      label: 'Rating',
                      value: '${widget.receta.calificacion}',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Descripción
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Preparación:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: widget.receta.color,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              widget.receta.descripcion,
              textAlign: TextAlign.start,
              style: const TextStyle(fontSize: 14, height: 1.4),
            ),
            const SizedBox(height: 14),

            // Ingredientes
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Ingredientes clave:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: widget.receta.color,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Expanded(
              child: ListView.builder(
                itemCount: widget.receta.ingredientes.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Row(
                      children: [
                        const Icon(Icons.check_circle,
                            size: 16, color: Colors.green),
                        const SizedBox(width: 8),
                        Text(
                          widget.receta.ingredientes[index],
                          style: const TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Botones de acción
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Regresar'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: widget.receta.color,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('¡Receta lista para cocinar!'),
                        ),
                      );
                    },
                    icon: const Icon(Icons.restaurant),
                    label: const Text('Cocinar'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 22, color: Colors.deepOrange),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 11, color: Colors.grey),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}