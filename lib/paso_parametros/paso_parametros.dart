import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navegabilidadgorouter/views/base_view.dart';

class PasoParametrosScreen extends StatefulWidget {
  const PasoParametrosScreen({super.key});

  @override
  State<PasoParametrosScreen> createState() => PasoParametrosScreenState();
}

class PasoParametrosScreenState extends State<PasoParametrosScreen> {
  /// Controlador para capturar el texto ingresado en el TextField
  /// *se utiliza textEditingController para poder capturar el valor del campo de texto
  final TextEditingController controller =
      TextEditingController(); //!controlador para capturar el texto ingresado en el TextField
  @override
  void dispose() {
    controller.dispose(); // Liberamos la memoria del controlador
    // el metodo super.dispose() se encarga de liberar la memoria de los recursos utilizados por el widget
    super.dispose();
  }

  /// !goToDetalle
  /// recibe el tipo de navegación (go, push, replace)
  /// y redirige a la pantalla de detalle con el valor ingresado.
  void goToDetalle(String metodo) {
    String valor = controller.text; // Capturamos el valor del campo de texto

    if (valor.isEmpty) return; // Si el campo está vacio, no hacemos nada

    switch (metodo) {
      case 'go':
        context.go('/detalle/$valor/$metodo');
        break;
      case 'push':
        context.push('/detalle/$valor/$metodo');
        break;
      case 'replace':
        context.replace('/detalle/$valor/$metodo');
        break;
    }
  }

  @override
  // *build es un método que retorna un widget
  Widget build(BuildContext context) {
    return BaseView(
      title: "Paso de parámetros",
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Título colocado en la parte superior
            const SizedBox(height: 40), // Espaciado superior
            const Align(
              alignment: Alignment.topCenter,
              child: Text(
                "RappiMedi - Registro", // Título principal
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 150), // Espaciado entre título y descripción
            const Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Por favor, escriba su nombre en el campo a continuación:",
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(), // Empuja el resto hacia el centro
            // Input y botones
            SizedBox(
              width: 250.0, // Limita el ancho del campo de texto
              child: TextField(
                //* Asignamos el controlador al campo de texto
                controller: controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nombre',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ), // Espaciado entre el input y los botones
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150.0,
                  height: 40.0,
                  child: ElevatedButton(
                    onPressed: () => goToDetalle('go'),
                    child: const Text('Ir con Go'),
                  ),
                ),
                const SizedBox(width: 10), // Separación entre botones
                SizedBox(
                  width: 150.0,
                  height: 40.0,
                  child: ElevatedButton(
                    onPressed: () => goToDetalle('push'),
                    child: const Text('Ir con Push'),
                  ),
                ),
                const SizedBox(width: 10), // Separación entre botones
                SizedBox(
                  width: 150.0,
                  height: 40.0,
                  child: ElevatedButton(
                    onPressed: () => goToDetalle('replace'),
                    child: const Text('Ir con Replace'),
                  ),
                ),
              ],
            ),
            const Spacer(), // Mantiene el contenido centrado verticalmente
          ],
        ),
      ),
    );
  }
}
