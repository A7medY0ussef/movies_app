import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/theme/app_text_style.dart';
import 'package:movie_app/modules/movie_details/domain/entities/cast_entity.dart';
import 'package:movie_app/modules/movie_details/presentation/widgets/cast_list/cast_card.dart';

class CastListSection extends StatelessWidget {
  final List<CastEntity> cast;
  const CastListSection({super.key, required this.cast});

  @override
  Widget build(BuildContext context) {
    if (cast.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('details.cast'.tr(), style: AppText.s24w6.copyWith(color: AppColors.white)),
          const SizedBox(height: 4),
          ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: cast.length,
            itemBuilder: (context, index) {
              final member = cast[index];
              return CastCard(
                name: member.name,
                character: member.characterName,
                image: member.urlSmallImage,
              );
            },
          ),
        ],
      ),
    );
  }
}
