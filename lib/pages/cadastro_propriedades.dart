
import 'package:flutter/material.dart';

class CadastroPropriedades extends StatelessWidget {
  CadastroPropriedades(String s, {super.key, required String title});

  // Definição da chave para o formulário
  final formKey = GlobalKey<FormState>();

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
  final number = num.tryParse(value); // Tenta converter o valor em um número
  if (number == null) {
    return 'Por favor, insira apenas números válidos';
  }
  return null; // Retorna nulo se o valor for válido
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Adicionar nova propriedade',
            style: TextStyle(
              color: Colors.brown,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey, // Um único Form para envolver todos os campos
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
                  validator: (value) => validateRequired(value),
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
                  validator: (value) => validateRequired(value),
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
                  validator: (value) => validateNumber(value),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '12° 58\' 16"',
                  ),
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
                  validator: (value) => validateNumber(value),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '38° 30\' 39"',
                  ),
                ),

                const SizedBox(height: 20),

                // Botão Salvar
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // Ação ao salvar
                    }
                  },
                  child: const Text('Salvar'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
