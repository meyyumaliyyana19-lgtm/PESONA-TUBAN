import 'package:flutter/material.dart';
import '../../models/budaya_model.dart';
import '../../theme/app_theme.dart';

class BudayaDetailScreen extends StatefulWidget {
  final Budaya budaya;
  final Function() onFavoriteToggle;

  const BudayaDetailScreen({
    super.key,
    required this.budaya,
    required this.onFavoriteToggle,
  });

  @override
  State<BudayaDetailScreen> createState() => _BudayaDetailScreenState();
}

class _BudayaDetailScreenState extends State<BudayaDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.budaya.nama),
        actions: [
          IconButton(
            icon: Icon(
              widget.budaya.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: widget.budaya.isFavorite ? Colors.red : Colors.black54,
            ),
            onPressed: () {
              setState(() {
                widget.onFavoriteToggle();
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    widget.budaya.isFavorite
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
            _buildImageWidget(widget.budaya.gambarPath, widget.budaya.nama[0]),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.budaya.nama,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.darkTextColor,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppTheme.cardBgColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      widget.budaya.kategori,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Deskripsi Kebudayaan",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.budaya.deskripsi,
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