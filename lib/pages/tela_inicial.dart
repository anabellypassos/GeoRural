import 'package:flutter/material.dart';
import 'package:projetoloca/pages/cadastro_propriedades.dart';
import 'package:projetoloca/pages/ver_propriedades.dart';


class TelaInicial extends StatelessWidget {

  const TelaInicial (String s, {super.key, required String title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Center(
              child: Text(
                'GeoRural',
                style: TextStyle(
                  color: Colors.brown,
                  fontFamily: 'Roboto',
                  
                ),
              ),
            ),
          ],
        ),

      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(70.0),
            child: Center(
            child: Image.asset(
              'assets/img/235861.png',
              width: 250.0,
              height: 250.0,
              ),
            ),
            
          ),
           SizedBox(
            width: 250,
            height: 50,
             child: ElevatedButton(
              onPressed: () {
                // Navegar para a tela de cadastro de propriedades
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CadastroPropriedades(
                      "Cadastrar",
                      title: '',
                    ),
                  ),
                );
              }, 
                       style:ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(const Color.fromARGB(215, 255, 170, 74)), // Substituindo o MaterialStateProperty
                       ) ,
              child: const Text(
                'Adicionar nova Propriedade',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.white
                ),
                ),
                       ),
           ),
             Padding(
               padding: const EdgeInsets.all(20.0),
               child: SizedBox(
                width: 250,
                           height: 50,
                 child: ElevatedButton(
                             onPressed: () {
                  // Navegar para a tela de cadastro de propriedades
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VerPropriedades(
                        "Propriedades",
                        title: '',
                      ),
                    ),
                  );
                             }, 
                           style:ButtonStyle(
                             backgroundColor: WidgetStateProperty.all<Color>(const Color.fromARGB(215, 255, 170, 74)), // Substituindo o MaterialStateProperty
                         ) ,
                             child: const Text(
                  'Visualizar propriedades',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color:  Colors.white
                  ),
                  
                  ),
                           ),
               ),
             ),
        ],
      ),
    );
  }
}