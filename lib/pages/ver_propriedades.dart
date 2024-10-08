import 'package:flutter/material.dart';

class VerPropriedades extends StatelessWidget {

  const VerPropriedades(String s, {super.key, required String title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text(
          'Minhas Tarefas',
          style: TextStyle(
            color: Colors.purple[800],
          ),
        ),
      ),
      body: const Center(
        
      ),
    );
  }
}
