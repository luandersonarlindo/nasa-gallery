import 'package:flutter/material.dart';
import 'package:nasa_app/common/constants/app_colors.dart';
import 'package:nasa_app/common/constants/app_text_styles.dart';
import 'package:nasa_app/features/gallery_page/dialog_image_details.dart';
import 'package:nasa_app/features/home_page/home_page.dart';
import 'package:nasa_app/service/nasa_service.dart';
import 'package:nasa_app/widgets/custom_form_field.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  late Future<List<dynamic>> _nasaPhotos;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nasaPhotos = NasaService().searchImages('Mars');
  }

  void _executeSearch(String value) {
    if (value.isNotEmpty) {
      setState(() {
        _nasaPhotos = NasaService().searchImages(value);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        floatingActionButton: IconButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
          icon: Icon(Icons.home),
          color: AppColors.white,
          style: IconButton.styleFrom(
            shape: CircleBorder(),
            padding: .all(16),
            backgroundColor: AppColors.bluePrimary,
          ),
        ),
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
            "Gallery",
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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: CustomFormField(
                      controller: _searchController,
                      onFieldSubmited: _executeSearch,
                      sufixIcon: Icon(Icons.search),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder<List<dynamic>>(
                future: _nasaPhotos,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Erro ao carregar galeria',
                        style: AppTextStyles.mediumText,
                      ),
                    );
                  }

                  final items = snapshot.data ?? [];

                  if (items.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: .center,
                        children: [
                          Icon(
                            Icons.search_off,
                            size: 80,
                            color: AppColors.redPrimary,
                          ),
                          Text(
                            'Nothing founded for:\n "${_searchController.text}"',
                            style: AppTextStyles.mediumText.copyWith(
                              color: AppColors.redSecondary,
                            ),
                            textAlign: .center,
                          ),
                        ],
                      ),
                    );
                  }

                  return ListView.builder(
                    padding: EdgeInsets.all(20),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      final String imageUrl = item['links'][0]['href'];
                      final String title = item['data'][0]['title'];
                      final String description = item['data'][0]['description'];
                      final String date = item['data'][0]['date_created'];
                      final String? photographer =
                          item['data'][0]['photographer'];

                      return Container(
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          borderRadius: .circular(20),
                          color: AppColors.grey,
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
                        child: Column(
                          crossAxisAlignment: .stretch,
                          children: [
                            InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => DialogImageDetails(
                                    igmUrl: imageUrl,
                                    title: title,
                                    description: description,
                                    photographer: photographer ?? 'NASA',
                                    date: date,
                                  ),
                                );
                              },
                              child: ClipRRect(
                                borderRadius: .vertical(top: .circular(20)),
                                child: Image.network(
                                  loadingBuilder: (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return SizedBox(
                                      height: 250,
                                      child: Center(
                                        child: SizedBox(
                                          height: 30,
                                          child: CircularProgressIndicator(
                                            color: AppColors.redPrimary,
                                            value:
                                                loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                          .cumulativeBytesLoaded /
                                                      loadingProgress
                                                          .expectedTotalBytes!
                                                : null,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  imageUrl,
                                  height: 250,
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, _, _) =>
                                      Icon(Icons.broken_image),
                                ),
                              ),
                            ),
                            Container(height: 3, color: AppColors.redPrimary),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 12,
                                right: 12,
                                top: 12,
                                bottom: 0,
                              ),
                              child: Text(
                                title,
                                style: AppTextStyles.titleAppBar.copyWith(
                                  fontSize: 18,
                                  color: AppColors.blueSecondary,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 12,
                                right: 12,
                                top: 0,
                                bottom: 12,
                              ),
                              child: Text(
                                photographer ?? 'NASA',
                                style: AppTextStyles.mediumText.copyWith(
                                  fontSize: 16,
                                  color: AppColors.redSecondary,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
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
}
