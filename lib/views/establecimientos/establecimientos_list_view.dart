import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navegabilidadgorouter/models/establecimiento.dart';
import 'package:navegabilidadgorouter/services/establecimiento_services.dart';
import 'package:navegabilidadgorouter/views/base_view.dart';

class EstablecimientosListView extends StatefulWidget {
  const EstablecimientosListView({super.key});

  @override
  EstablecimientosListViewState createState() =>
      EstablecimientosListViewState();
}

class EstablecimientosListViewState extends State<EstablecimientosListView> {
  final EstablecimientoService _service = EstablecimientoService();
  late Future<List<Establecimiento>> _future;

  @override
  void initState() {
    super.initState();
    _future = _service.getEstablecimientos();
  }

  Future<void> _goToEdit(int id) async {
    final result = await context.push('/establecimientos/edit/$id');
    if (result == true) {
      setState(() {
        _future = _service.getEstablecimientos();
      });
    }
  }

  Future<void> _goToCreate() async {
    final result = await context.push('/establecimientos/create');
    if (result == true) {
      setState(() {
        _future = _service.getEstablecimientos();
      });
    }
  }

  Future<void> _deleteEstablecimiento(int id) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('¿Eliminar establecimiento?'),
            content: Text(
              '¿Estás seguro de que deseas eliminar este establecimiento?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('Cancelar'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Eliminar'),
              ),
            ],
          ),
    );

    if (confirm == true) {
      await _service.deleteEstablecimiento(id);
      setState(() {
        _future = _service.getEstablecimientos();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'Establecimientos',
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<Establecimiento>>(
              future: _future,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
                    child: Text('No hay establecimientos disponibles'),
                  );
                }

                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final establecimiento = snapshot.data![index];
                    return GestureDetector(
                      onTap: () => _goToEdit(establecimiento.id),
                      child: Card(
                        margin: EdgeInsets.all(12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child:
                                    establecimiento.logo.isNotEmpty
                                        ? Image.network(
                                          '${_service.baseUrlImg}${establecimiento.logo}',
                                          width: 80,
                                          height: 80,
                                          fit: BoxFit.cover,
                                        )
                                        : Icon(
                                          Icons.image_not_supported,
                                          size: 80,
                                        ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      establecimiento.nombre,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text('NIT: ${establecimiento.nit}'),
                                    Text(
                                      'Dirección: ${establecimiento.direccion}',
                                    ),
                                    Text(
                                      'Teléfono: ${establecimiento.telefono}',
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                      onPressed:
                                          () => _deleteEstablecimiento(
                                            establecimiento.id,
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
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: _goToCreate,
              icon: Icon(Icons.add),
              label: Text('Agregar nuevo establecimiento'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
