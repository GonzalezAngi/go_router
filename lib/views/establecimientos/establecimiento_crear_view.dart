import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:navegabilidadgorouter/models/establecimiento.dart';
import 'package:navegabilidadgorouter/services/establecimiento_services.dart';

class EstablecimientoCrearView extends StatefulWidget {
  const EstablecimientoCrearView({super.key});

  @override
  State<EstablecimientoCrearView> createState() => _EstablecimientoCrearViewState();
}

class _EstablecimientoCrearViewState extends State<EstablecimientoCrearView> {
  final _formKey = GlobalKey<FormState>();
  final _service = EstablecimientoService();

  late TextEditingController _nombreController;
  late TextEditingController _nitController;
  late TextEditingController _direccionController;
  late TextEditingController _telefonoController;

  File? _logoFile;

  @override
  void initState() {
    super.initState();
    _nombreController = TextEditingController();
    _nitController = TextEditingController();
    _direccionController = TextEditingController();
    _telefonoController = TextEditingController();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (pickedFile != null) {
      setState(() {
        _logoFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _submit() async {
    if (_formKey.currentState!.validate()) {
      final est = Establecimiento(
        id: 0, // En la creación puede ser 0 o ignorarse en el backend
        nombre: _nombreController.text,
        nit: _nitController.text,
        direccion: _direccionController.text,
        telefono: _telefonoController.text,
        logo: '', // Este será reemplazado por la API cuando suba la imagen
        estado: 'A',
      );

      final ok = await _service.createEstablecimiento(est, logoFile: _logoFile);

      if (!mounted) return;

      if (ok) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Establecimiento creado')),
        );
        context.pop(true);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al crear el establecimiento')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crear Establecimiento')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(labelText: 'Nombre'),
                validator: (value) => value!.isEmpty ? 'Campo obligatorio' : null,
              ),
              TextFormField(
                controller: _nitController,
                decoration: const InputDecoration(labelText: 'NIT'),
                validator: (value) => value!.isEmpty ? 'Campo obligatorio' : null,
              ),
              TextFormField(
                controller: _direccionController,
                decoration: const InputDecoration(labelText: 'Dirección'),
                validator: (value) => value!.isEmpty ? 'Campo obligatorio' : null,
              ),
              TextFormField(
                controller: _telefonoController,
                decoration: const InputDecoration(labelText: 'Teléfono'),
                validator: (value) => value!.isEmpty ? 'Campo obligatorio' : null,
              ),
              const SizedBox(height: 16),
              Text('Logo:'),
              const SizedBox(height: 8),
              _logoFile != null
                  ? Image.file(_logoFile!, height: 120)
                  : const Text('No hay logo seleccionado'),
              TextButton.icon(
                onPressed: _pickImage,
                icon: const Icon(Icons.image),
                label: const Text('Seleccionar logo'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: const Text('Crear Establecimiento'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
