import 'package:flutter/material.dart';


class CadastroPropriedades extends StatelessWidget {
  const CadastroPropriedades(String s, {super.key, required String title});
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
 body: Column(
  children: [
    SizedBox(
      height: 50,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0), // Define a margem lateral
        child: const Align(
         alignment: Alignment.centerLeft, // Alinha à esquerda
          child: Text(
            'Estado',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Roboto'
            ),
            ),
        ) 
      ),
    ),
    Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0), // Define a margem lateral
      child: const TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Bahia',
          
        ),
      ),
    ),

SizedBox(
      height: 50,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0), // Define a margem lateral
        child: const Align(
         alignment: Alignment.centerLeft, // Alinha à esquerda
          child: Text(
            'Município',
            style: TextStyle(
              fontSize: 20,
            ),
            ),
        ) 
      ),
    ),
    Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0), // Define a margem lateral
      child: const TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Salvador',
        ),
      ),
    ),

SizedBox(
      height: 50,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0), // Define a margem lateral
        child: const Align(
         alignment: Alignment.centerLeft, // Alinha à esquerda
          child: Text(
            'Latitude',
            style: TextStyle(
              fontSize: 20,
            ),
            ),
        ) 
      ),
    ),
    Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0), // Define a margem lateral
      child: const TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: '12° 58\' 16\" ',
        ),
      ),
    ),

SizedBox(
      height: 50,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0), // Define a margem lateral
        child: const Align(
         alignment: Alignment.centerLeft, // Alinha à esquerda
          child: Text(
            'Longitude',
            style: TextStyle(
              fontSize: 20,
            ),
            ),
        ) 
      ),
    ),
    Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0), // Define a margem lateral
      child: const TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: '38° 30\' 39\" ',
        ),
      ),
    ),
  ],
),
    );
  }
}
