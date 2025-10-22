import 'package:flutter/material.dart';

class TelaEditarRestaurante extends StatefulWidget {
  /// Espera um mapa com chaves: "nome", "tipo", "latitude", "longitude".
  /// Exemplo:
  /// {
  ///   "nome": "Restaurante X",
  ///   "tipo": "Japonesa",
  ///   "latitude": "23.561684",
  ///   "longitude": "-46.625378"
  /// }
  final Map<String, dynamic> restaurante;

  const TelaEditarRestaurante({
    Key? key,
    required this.restaurante,
  }) : super(key: key);

  @override
  State<TelaEditarRestaurante> createState() => _TelaEditarRestauranteState();
}

class _TelaEditarRestauranteState extends State<TelaEditarRestaurante> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nomeController;
  late TextEditingController _latitudeController;
  late TextEditingController _longitudeController;
  String? _tipoSelecionado;

  final List<String> _tipos = [
    'Japonesa',
    'Italiana',
    'Brasileira',
    'Lanchonete',
    'Mexicana',
    'Outros',
  ];

  @override
  void initState() {
    super.initState();
    _nomeController = TextEditingController(text: widget.restaurante['nome'] ?? '');
    _latitudeController = TextEditingController(text: widget.restaurante['latitude']?.toString() ?? '');
    _longitudeController = TextEditingController(text: widget.restaurante['longitude']?.toString() ?? '');
    _tipoSelecionado = widget.restaurante['tipo'] as String? ?? _tipos.first;
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _latitudeController.dispose();
    _longitudeController.dispose();
    super.dispose();
  }

  void _salvar() {
    if (_formKey.currentState?.validate() ?? false) {
      final atualizado = {
        ...widget.restaurante,
        'nome': _nomeController.text.trim(),
        'tipo': _tipoSelecionado,
        'latitude': _latitudeController.text.trim(),
        'longitude': _longitudeController.text.trim(),
      };

      // Retorna os dados atualizados para a rota anterior
      Navigator.of(context).pop(atualizado);
    }
  }

  void _cancelar() {
    Navigator.of(context).pop(null);
  }

  String? _validadorTextoObrigatorio(String? v) {
    if (v == null || v.trim().isEmpty) return 'Campo obrigatório';
    return null;
  }

  String? _validadorCoordenada(String? v) {
    if (v == null || v.trim().isEmpty) return 'Campo obrigatório';
    final parsed = double.tryParse(v.replaceAll(',', '.'));
    if (parsed == null) return 'Insira um número válido';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Restaurante'),
        actions: [
          IconButton(
            onPressed: _salvar,
            icon: const Icon(Icons.save),
            tooltip: 'Salvar',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text(
                'Informações do Restaurante',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(
                  labelText: 'Nome do Restaurante',
                  border: OutlineInputBorder(),
                ),
                validator: _validadorTextoObrigatorio,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _tipoSelecionado,
                decoration: const InputDecoration(
                  labelText: 'Tipo de comida',
                  border: OutlineInputBorder(),
                ),
                items: _tipos
                    .map((t) => DropdownMenuItem<String>(
                  value: t,
                  child: Text(t),
                ))
                    .toList(),
                onChanged: (v) => setState(() => _tipoSelecionado = v),
                validator: (v) => v == null || v.isEmpty ? 'Selecione um tipo' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _latitudeController,
                decoration: const InputDecoration(
                  labelText: 'Latitude',
                  border: OutlineInputBorder(),
                  hintText: 'Ex: -23.561684',
                ),
                keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                validator: _validadorCoordenada,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _longitudeController,
                decoration: const InputDecoration(
                  labelText: 'Longitude',
                  border: OutlineInputBorder(),
                  hintText: 'Ex: -46.625378',
                ),
                keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                validator: _validadorCoordenada,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: _salvar,
                    icon: const Icon(Icons.save),
                    label: const Text('Salvar'),
                  ),
                  const SizedBox(width: 12),
                  OutlinedButton.icon(
                    onPressed: _cancelar,
                    icon: const Icon(Icons.close),
                    label: const Text('Cancelar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
