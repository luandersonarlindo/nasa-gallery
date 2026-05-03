import 'package:flutter/material.dart';
import 'package:nasa_app/common/constants/app_colors.dart';
import 'package:nasa_app/common/constants/app_text_styles.dart';

class DialogImageDetails extends StatelessWidget {
  final String igmUrl;
  final String title;
  final String description;
  final String photographer;
  final String date;

  const DialogImageDetails({
    super.key,
    required this.igmUrl,
    required this.title,
    required this.description,
    required this.date,
    required this.photographer,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Center(
        child: Container(
          height: 520,
          decoration: BoxDecoration(
            color: AppColors.grey,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                child: Image.network(
                  igmUrl,
                  height: 250,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) =>
                      const Icon(Icons.broken_image, size: 250),
                ),
              ),
              Container(height: 3, color: AppColors.redPrimary),
              Flexible(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Title: $title',
                        style: AppTextStyles.mediumText.copyWith(
                          color: AppColors.black,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'Photographer: $photographer',
                        style: AppTextStyles.mediumText.copyWith(
                          fontSize: 16,
                          color: AppColors.black,
                        ),
                        maxLines: 2,
                        overflow: .ellipsis,
                      ),
                      const Divider(
                        height: 20,
                        thickness: 2,
                        color: AppColors.bluePrimary,
                      ),
                      Text(
                        description,
                        style: AppTextStyles.mediumText.copyWith(
                          fontSize: 14,
                          color: AppColors.darkGrey,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Date: ${date.length >= 10 ? date.substring(0, 10) : date}',
                        style: AppTextStyles.smallText.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
