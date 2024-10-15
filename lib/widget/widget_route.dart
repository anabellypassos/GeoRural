// ignore: file_names
import 'package:flutter/material.dart';
import 'package:projetoloca/pages/cadastro_propriedades.dart';
import 'package:projetoloca/pages/tela_inicial.dart';
import 'package:projetoloca/pages/ver_propriedades.dart';


class WidgetRoute extends StatefulWidget {
  const WidgetRoute({super.key});

  @override
  _WidgetRouteState createState() =>_WidgetRouteState ();
}

class _WidgetRouteState  extends State<WidgetRoute> {
  int _indiceAtual = 0;
  final List<Widget> _telas = [
   const TelaInicial('Início', title: '',), 
    const VerPropriedades('Propriedades', title: ''),
  CadastroPropriedades("Cadastrar",title: '',)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: _telas[_indiceAtual],
      bottomNavigationBar: SizedBox(
        child: Container(
           
          height: 80,
          decoration: const BoxDecoration(
             borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),  
        
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              
            ),
          child: BottomNavigationBar(
            
            backgroundColor: Colors.orange[200],
            
            currentIndex: _indiceAtual,
            onTap: onTabTapped,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.map),
                label: "Início",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.map_outlined),
                label: " Propriedades",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.maps_ugc_outlined),
                label: "Adicionar ",
              ),
            ],
          ),
        ),
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }
}
