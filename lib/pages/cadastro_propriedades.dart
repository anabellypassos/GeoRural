import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../dados/propriedade.dart';

class CadastroPropriedades extends StatelessWidget {
  CadastroPropriedades(String s, {super.key, required String title});

  // Definição da chave para o formulário
  final formKey = GlobalKey<FormState>();

  final TextEditingController estadoController = TextEditingController();
  final TextEditingController municipioController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();

  // Método para a validação da obrigatoriedade do campo
  String? validateRequired(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo Obrigatório!';
    }
    return null;
  }

  String? validateNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Esse campo deve ser preenchido com números';
    }
    final number = num.tryParse(value);
    if (number == null) {
      return 'Por favor, insira apenas números válidos';
    }
    return null;
  }

  Future<void> savePropriedade(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      final novaPropriedade = Propriedade(
        estado: estadoController.text,
        municipio: municipioController.text,
        latitude: double.parse(latitudeController.text),
        longitude: double.parse(longitudeController.text),
      );

      try {
        // Salva a nova propriedade no Firestore
        await FirebaseFirestore.instance.collection('propriedades').add(novaPropriedade.toMap());
        
        // Limpar os campos após salvar
        estadoController.clear();
        municipioController.clear();
        latitudeController.clear();
        longitudeController.clear();

        // Exibir mensagem de sucesso
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Propriedade salva com sucesso!')),
        );
      } catch (e) {
        // Exibir uma mensagem de erro
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erro ao salvar: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Adicionar nova propriedade',
            style: TextStyle(color: Colors.brown),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Campo Estado
                const SizedBox(
                  height: 50,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Estado',
                      style: TextStyle(fontSize: 20, fontFamily: 'Roboto'),
                    ),
                  ),
                ),
                TextFormField(
                  controller: estadoController,
                  validator: validateRequired,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Bahia',
                  ),
                ),
                const SizedBox(height: 20),

                // Campo Município
                const SizedBox(
                  height: 50,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Município',
                      style: TextStyle(fontSize: 20, fontFamily: 'Roboto'),
                    ),
                  ),
                ),
                TextFormField(
                  controller: municipioController,
                  validator: validateRequired,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Salvador',
                  ),
                ),
                const SizedBox(height: 20),

                // Campo Latitude
                const SizedBox(
                  height: 50,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Latitude',
                      style: TextStyle(fontSize: 20, fontFamily: 'Roboto'),
                    ),
                  ),
                ),
                TextFormField(
                  controller: latitudeController,
                  validator: validateNumber,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '12.97',
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),

                // Campo Longitude
                const SizedBox(
                  height: 50,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Longitude',
                      style: TextStyle(fontSize: 20, fontFamily: 'Roboto'),
                    ),
                  ),
                ),
                TextFormField(
                  controller: longitudeController,
                  validator: validateNumber,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '38.51',
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),

                // Botão Salvar
                ElevatedButton(
                  onPressed: () => savePropriedade(context), // Passando o context aqui
                  child: const Text('Salvar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
