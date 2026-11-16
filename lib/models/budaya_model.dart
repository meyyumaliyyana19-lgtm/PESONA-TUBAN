class Budaya {
  final String? id;
  final String nama;
  final String kategori;
  final String deskripsi;
  final String gambarPath;
  bool isFavorite;

  Budaya({
    this.id,
    required this.nama,
    required this.kategori,
    required this.deskripsi,
    required this.gambarPath,
    this.isFavorite = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'kategori': kategori,
      'deskripsi': deskripsi,
      'gambarPath': gambarPath,
      'isFavorite': isFavorite ? 1 : 0,
    };
  }

  factory Budaya.fromMap(Map<String, dynamic> map) {
    return Budaya(
      id: map['id']?.toString(),
      nama: map['nama'] ?? '',
      kategori: map['kategori'] ?? '',
      deskripsi: map['deskripsi'] ?? '',
      gambarPath: map['gambarPath'] ?? '',
      isFavorite: map['isFavorite'] == 1 || map['isFavorite'] == true,
    );
  }
}