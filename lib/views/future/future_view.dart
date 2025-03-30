import 'package:flutter/material.dart';
import 'package:navegabilidadgorouter/views/base_view.dart';

// Widget con estado que simula la carga de datos de estudiantes
class FutureView extends StatefulWidget {
  const FutureView({super.key});

  @override
  State<FutureView> createState() => _FutureViewState();
}

class _FutureViewState extends State<FutureView> {
  // Lista para almacenar los nombres de los estudiantes
  List<String> _nombres = []; //forma para declarar una lista.

  @override
  // !inicializa el estado
  // *llama a la funcion obtenerDatos() para cargar los datos al iniciar
  void initState() {
    super.initState();
    obtenerDatos(); // carga al iniciar
  }

  // !Funcion que simula una carga de datos
  //*espera 5 segundos antes de cargar los datos, esto simula una carga de datos.
  Future<List<String>> cargarEstudiantes() async {
    //future.delayed() simula una carga de datos
    await Future.delayed(const Duration(seconds: 5));
    return [
      'Juan',
      'Pedro',
      'Luis',
      'Ana',
      'Maria',
      'Jose',
      'Carlos',
      'Sofia',
      'Laura',
      'Fernando',
      'Ricardo',
      'Diana',
      'Elena',
      'Miguel',
      'Rosa',
      'Luz',
      'Carmen',
      'Pablo',
      'Jorge',
      'Roberto',
    ];
  }

  // !Funcion que obtiene los datos
  // *carga los datos y los asigna a la lista _nombres
  Future<void> obtenerDatos() async {
    final datos = await cargarEstudiantes();

    //!mounted es una propiedad de State que indica si el widget está montado en el árbol de widgets
    //mounted es true si el widget está montado en el árbol de widgets
    //mounted es false si el widget no está montado en el árbol de widgets
    if (!mounted) return;
    setState(() {
      _nombres = datos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'Lista de estudiantes',
      body:
          _nombres.isEmpty
              ? const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 10,
                    ), // Espacio entre el indicador y el texto
                    Text(
                      'Cargando estudiantes...',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
              //listView para mostrar los nombres de los estudiantes
              : ListView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: _nombres.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: const Color.fromARGB(255, 87, 194, 180),
                    child: Center(
                      child: Text(
                        _nombres[index],
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
