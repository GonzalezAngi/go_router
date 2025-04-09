import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color:
                  Theme.of(
                    context,
                  ).colorScheme.primary, // Usa el color primario del tema
            ),
            child: const Text(
              'Menú',
              style: TextStyle(
                color:
                    Colors
                        .white, // Texto blanco para contrastar con el color primario
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Inicio'),
            onTap: () {
              //context.go('/'); // Navega a la ruta principal
              //Reemplaza la ruta actual en la pila de navegación.
              //No permite volver atrás automáticamente, ya que no agrega la nueva ruta a la pila.
              //Útil para navegación sin historial, como en barra de navegación o cambiar de pestañas.
              context.go('/'); // Navega a la ruta principal
              Navigator.pop(context); // Cierra el drawer
            },
          ),
          //!PASO DE PARAMETROS
          ListTile(
            leading: const Icon(Icons.input),
            title: const Text('Paso de Parámetros'),
            onTap: () {
              context.go('/paso_parametros');
            },
          ),
          ListTile(
            leading: const Icon(Icons.loop),
            title: const Text('Ciclo de Vida'),
            onTap: () {
              context.go('/ciclo_vida');
            },
          ),
          //!FUTURE
          ListTile(
            leading: const Icon(Icons.schedule),
            title: const Text('Future'),
            onTap: () => context.goNamed('future'),
          ),
          //!TIMER
          ListTile(
            leading: const Icon(Icons.timer),
            title: const Text('Timer'),
            onTap: () {
              context.goNamed('timerView');
            },
          ),

          //!ISOLATE
          ListTile(
            leading: const Icon(Icons.memory),
            title: const Text('Isolate'),
            onTap: () {
              //Navega a la ruta con nombre 'isolate'
              context.goNamed('isolate');
            },
          ),
           //! COMIDAS (antes Pokemones)
          ListTile(
            leading: const Icon(Icons.fastfood),
            title: const Text('comidas'),
            onTap: () {
              context.goNamed('meals');
            },
          ),
          //! ruta para establecimientos
          ListTile(
            leading: Icon(Icons.business),
            title: Text('Establecimientos'),
            onTap: () {
              // Navegación con GoRouter
              context.push('/establecimientos');
            },
          ),
        ],
      ),
    );
  }
}
