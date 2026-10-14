import 'package:flutter/material.dart';
import '../datasource/receta_data.dart';
import '../models/receta.dart';
import '../widgets/tarjeta_receta.dart';

// PANTALLA 2: PRINCIPAL (Barra de búsqueda, filtros y GridView)
class PantallaPrincipal extends StatefulWidget {
  const PantallaPrincipal({super.key});

  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  String _busqueda = '';
  String _categoriaSeleccionada = 'Todas';

  final List<String> _categorias = [
    'Todas',
    'Italiana',
    'Mexicana',
    'Asiática',
    'Americana',
    'Postres',
  ];

  @override
  Widget build(BuildContext context) {
    // Filtrado interactivo
    final recetasFiltradas = recetas.where((receta) {
      final coincideBusqueda = receta.nombre
          .toLowerCase()
          .contains(_busqueda.toLowerCase());
      final coincideCategoria = _categoriaSeleccionada == 'Todas' ||
          receta.categoria == _categoriaSeleccionada;
      return coincideBusqueda && coincideCategoria;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recetario del Mundo'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.person, size: 28),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Perfil del Chef')),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Campo de Búsqueda
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              onChanged: (val) => setState(() => _busqueda = val),
              decoration: InputDecoration(
                hintText: 'Buscar receta o platillo...',
                prefixIcon: const Icon(Icons.search),
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          // Chips de Categorías / Filtros
          SizedBox(
            height: 48,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: _categorias.length,
              itemBuilder: (context, index) {
                final cat = _categorias[index];
                final isSelected = _categoriaSeleccionada == cat;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: FilterChip(
                    label: Text(cat),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        _categoriaSeleccionada = cat;
                      });
                    },
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 8),

          // Lista dinámica en rejilla
          Expanded(
            child: recetasFiltradas.isEmpty
                ? const Center(child: Text('No se encontraron recetas'))
                : GridView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: recetasFiltradas.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 14,
                      crossAxisSpacing: 14,
                      childAspectRatio: 0.85,
                    ),
                    itemBuilder: (context, index) {
                      return TarjetaReceta(receta: recetasFiltradas[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}