class Wisata {
  final String? id;
  final String nama;
  final String lokasi;
  final String deskripsi;
  final String jam;
  final String htm;
  final String gambarPath;
  bool isFavorite;

  Wisata({
    this.id,
    required this.nama,
    required this.lokasi,
    required this.deskripsi,
    required this.jam,
    required this.htm,
    required this.gambarPath,
    this.isFavorite = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'lokasi': lokasi,
      'deskripsi': deskripsi,
      'jam': jam,
      'htm': htm,
      'gambarPath': gambarPath,
      'isFavorite': isFavorite ? 1 : 0,
    };
  }

  factory Wisata.fromMap(Map<String, dynamic> map) {
    return Wisata(
      id: map['id']?.toString(),
      nama: map['nama'] ?? '',
      lokasi: map['lokasi'] ?? '',
      deskripsi: map['deskripsi'] ?? '',
      jam: map['jam'] ?? '',
      htm: map['htm'] ?? '',
      gambarPath: map['gambarPath'] ?? '',
      isFavorite: map['isFavorite'] == 1 || map['isFavorite'] == true,
    );
  }
}