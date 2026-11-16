import 'package:flutter/material.dart';
import '../../db/database_helper.dart';
import '../../theme/app_theme.dart';
import 'budaya_detail_screen.dart';

class BudayaScreen extends StatefulWidget {
  const BudayaScreen({super.key});

  @override
  State<BudayaScreen> createState() => _BudayaScreenState();
}

class _BudayaScreenState extends State<BudayaScreen> {
  @override
  Widget build(BuildContext context) {
    final budayaList = DatabaseHelper.instance.getBudaya();

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: budayaList.length,
      itemBuilder: (context, index) {
        final item = budayaList[index];
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
                  builder: (context) => BudayaDetailScreen(
                    budaya: item,
                    onFavoriteToggle: () {
                      setState(() {
                        DatabaseHelper.instance.toggleFavoriteBudaya(index);
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
                                DatabaseHelper.instance.toggleFavoriteBudaya(index);
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
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppTheme.cardBgColor,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          item.kategori,
                          style: const TextStyle(
                            color: AppTheme.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item.deskripsi,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 13, color: Colors.black87),
                      ),
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