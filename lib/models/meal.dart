/// Clase que representa una comida con su ID, nombre e imagen.
class Meal {
  /// Identificador único de la comida.
  final String idMeal;

  /// Nombre de la comida.
  final String strMeal;

  /// URL de la imagen de la comida.
  final String strMealThumb;

  /// Constructor de la clase Meal, requiere todos los parámetros.
  Meal({
    required this.idMeal,
    required this.strMeal,
    required this.strMealThumb,
  });

  /// Fábrica que crea una instancia de Meal a partir de un JSON.
  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      idMeal: json['idMeal'], // Extrae el ID de la comida del JSON.
      strMeal: json['strMeal'], // Extrae el nombre de la comida del JSON.
      strMealThumb: json['strMealThumb'], // Extrae la URL de la imagen del JSON.
    );
  }
}
