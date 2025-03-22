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

# En este proyecto, titulado NavegabilidadGoRouter, se estructura la aplicación en 6 carpetas principales para mantener un orden lógico y facilitar la escalabilidad del desarrollo. A continuación, se detalla el propósito de cada carpeta:

# 1. assets: En esta carpeta se almacena la imagen medico.jfif, que se utiliza en el widget del Home.

# 2. routes: Aquí se encuentra el archivo app_router.dart, donde se configuran las rutas de navegación de la aplicación utilizando el paquete GoRouter. Se definen rutas estáticas para aquellas pantallas específicas y rutas dinámicas con parámetros que permiten pasar valores entre pantallas de forma flexible.

# 3. themes: Se crea el archivo app_theme.dart, en el cual se define la apariencia visual de la aplicación para garantizar coherencia en colores, tipografía y estilo de elementos.

# 4. views: Contiene tres archivos que estructuran las vistas principales de la aplicación:

# - base_view.dart: Sirve como plantilla para todas las vistas de la app, asegurando un diseño consistente con un AppBar común, un Drawer compartido y un espacio para renderizar contenido personalizado en cada pantalla.

# custom_drawer.dart: Implementa un menú lateral personalizado (Drawer) que permite la navegación entre diferentes secciones de la app, este menú incluye: Opciones de navegación con ListTile, íconos y texto para cada sección.

# home_view.dart: Diseña la página principal interactiva de la aplicación, ofreciendo una interfaz limpia y funcional.

# 5. ciclo_vida: Aquí se encuentra la clase CicloVidaScreen, que proporciona un ejemplo práctico del ciclo de vida de un StatefulWidget en Flutter, esta pantalla permite entender el funcionamiento y las etapas del ciclo de vida en este tipo de widgets.

# 6. paso_parametros: Contiene dos archivos relacionados con el paso de parámetros entre pantallas:

# paso_parametros.dart: Implementa una pantalla interactiva que permite al usuario ingresar un valor (nombre), se utiliza diferentes métodos de navegación (go, push, y replace) proporcionados por GoRouter para redirigir el valor capturado a otra pantalla.

# detalle_screen.dart: Recibe los valores enviados desde paso_parametros.dart (el parámetro y el método de navegación),muestra el valor recibido al usuario y permite regresar a la pantalla anterior, ajustando el comportamiento según el método de navegación utilizado.

# Finalmente el archivo main inicializa la aplicación, configurando un tema visual personalizado (AppTheme.lightTheme) y estableciendo la navegación mediante go_router a través del archivo app_router.dart. Todo esto se encapsula en el widget raíz MaterialApp.router, que define cómo se ve y se navega dentro de la app, desactivando además el banner de depuración.