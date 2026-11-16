import 'package:flutter/material.dart';
import '../../db/database_helper.dart';
import '../../theme/app_theme.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  Color _getStatusBgColor(String status) {
    switch (status) {
      case "Diproses":
        return const Color(0xFFE3F2FD);
      case "Selesai":
        return const Color(0xFFE8F5E9);
      default:
        return const Color(0xFFFFF9C4); // Pending
    }
  }

  Color _getStatusTextColor(String status) {
    switch (status) {
      case "Diproses":
        return const Color(0xFF1E88E5);
      case "Selesai":
        return const Color(0xFF388E3C);
      default:
        return const Color(0xFFF57F17); // Pending
    }
  }

  @override
  Widget build(BuildContext context) {
    final laporanList = DatabaseHelper.instance.getLaporan();

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: laporanList.length,
      itemBuilder: (context, index) {
        final item = laporanList[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item.lokasiWisata,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: _getStatusBgColor(item.status),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        item.status,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: _getStatusTextColor(item.status),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  "${item.kategori} - oleh ${item.namaPelapor}",
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.darkTextColor,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  item.deskripsi,
                  style: const TextStyle(fontSize: 13, color: Colors.black87),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}