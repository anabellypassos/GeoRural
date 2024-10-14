import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyGeoJsonMap extends StatefulWidget {
  const MyGeoJsonMap({super.key});

  @override
  _MyGeoJsonMapState createState() => _MyGeoJsonMapState();
}

class _MyGeoJsonMapState extends State<MyGeoJsonMap> {
  List<LatLng> _geoJsonPoints = [];

  @override
  void initState() {
    super.initState();
    _loadGeoJsonData();
  }

  Future<void> _loadGeoJsonData() async {
    const url = 'https://geojson.io/#map=2/0/20'; // Substitua pela URL do seu GeoJSON
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final geoJsonData = json.decode(response.body);

      // Processar o GeoJSON e extrair as coordenadas
      List coordinates = geoJsonData['features'][0]['geometry']['coordinates'];
      setState(() {
        _geoJsonPoints = coordinates
            .map((coord) => LatLng(coord[1], coord[0])) // Reverter as coordenadas
            .toList();
      });
    } else {
      debugPrint('Erro ao carregar o GeoJSON'); // Use debugPrint ou um logger
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa GeoJSON'),
      ),
      body: FlutterMap(
        options: MapOptions(
         initialCenter: const LatLng(5.494, 56.952), // Definindo o centro inicial do mapa
          initialZoom: 6.44, // Definindo o zoom inicial
          onTap: (tapPosition, latLng) {
            // Ação ao tocar no mapa
          },
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: const ['a', 'b', 'c'],
          ),
          PolylineLayer(
            polylines: [
              Polyline(
                points: _geoJsonPoints, // Pontos extraídos do GeoJSON
                strokeWidth: 3.0,
                color: Colors.blue,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
