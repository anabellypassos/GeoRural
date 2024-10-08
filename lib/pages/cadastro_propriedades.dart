import 'package:flutter/material.dart';


class CadastroPropriedades extends StatelessWidget {
  const CadastroPropriedades(String s, {super.key, required String title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: const Center(
          child: Text(
            'GeoRural',
            style: TextStyle(
              color: Colors.brown,
              fontFamily: 'Roboto',
              
            ),
          ),
        ),
      ),
      body: const Center(
      
      ),
    );
  }
}
