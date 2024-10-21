import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VerPropriedades extends StatelessWidget {
  const VerPropriedades(String s, {super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center( 
          child: Text(
          'Ver propriedades',
          style: TextStyle(
         color: Colors.brown
          )
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('propriedades').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          }

          // Verifica se existem documentos
          final propriedades = snapshot.data?.docs;
          if (propriedades == null || propriedades.isEmpty) {
            return const Center(child: Text('Nenhuma propriedade encontrada.'));
          }

          // Exibe a lista de propriedades
          return ListView.builder(
            itemCount: propriedades.length,
            itemBuilder: (context, index) {
              final propriedade = propriedades[index].data() as Map<String, dynamic>;

              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  title: Text(propriedade['estado']),
                  subtitle: Text('Município: ${propriedade['municipio']}'),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Lat: ${propriedade['latitude']}'),
                      Text('Lng: ${propriedade['longitude']}'),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
