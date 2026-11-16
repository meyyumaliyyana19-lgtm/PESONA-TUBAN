class Laporan {
  final String? id;
  final String namaPelapor;
  final String kategori;
  final String lokasiWisata;
  final String deskripsi;
  String status; // "Pending", "Diproses", "Selesai"

  Laporan({
    this.id,
    required this.namaPelapor,
    required this.kategori,
    required this.lokasiWisata,
    required this.deskripsi,
    this.status = "Pending",
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'namaPelapor': namaPelapor,
      'kategori': kategori,
      'lokasiWisata': lokasiWisata,
      'deskripsi': deskripsi,
      'status': status,
    };
  }

  factory Laporan.fromMap(Map<String, dynamic> map) {
    return Laporan(
      id: map['id']?.toString(),
      namaPelapor: map['namaPelapor'] ?? '',
      kategori: map['kategori'] ?? '',
      lokasiWisata: map['lokasiWisata'] ?? '',
      deskripsi: map['deskripsi'] ?? '',
      status: map['status'] ?? 'Pending',
    );
  }
}