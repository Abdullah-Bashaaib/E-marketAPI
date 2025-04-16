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
                      child: Stack(
                        children: [
                          // Discount Badge
                          Positioned(
                            top: 16,
                            left: 16,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: CupertinoColors.systemRed,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Text(
                                "20% OFF",
                                style: TextStyle(
                                  color: CupertinoColors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),

                          // Favorite Button
                          Positioned(
                            top: 16,
                            right: 16,
                            child: Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                color: CupertinoColors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: Icon(
                                  CupertinoIcons.heart,
                                  size: 20,
                                  color: CupertinoColors.systemGrey,
                                ),
                              ),
                            ),
                          ),
                        ],
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

                          // Rating
                          Row(
                            children: [
                              const Icon(
                                CupertinoIcons.star_fill,
                                color: Color(0xFFFFC107),
                                size: 16,
                              ),
                              const Icon(
                                CupertinoIcons.star_fill,
                                color: Color(0xFFFFC107),
                                size: 16,
                              ),
                              const Icon(
                                CupertinoIcons.star_fill,
                                color: Color(0xFFFFC107),
                                size: 16,
                              ),
                              const Icon(
                                CupertinoIcons.star_fill,
                                color: Color(0xFFFFC107),
                                size: 16,
                              ),
                              const Icon(
                                CupertinoIcons.star_lefthalf_fill,
                                color: Color(0xFFFFC107),
                                size: 16,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                "4.5",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: CupertinoColors.black.withOpacity(0.7),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                "(125 Reviews)",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: CupertinoColors.black.withOpacity(0.5),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 16),

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
                              const SizedBox(width: 8),
                              Text(
                                "\$${(double.parse(widget.product.price.toString()) * 1.2).toStringAsFixed(2)}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: CupertinoColors.systemGrey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                  color: CupertinoColors.activeGreen
                                      .withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.checkmark_circle,
                                      color: CupertinoColors.activeGreen,
                                      size: 14,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      "In Stock",
                                      style: TextStyle(
                                        color: CupertinoColors.activeGreen,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
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

                          const SizedBox(height: 24),

                          // Features
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: CupertinoColors.systemGrey6,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Highlights",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: CupertinoColors.black,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                _buildFeatureItem("Premium Quality"),
                                _buildFeatureItem("Fast Shipping"),
                                _buildFeatureItem("30-Day Returns"),
                                _buildFeatureItem("Secure Checkout"),
                              ],
                            ),
                          ),

                          const SizedBox(height: 32),

                          // Add to Cart Button
                          SizedBox(
                            width: double.infinity,
                            child: CupertinoButton(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              color: CupertinoColors.activeBlue,
                              borderRadius: BorderRadius.circular(8),
                              child: const Text(
                                "Add to Cart",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: CupertinoColors.white,
                                ),
                              ),
                              onPressed: () {
                                // Add to cart functionality
                              },
                            ),
                          ),

                          const SizedBox(height: 32),
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
