import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class CtrtListProduct extends StatelessWidget {
  final List<Product> products;
  const CtrtListProduct({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: EdgeInsets.zero,
      crossAxisSpacing: 10,
      mainAxisSpacing: 20,
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: 1 / 1.55,
      children: <Widget>[
        for (var i = 0; i < products.length; i++)
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              //color: CtrtColors.transparentGrey.withValues(alpha: 0.2),
              border: Border.all(color: CtrtColors.transparentGrey, width: 0.8),
            ),
            child: Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(products[i].image),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: CtrtColors.lightGrey,
                    ),
                  ),
                ),
                CtrtText.extraBold(text: products[i].name, textSize: 12),
                Row(
                  spacing: 5,
                  children: [
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: CtrtColors.primary,
                          width: 0.5,
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.storefront_outlined,
                          size: 15,
                          color: CtrtColors.primary,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CtrtText.regular(
                            text: products[i].shopName,
                            textSize: 12,
                            textColor: CtrtColors.primary,
                          ),
                          CtrtText.extraRegular(
                            text: "Dakar/Sénégal",
                            textSize: 12,
                            textColor: CtrtColors.textPrimary,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: CtrtColors.lightGrey,
                  thickness: 0.5,
                  height: 0.5,
                ),
                Row(
                  spacing: 10,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 3),
                        CtrtIconButton(
                          icon: Icon(
                            Icons.tag_outlined,
                            size: 15,
                            color: CtrtColors.textSecondary,
                          ),
                          isCircle: false,
                          radius: 5,
                          color: CtrtColors.transparentGrey,
                          borderColor: CtrtColors.textSecondary,
                          padding: 4,
                        ),
                        CtrtText.medium(
                          text: "10 En Stock",
                          textSize: 10,
                          textColor: CtrtColors.primary,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 3),
                        CtrtIconButton(
                          icon: Icon(
                            Icons.palette_outlined,
                            size: 15,
                            color: CtrtColors.textPrimary,
                          ),
                          isCircle: false,
                          radius: 5,
                          color: CtrtColors.transparentGrey,
                          borderColor: CtrtColors.textPrimary,
                          padding: 4,
                        ),
                        CtrtText.medium(
                          text: "4 Couleurs",
                          textSize: 10,
                          textColor: CtrtColors.primary,
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(
                  color: CtrtColors.lightGrey,
                  thickness: 0.5,
                  height: 0.5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CtrtText.bold(
                        text: '${products[i].price} FCFA',
                        textSize: 13,
                        textColor: CtrtColors.darkOrange,
                      ),
                    ),
                    Icon(
                      Icons.add_shopping_cart_outlined,
                      color: CtrtColors.primary,
                    )
                  ],
                )
              ],
            ),
          ),
      ],
    );
  }
}

class Product {
  final String name;
  final String shopName;
  final double price;
  final String image;

  Product({
    required this.name,
    required this.price,
    required this.image,
    required this.shopName,
  });
}
