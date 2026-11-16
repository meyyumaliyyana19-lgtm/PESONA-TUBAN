import 'package:flutter/material.dart';
import '../../models/wisata_model.dart';
import '../../theme/app_theme.dart';

class WisataDetailScreen extends StatefulWidget {
  final Wisata wisata;
  final Function() onFavoriteToggle;

  const WisataDetailScreen({
    super.key,
    required this.wisata,
    required this.onFavoriteToggle,
  });

  @override
  State<WisataDetailScreen> createState() => _WisataDetailScreenState();
}

class _WisataDetailScreenState extends State<WisataDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.wisata.nama),
        actions: [
          IconButton(
            icon: Icon(
              widget.wisata.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: widget.wisata.isFavorite ? Colors.red : Colors.black54,
            ),
            onPressed: () {
              setState(() {
                widget.onFavoriteToggle();
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    widget.wisata.isFavorite
                        ? "Ditambahkan ke favorit"
                        : "Dihapus dari favorit",
                  ),
                  duration: const Duration(seconds: 1),
                  backgroundColor: const Color(0xFF6B113B),
                ),
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImageWidget(widget.wisata.gambarPath, widget.wisata.nama[0]),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.wisata.nama,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.darkTextColor,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: AppTheme.primaryColor, size: 18),
                      const SizedBox(width: 4),
                      Text(
                        widget.wisata.lokasi,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppTheme.cardBgColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Jam Operasional", style: TextStyle(fontSize: 12, color: Colors.black54)),
                              const SizedBox(height: 4),
                              Text(
                                widget.wisata.jam,
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppTheme.cardBgColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Tiket Masuk (HTM)", style: TextStyle(fontSize: 12, color: Colors.black54)),
                              const SizedBox(height: 4),
                              Text(
                                widget.wisata.htm,
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Deskripsi Destinasi",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.wisata.deskripsi,
                    style: const TextStyle(
                      fontSize: 15,
                      height: 1.5,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageWidget(String path, String fallbackLetter) {
    return Image.asset(
      path,
      width: double.infinity,
      height: 280,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          height: 280,
          width: double.infinity,
          color: AppTheme.cardBgColor,
          child: Center(
            child: Text(
              fallbackLetter,
              style: const TextStyle(
                fontSize: 64,
                fontWeight: FontWeight.bold,
                color: AppTheme.secondaryColor,
              ),
            ),
          ),
        );
      },
    );
  }
}