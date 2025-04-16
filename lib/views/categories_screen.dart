import 'package:e_market_api/controllers/categry_controller.dart';
import 'package:e_market_api/views/products_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.title});

  final String title;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final ApiService apiService = ApiService();

  // دالة لجلب البيانات
  Future<List<String>> _fetchCategories() async {
    return await apiService.fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemBackground,
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: CupertinoColors.white,
          ),
        ),
        enableBackgroundFilterBlur: true,
        backgroundColor: CupertinoColors.activeBlue.withOpacity(0.5),
        automaticBackgroundVisibility: false,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Categories List
            Expanded(
              child: FutureBuilder<List<String>>(
                future: _fetchCategories(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CupertinoActivityIndicator(
                        radius: 16,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.exclamationmark_circle,
                          size: 50,
                          color: CupertinoColors.systemRed.withOpacity(0.8),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'خطأ: ${snapshot.error}',
                          style: const TextStyle(
                            color: CupertinoColors.destructiveRed,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        CupertinoButton(
                          color: const Color(0xFF2196F3),
                          borderRadius: BorderRadius.circular(12),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          child: const Text(
                            'إعادة المحاولة',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            setState(() {});
                          },
                        ),
                      ],
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.shopping_cart,
                            size: 60,
                            color: CupertinoColors.systemGrey.withOpacity(0.5),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'لا توجد فئات متاحة',
                            style: TextStyle(
                              fontSize: 18,
                              color: CupertinoColors.systemGrey,
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  final categories = snapshot.data!;
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.1,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      final Color categoryColor = _getCategoryColor(index);

                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            CupertinoPageRoute(
                              builder: (context) => ProductsScreen(
                                category: categories[index],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: categoryColor.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: CupertinoColors.systemGrey5,
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 64,
                                height: 64,
                                decoration: BoxDecoration(
                                  color: categoryColor.withOpacity(0.2),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  _getCategoryIcon(category),
                                  color: categoryColor,
                                  size: 32,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                category,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: CupertinoColors.black.withOpacity(0.8),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper methods to assign colors and icons to categories
  Color _getCategoryColor(int index) {
    final colors = [
      const Color(0xFF2196F3), // Blue
      const Color(0xFFF44336), // Red
      const Color(0xFF4CAF50), // Green
      const Color(0xFFFF9800), // Orange
      const Color(0xFF9C27B0), // Purple
      const Color(0xFF009688), // Teal
    ];

    return colors[index % colors.length];
  }

  IconData _getCategoryIcon(String category) {
    final Map<String, IconData> icons = {
      'electronics': CupertinoIcons.device_phone_portrait,
      'jewelery': CupertinoIcons.sparkles,
      "men's clothing": CupertinoIcons.person,
      "women's clothing": CupertinoIcons.person_2,
    };

    return icons[category.toLowerCase()] ?? CupertinoIcons.tag;
  }
}
