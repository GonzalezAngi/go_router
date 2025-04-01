import 'package:flutter/material.dart';
import 'package:navegabilidadgorouter/models/meal.dart';
import 'package:navegabilidadgorouter/services/meal_service.dart';
import 'package:navegabilidadgorouter/views/base_view.dart'; // Asegúrate de tener esta importación

// Vista que muestra los detalles de una comida específica.
class MealDetailView extends StatefulWidget {
  // Identificador único de la comida a mostrar.
  final String idMeal;

  // Constructor de la vista de detalles de una comida.
  const MealDetailView({super.key, required this.idMeal});

  @override
  State<MealDetailView> createState() => _MealDetailViewState();
}

class _MealDetailViewState extends State<MealDetailView> {
  // Servicio para obtener datos de la API.
  final MealService _mealService = MealService();

  // Futuro que almacenará la comida obtenida desde la API.
  late Future<Meal> _futureMeal;

  @override
  void initState() {
    super.initState();
    // Se inicializa el Future obteniendo la comida por su ID.
    _futureMeal = _mealService.getMealById(widget.idMeal);
  }

  @override
  Widget build(BuildContext context) {
    // BaseView para integrar el menú lateral y la estructura base de la aplicación.
    return BaseView(
      title: 'Detalles de la Comida', // Título para la AppBar en BaseView.
      body: FutureBuilder<Meal>(
        future: _futureMeal,
        builder: (context, snapshot) {
          // Muestra un indicador de carga mientras se obtienen los datos.
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          // Muestra un mensaje de error si ocurre un problema.
          else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          // Muestra un mensaje si no hay datos disponibles.
          else if (!snapshot.hasData) {
            return const Center(child: Text('No hay datos disponibles'));
          }

          // Se obtiene la comida desde el snapshot.
          final meal = snapshot.data!;
          return Center(
            child: Card(
              margin: const EdgeInsets.all(16),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Muestra la imagen de la comida.
                    Image.network(
                      meal.strMealThumb,
                      height: 180,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 16),
                    // Muestra el nombre de la comida en mayúsculas y con estilo resaltado.
                    Text(
                      meal.strMeal.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}