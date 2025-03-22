import 'package:flutter/material.dart';
import 'package:navegabilidadgorouter/views/base_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'RappiMedi', //Título principal que se pasa al AppBar
      body: DefaultTabController(
        initialIndex: 0,  // La pestaña que estará seleccionada por defecto
        length: 3, // Número de pestañas en el TabBar
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Atención médica domiciliaria al alcance de todos.',
            ),
            backgroundColor: Color.fromARGB(255, 46, 172, 245), // Color del AppBar // Color para el AppBar
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(48),
              child: Container(
                color: Colors.lightBlueAccent, // Color para el fondo del TabBar
                child: const TabBar(
                  indicatorColor: Colors.white, // Color del indicador
                  tabs: <Widget>[
                    Tab(icon: Icon(Icons.medical_services)),// Icono para la primera pestaña
                    Tab(icon: Icon(Icons.info)),// Icono para la segunda pestaña
                    Tab(icon: Icon(Icons.payment)), // Icono para la tercera pestaña
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(
            // Primera pestaña: servicios médicos en un GridView
            children: <Widget>[
              GridViewBuilder(
                items: [
                  "Psicología",
                  "psiquiatra",
                  "Nutrición",
                  "Médico general",
                  "Inyectología",
                  "Geriatra",
                  "Fisioterapia",
                  "Enfermeria",
                ],
              ),
              // Segunda pestaña: sección "Acerca de nosotros"
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Acerca de Nosotros: En RappiMedi, creemos que la salud no debe esperar. Somos una plataforma dedicada a conectar a profesionales de la salud con pacientes que necesitan atención médica desde la comodidad de su hogar. Nuestro propósito es facilitar el acceso a servicios de salud de calidad, brindando rapidez, confianza y un trato humano a quienes más lo necesitan.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: Image.asset(
                        'lib/assets/medico.jfif',
                        height: 150,
                      ),
                    ),
                  ],
                ),
              ),
              // Tercera pestaña: sección de métodos de pago
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Métodos de pago', // Encabezado principal
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                      // Lista de métodos de pago
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      child: Text(
                        'En RappiMedi ofrecemos múltiples opciones para que elijas el método de pago que más te convenga:',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 4.0,
                      ),
                      child: Text(
                        '- **Tarjetas de crédito y débito**: Aceptamos Visa, MasterCard y American Express.',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 4.0,
                      ),
                      child: Text(
                        '- **Transferencias bancarias**: Realiza pagos directamente desde tu banco.',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 4.0,
                      ),
                      child: Text(
                        '- **Pago contra entrega**: Disponible para ciertos servicios.',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 4.0,
                      ),
                      child: Text(
                        '- **Aplicaciones de pago móvil**: Incluimos opciones como Nequi y Daviplata.',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Clase para construir un GridView personalizado con los servicios médicos
class GridViewBuilder extends StatelessWidget {
  final List<String> items;

  const GridViewBuilder({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // 1 columna
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3.0, // Relación de aspecto
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 159, 185, 224), // Gris claro

              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                items[index], // Ahora los nombres son personalizados
                style: const TextStyle(color: Colors.white, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
    );
  }
}
