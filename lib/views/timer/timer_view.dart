import 'dart:async';

import 'package:flutter/material.dart';
import 'package:navegabilidadgorouter/views/base_view.dart';

class TimerView extends StatefulWidget {
  const TimerView({super.key});

  @override
  State<TimerView> createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView> {
  //late indica que la variable será inicializada después
  //esto se usa con el fin de que la variable no sea nula
  late Timer _timer;
  int _contador = 0;
  int _indiceSeleccionado = 0; //indice seleccionado en el BottomNavigationBar
  bool _estaCorriendo = false;  // Indica si el temporizador está en ejecución

  @override
  //!initState() se llama una vez que el widget ha sido creado
  //!y se puede utilizar para inicializar datos que solo deben hacerse una vez.
  void initState() {
    super.initState();
  }

  //! Método para iniciar el temporizador
  void _iniciarTemporizador() {
    if (!_estaCorriendo) {
      //timer.periodic() ejecuta una función cada cierto tiempo
      //en este caso cada segundo
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          _contador++;
        });
      });
      setState(() {
        _estaCorriendo = true;
      });
    }
  }
    //! Método para pausar el temporizador
  void _pausarTemporizador() {
    if (_estaCorriendo) {
      _timer.cancel(); // Cancela el temporizador
      setState(() {
        _estaCorriendo = false;
      });
    }
  }
  
    //! Método para reiniciar el temporizador
  void _reiniciarTemporizador() {
    _timer.cancel();  // Cancela el temporizador antes de reiniciarlo
    setState(() {
      _contador = 0;
      _estaCorriendo = false;
    });
    _iniciarTemporizador();// Vuelve a iniciar el temporizador
  }

  @override
  //! dispose() se llama cuando el widget se elimina del árbol de widgets
  //! y se puede utilizar para liberar recursos o cancelar temporizadores.
  void dispose() {
    //! _timer.cancel() cancela el temporizador, requerido siempre que se use Timer
    //! evita fugas de memoria
    _timer.cancel();
    super.dispose();
  }

  //! Método para cambiar de sección
  void _itemSeleccionado(int index) {
    setState(() {
      _indiceSeleccionado = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //*Lista de Widgets para las páginas
    List<Widget> paginas = [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           // Muestra el contador en pantalla
          Text(
          'Segundos: $_contador',
          style: const TextStyle(fontSize: 28),
        ),
         const SizedBox(height: 20),
          // Botones para controlar el temporizador
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _iniciarTemporizador,
                child: const Text('Iniciar'),
              ),
                            const SizedBox(width: 10),
              ElevatedButton(
                onPressed: _pausarTemporizador,
                child: const Text('Pausar'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: _reiniciarTemporizador,
                child: const Text('Reiniciar'),
              ),
            ],

      ),
        ],
      ),
       // Página con la descripción del temporizador
      const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Este ejemplo usa Timer.periodic para aumentar el contador '
          'automáticamente cada segundo. ',
          style: TextStyle(fontSize: 18),
        ),
      ),
    ];

    return BaseView(
      title: 'Timer - TabBar ',
      body: Column(
        children: [
          Expanded(child: paginas[_indiceSeleccionado]),
          BottomNavigationBar(
            currentIndex: _indiceSeleccionado,
            onTap: _itemSeleccionado,
            selectedItemColor: Colors.blueAccent,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.timer),
                label: 'Contador',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.info_outline),
                label: 'Descripción',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
