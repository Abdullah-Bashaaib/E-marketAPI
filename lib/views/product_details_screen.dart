import 'package:e_market_api/controllers/product_controller.dart';
import 'package:e_market_api/models/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final Product product;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemBackground,
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          "${widget.product.title}",
          style: const TextStyle(
            color: CupertinoColors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        backgroundColor: CupertinoColors.activeBlue.withOpacity(0.5),
        automaticBackgroundVisibility: false,
        enableBackgroundFilterBlur: true,
      ),
      child: SafeArea(
        child: FutureBuilder(
          future: ProductController().getProduct(widget.product.id!),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Hero Image
                    Container(
                      height: 300,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemGrey6,
                        image: DecorationImage(
                          image:
                              NetworkImage(snapshot.data!.thumbnail.toString()),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Product Info
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title
                          Text(
                            "${widget.product.title}",
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: CupertinoColors.black,
                              height: 1.3,
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Price Section
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "\$${widget.product.price}",
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                  color: CupertinoColors.activeBlue,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          // Divider
                          Container(
                            height: 1,
                            color: CupertinoColors.systemGrey5,
                          ),
                          const SizedBox(height: 24),
                          // Description Header
                          const Text(
                            "Description",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: CupertinoColors.black,
                            ),
                          ),
                          const SizedBox(height: 12),
                          // Description
                          Text(
                            "${widget.product.description}",
                            style: TextStyle(
                              fontSize: 15,
                              height: 1.5,
                              color: CupertinoColors.black.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
            return const Center(
              child: CupertinoActivityIndicator(
                radius: 18,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(
            CupertinoIcons.checkmark_circle_fill,
            color: CupertinoColors.activeBlue,
            size: 16,
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              color: CupertinoColors.black.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }
}
