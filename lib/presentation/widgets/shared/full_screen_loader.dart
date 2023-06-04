import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessges() {
    final messages = <String>[
      'Cargando peliculas...',
      'Comprando palomitas...',
      'Acomodando asientos...',
      'Limpiando la sala...',
      'Preparando la pantalla...',
      'Tapando la luz...',
      'Apagando el celular...',
      'Apagando las luces...',
      'Acomodando el proyector...',
      'Acomodando el sonido...',
      'Acomodando el aire acondicionado...',
      'Accionando el proyector...',
      'Esta tardando un poco...',
    ];
    return Stream.periodic(const Duration(milliseconds: 500), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Epere por favor...'),
          const SizedBox(height: 10),
          const CircularProgressIndicator(strokeWidth: 2),
          const SizedBox(height: 10),
          StreamBuilder(
            stream: getLoadingMessges(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text('Caragando...');

              return Text(snapshot.data!);
            },
          ),
        ],
      ),
    );
  }
}
