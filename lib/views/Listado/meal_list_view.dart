import 'package:flutter/material.dart';
import 'package:navegabilidadgorouter/models/meal.dart';
import 'package:navegabilidadgorouter/services/meal_service.dart';
import 'package:go_router/go_router.dart';
import 'package:navegabilidadgorouter/views/base_view.dart'; // Asegúrate de tener esta importación

//Vista que muestra una lista de comidas disponibles.
class MealListView extends StatefulWidget {
  const MealListView({super.key});

  @override
  State<MealListView> createState() => _MealListViewState();
}

class _MealListViewState extends State<MealListView> {
  //Servicio para obtener los datos de las comidas desde la API
  final MealService _mealService = MealService();
  //Futuro que almacenará la lista de comidas obtenidas.
  late Future<List<Meal>> _futureMeals;

  @override
  void initState() {
    super.initState();
     // Se inicializa el Future obteniendo la lista de comidas.
    _futureMeals = _mealService.getMeals();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView( 
      title: 'Lista de Comidas', // Título para la AppBar en BaseView
      body: FutureBuilder<List<Meal>>(
        future: _futureMeals,
        builder: (context, snapshot) {
           // Muestra un indicador de carga mientras se obtienen los datos.
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
           // Muestra un mensaje de error si ocurre un problema.  
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
             // Muestra un mensaje si no hay comidas disponibles.
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay comidas disponibles'));
          }
          
           // Se obtiene la lista de comidas desde el snapshot.
          final meals = snapshot.data!;
          return ListView.builder(
            itemCount: meals.length,
            itemBuilder: (context, index) {
              final meal = meals[index];
              return Card(
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  // Muestra la imagen en miniatura de la comida.
                  leading: Image.network(meal.strMealThumb, width: 50, height: 50, fit: BoxFit.cover),
                  title: Text(meal.strMeal),
                  onTap: () {
                    context.go('/meals/${meal.idMeal}');
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}