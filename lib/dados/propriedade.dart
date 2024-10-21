// propriedade_model.dart

class Propriedade {
  final String estado;
  final String municipio;
  final double latitude;
  final double longitude;

  Propriedade({
    required this.estado,
    required this.municipio,
    required this.latitude,
    required this.longitude,
  });

  // Método para converter um objeto Propriedade em um mapa
  Map<String, dynamic> toMap() {
    return {
      'estado': estado,
      'municipio': municipio,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  // Método para criar um objeto Propriedade a partir de um mapa
  factory Propriedade.fromMap(Map<String, dynamic> map) {
    return Propriedade(
      estado: map['estado'],
      municipio: map['municipio'],
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }
}
