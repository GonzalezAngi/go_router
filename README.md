# navegabilidadgorouter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

------------------------------------------Taller 1 ----------------------------------------------------
En este proyecto, titulado NavegabilidadGoRouter, se estructura la aplicación en 6 carpetas principales para mantener un orden lógico y facilitar la escalabilidad del desarrollo. A continuación, se detalla el propósito de cada carpeta:

1. assets: En esta carpeta se almacena la imagen medico.jfif, que se utiliza en el widget del Home.

2. routes: Aquí se encuentra el archivo app_router.dart, donde se configuran las rutas de navegación de la aplicación utilizando el paquete GoRouter. Se definen rutas estáticas para aquellas pantallas específicas y rutas dinámicas con parámetros que permiten pasar valores entre pantallas de forma flexible.

3. themes: Se crea el archivo app_theme.dart, en el cual se define la apariencia visual de la aplicación para garantizar coherencia en colores, tipografía y estilo de elementos.

4. views: Contiene tres archivos que estructuran las vistas principales de la aplicación:

* base_view.dart: Sirve como plantilla para todas las vistas de la app, asegurando un diseño consistente con un AppBar común, un Drawer compartido y un espacio para renderizar contenido personalizado en cada pantalla.

custom_drawer.dart: Implementa un menú lateral personalizado (Drawer) que permite la navegación entre diferentes secciones de la app, este menú incluye: Opciones de navegación con ListTile, íconos y texto para cada sección.

home_view.dart: Diseña la página principal interactiva de la aplicación, ofreciendo una interfaz limpia y funcional.

5. ciclo_vida: Aquí se encuentra la clase CicloVidaScreen, que proporciona un ejemplo práctico del ciclo de vida de un StatefulWidget en Flutter, esta pantalla permite entender el funcionamiento y las etapas del ciclo de vida en este tipo de widgets.

6. paso_parametros: Contiene dos archivos relacionados con el paso de parámetros entre pantallas:

paso_parametros.dart: Implementa una pantalla interactiva que permite al usuario ingresar un valor (nombre), se utiliza diferentes métodos de navegación (go, push, y replace) proporcionados por GoRouter para redirigir el valor capturado a otra pantalla.

detalle_screen.dart: Recibe los valores enviados desde paso_parametros.dart (el parámetro y el método de navegación),muestra el valor recibido al usuario y permite regresar a la pantalla anterior, ajustando el comportamiento según el método de navegación utilizado.

Finalmente el archivo main inicializa la aplicación, configurando un tema visual personalizado (AppTheme.lightTheme) y estableciendo la navegación mediante go_router a través del archivo app_router.dart. Todo esto se encapsula en el widget raíz MaterialApp.router, que define cómo se ve y se navega dentro de la app, desactivando además el banner de depuración.

----------------------------taller 2------------------------------------------------------------------
-Manejo de Tareas Asíncronas en Flutter
Se incluyen tres clases (FutureView, IsolateView, TimerView) que implementan diferentes técnicas para manejar tareas asíncronas en Flutter.

-FutureView: Simula la carga de una lista de estudiantes con un Future.delayed() y muestra un indicador de carga (CircularProgressIndicator) mientras la tarea está en proceso.
Se inicia la carga de datos en el método _cargarLista(), se muestra un indicador de carga mientras el Future está pendiente, cuando la tarea se completa, la UI se actualiza con los datos obtenidos.

Conceptos usados:
Future.delayed() para simular la espera de datos.
setState() para actualizar la UI cuando los datos están listos.
ListView.builder() para mostrar la lista de estudiantes.

-IsolateView: Ejecuta una tarea pesada en un Isolate para evitar bloquear la UI y muestra el resultado en un SnackBar. 
Se crea un ReceivePort para recibir datos desde el Isolate,se lanza un nuevo Isolate con _simulacionTareaPesada(), se envían datos al Isolate y este procesa la información, una vez completada la tarea, el Isolate envía el resultado de vuelta, la UI se actualiza y se muestra un SnackBar con el resultado.

Conceptos usados:
Isolate.spawn() para crear un hilo secundario.
ReceivePort y SendPort para la comunicación entre hilos.
Isolate.exit() para cerrar el Isolate cuando termina la tarea.

TimerView:Implementa un temporizador con Timer.periodic() que incrementa un contador cada segundo y permite iniciarlo, pausarlo y reiniciarlo. 
Se presiona el botón "Iniciar", y el Timer comienza a incrementar el contador,se puede pausar el temporizador con el botón "Pausar",si se presiona "Reiniciar", el contador vuelve a 0 y el Timer se reactiva.

Conceptos usados:
Timer.periodic() para ejecutar una tarea repetitiva.
setState() para actualizar la UI cada segundo.
BottomNavigationBar para alternar entre el contador y una sección de descripción.



--------------------taller 3---------------------------------------------------
En este taller se consume una API de comidas y permite visualizar una lista de platillos y sus detalles, este se hace por medio de tres clases principales.

Modelos: 
Meal: Representa una comida con su ID, nombre e imagen. También incluye un método fromJson para mapear datos de la API a un objeto Dart.

Servicios:
MealService: Se encarga de realizar las solicitudes HTTP a la API.

getMeals({String category}): Obtiene una lista de comidas por categoría.

getMealById(String idMeal): Obtiene los detalles de una comida específica.

Vistas: 
MealListView: Muestra una lista de comidas obtenidas de la API. Cada comida puede ser seleccionada para ver más detalles.

MealDetailView: Muestra la información detallada de una comida, incluyendo su imagen y nombre.

También se agregaron las rutas necesarias en la clase app_router 

