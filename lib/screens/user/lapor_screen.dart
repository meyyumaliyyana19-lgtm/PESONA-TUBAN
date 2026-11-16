import 'package:flutter/material.dart';
import '../../db/database_helper.dart';
import '../../models/laporan_model.dart';
import '../../theme/app_theme.dart';

class LaporScreen extends StatefulWidget {
  final VoidCallback onSuccessSubmit;

  const LaporScreen({super.key, required this.onSuccessSubmit});

  @override
  State<LaporScreen> createState() => _LaporScreenState();
}

class _LaporScreenState extends State<LaporScreen> {
  final _namaController = TextEditingController();
  final _deskripsiController = TextEditingController();

  final List<String> _kategoriList = [
    "Fasilitas Rusak",
    "Kebersihan",
    "Keamanan",
    "Layanan",
    "Lainnya"
  ];

  final List<String> _wisataList = [
    "Goa Akbar",
    "Pantai Boom",
    "Air Terjun Nglirip",
    "Lainnya"
  ];

  late String _selectedKategori;
  late String _selectedWisata;

  @override
  void initState() {
    super.initState();
    _selectedKategori = _kategoriList.first;
    _selectedWisata = _wisataList.first;
  }

  void _kirimLaporan() {
    final nama = _namaController.text.trim();
    final deskripsi = _deskripsiController.text.trim();

    if (nama.isEmpty || deskripsi.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Mohon isi nama dan deskripsi laporan!"),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    final newLaporan = Laporan(
      namaPelapor: nama,
      kategori: _selectedKategori,
      lokasiWisata: _selectedWisata,
      deskripsi: deskripsi,
      status: "Pending",
    );

    DatabaseHelper.instance.addLaporan(newLaporan);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Laporan berhasil dikirim"),
        backgroundColor: Color(0xFF6B113B),
      ),
    );

    _namaController.clear();
    _deskripsiController.clear();

    widget.onSuccessSubmit();
  }

  @override
  void dispose() {
    _namaController.dispose();
    _deskripsiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Laporkan kondisi wisata",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Text(
            "Nama Pelapor",
            style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.darkTextColor),
          ),
          const SizedBox(height: 6),
          TextField(
            controller: _namaController,
            decoration: const InputDecoration(
              hintText: "Nama Anda",
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            "Kategori",
            style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.darkTextColor),
          ),
          const SizedBox(height: 6),
          DropdownButtonFormField<String>(
            value: _selectedKategori,
            items: _kategoriList.map((kat) {
              return DropdownMenuItem(
                value: kat,
                child: Text(kat),
              );
            }).toList(),
            onChanged: (val) {
              if (val != null) {
                setState(() {
                  _selectedKategori = val;
                });
              }
            },
          ),
          const SizedBox(height: 14),
          const Text(
            "Lokasi Wisata",
            style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.darkTextColor),
          ),
          const SizedBox(height: 6),
          DropdownButtonFormField<String>(
            value: _selectedWisata,
            items: _wisataList.map((wis) {
              return DropdownMenuItem(
                value: wis,
                child: Text(wis),
              );
            }).toList(),
            onChanged: (val) {
              if (val != null) {
                setState(() {
                  _selectedWisata = val;
                });
              }
            },
          ),
          const SizedBox(height: 14),
          const Text(
            "Deskripsi Laporan",
            style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.darkTextColor),
          ),
          const SizedBox(height: 6),
          TextField(
            controller: _deskripsiController,
            maxLines: 4,
            decoration: const InputDecoration(
              hintText: "Jelaskan keluhan atau saran Anda...",
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _kirimLaporan,
              child: const Text("Kirim Laporan"),
            ),
          ),
        ],
      ),
    );
  }
}