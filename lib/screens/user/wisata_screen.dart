import 'package:flutter/material.dart';
import '../../db/database_helper.dart';
import '../../theme/app_theme.dart';
import 'wisata_detail_screen.dart';

class WisataScreen extends StatefulWidget {
  final Function(int) onNavigateTab;

  const WisataScreen({super.key, required this.onNavigateTab});

  @override
  State<WisataScreen> createState() => _WisataScreenState();
}

class _WisataScreenState extends State<WisataScreen> {
  @override
  Widget build(BuildContext context) {
    final wisataList = DatabaseHelper.instance.getWisata();

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: wisataList.length,
      itemBuilder: (context, index) {
        final item = wisataList[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WisataDetailScreen(
                    wisata: item,
                    onFavoriteToggle: () {
                      setState(() {
                        DatabaseHelper.instance.toggleFavoriteWisata(index);
                      });
                    },
                  ),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildImageWidget(item.gambarPath, item.nama[0]),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              item.nama,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              item.isFavorite ? Icons.favorite : Icons.favorite_border,
                              color: item.isFavorite ? Colors.red : Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                DatabaseHelper.instance.toggleFavoriteWisata(index);
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    item.isFavorite
                                        ? "Ditambahkan ke favorit"
                                        : "Dihapus dari favorit",
                                  ),
                                  duration: const Duration(seconds: 1),
                                  backgroundColor: const Color(0xFF6B113B),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      Text(
                        item.lokasi,
                        style: const TextStyle(
                          color: AppTheme.darkTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        item.deskripsi,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 13, color: Colors.black87),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Jam: ${item.jam}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: AppTheme.darkTextColor,
                            ),
                          ),
                          Text(
                            "HTM: ${item.htm}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: AppTheme.darkTextColor,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildImageWidget(String path, String fallbackLetter) {
    return Image.asset(
      path,
      width: double.infinity,
      height: 220,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          height: 220,
          width: double.infinity,
          color: AppTheme.cardBgColor,
          child: Center(
            child: Text(
              fallbackLetter,
              style: const TextStyle(
                fontSize: 48,
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