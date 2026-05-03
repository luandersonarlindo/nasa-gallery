import 'package:flutter/material.dart';
import 'package:nasa_app/common/constants/app_colors.dart';
import 'package:nasa_app/common/constants/app_text_styles.dart';
import 'package:nasa_app/features/gallery_page/gallery_page.dart';
import 'package:nasa_app/widgets/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkGrey,
        elevation: 6,
        shadowColor: AppColors.black,
        toolbarHeight: 72,
        shape: const Border(
          bottom: BorderSide(color: AppColors.redPrimary, width: 3),
        ),
        centerTitle: true,
        title: Text(
          "NASA",
          style: AppTextStyles.titleAppBar.copyWith(
            color: AppColors.redSecondary,
            letterSpacing: -1.44,
            shadows: const [
              Shadow(
                color: Color(0x33000000),
                offset: Offset(0, 4),
                blurRadius: 6,
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x31000000),
                    blurRadius: 15,
                    offset: Offset(0, 4),
                  ),
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/images/home_bg.jpg'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 350,
                  child: Text(
                    'Welcome',
                    style: AppTextStyles.largeText.copyWith(
                      color: AppColors.blueSecondary,
                      height: 1.0, // 30/30
                      fontSize: AppTextStyles.largeText.fontSize,
                      shadows: const [
                        Shadow(
                          color: Color(0x33000000),
                          offset: Offset(2, 2),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 350,
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi fermentum aliquam nulla in laoreet. Aenean sit amet dignissim nisi, vel semper risus. Donec a lacinia massa.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi fermentum aliquam nulla in laoreet.',
                    style: AppTextStyles.mediumText.copyWith(
                      color: AppColors.darkGrey,
                      height: 1.5, // 27/18
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: SizedBox(
              width: 120,
              height: 45,
              child: CustomButton(
                text: "Gallery",
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GalleryPage()),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
