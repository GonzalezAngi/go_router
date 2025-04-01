import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:navegabilidadgorouter/models/meal.dart';

//Servicio para interactuar con la API de comidas.
class MealService {
  //URL base de la API, obtenida desde el archivo .env.
  final String apiUrl = dotenv.env['MEAL_API_URL']!;

  //Método para obtener una lista de comidas pertenecientes a una categoría específica.
  //- [category]: Categoría de comida a consultar (por defecto, "Seafood").
  //- Retorna una lista de objetos `Meal`.
  Future<List<Meal>> getMeals({String category = "Seafood"}) async {
    final response = await http.get(Uri.parse('$apiUrl/filter.php?c=$category'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> mealsJson = data['meals'] ?? [];

      // Se convierte la lista de JSON en una lista de objetos Meal.
      return mealsJson.map((json) => Meal.fromJson(json)).toList();
    } else {
      // Se lanza una excepción en caso de error en la respuesta.
      throw Exception("Error al obtener las comidas");
    }
  }

  //Método para obtener los detalles de una comida específica mediante su ID.
  /// - [idMeal]: Identificador único de la comida.
  /// - Retorna un objeto `Meal` con los detalles de la comida.
  Future<Meal> getMealById(String idMeal) async {
    final response = await http.get(Uri.parse('$apiUrl/lookup.php?i=$idMeal'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> mealsJson = data['meals'];

      // Se obtiene el primer elemento de la lista y se convierte en un objeto Meal.
      return Meal.fromJson(mealsJson.first);
    } else {
      // Se lanza una excepción en caso de error en la respuesta.
      throw Exception("Error al obtener los detalles de la comida");
    }
  }
}
