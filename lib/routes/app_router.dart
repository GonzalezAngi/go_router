import 'package:go_router/go_router.dart';
import 'package:navegabilidadgorouter/ciclo_vida/ciclo_vida_screen.dart';
import 'package:navegabilidadgorouter/paso_parametros/detalle_screen.dart';
import 'package:navegabilidadgorouter/paso_parametros/paso_parametros.dart';
import 'package:navegabilidadgorouter/views/future/future_view.dart';
import 'package:navegabilidadgorouter/views/home_view.dart';
import 'package:navegabilidadgorouter/views/isolate/isolate_view.dart';
import 'package:navegabilidadgorouter/views/timer/timer_view.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeView(), // Usa HomeView
    ),
    GoRoute(
      path: '/paso_parametros',
      builder: (context, state) => const PasoParametrosScreen(),
    ),
    GoRoute(
      path:
          '/detalle/:parametro/:metodo', //la ruta recibe dos parametros los " : " indican que son parametros
      builder: (context, state) {
        //*se capturan los parametros recibidos
        // declarando las variables parametro y metodo
        // es final porque no se van a modificar
        final parametro = state.pathParameters['parametro']!;
        final metodo = state.pathParameters['metodo']!;
        return DetalleScreen(parametro: parametro, metodoNavegacion: metodo);
      },
    ),
    GoRoute(
      path: '/ciclo_vida',
      builder: (context, state) => const CicloVidaScreen(),
    ),
    GoRoute(
      path: '/future',
      name: 'future',
      builder: (context, state) => const FutureView(),
    ),
    //!Ruta para el demo de Timer
    GoRoute(
      path: '/timer',
      name: 'timerView',
      builder: (context, state) => const TimerView(),
    ),

    //!Ruta para el demo de Isolate
    GoRoute(
      path: '/isolate', //*ruta para el demo de Isolate
      name: 'isolate', //*nombre de la ruta
      builder: (context, state) => const IsolateView(),
    ),
  ],
);
