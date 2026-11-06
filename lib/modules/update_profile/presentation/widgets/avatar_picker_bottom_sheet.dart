import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_colors.dart';

class AvatarPickerBottomSheet extends StatefulWidget {
  final String selectedAvatar;
  final List<String> avatars;
  final ValueChanged<String> onAvatarSelected;

  const AvatarPickerBottomSheet({
    super.key,
    required this.selectedAvatar,
    required this.avatars,
    required this.onAvatarSelected,
  });

  @override
  State<AvatarPickerBottomSheet> createState() => _AvatarPickerBottomSheetState();
}

class _AvatarPickerBottomSheetState extends State<AvatarPickerBottomSheet> {
  late String _currentSelected;

  @override
  void initState() {
    super.initState();
    _currentSelected = widget.selectedAvatar;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(24),
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          childAspectRatio: 1.0,
        ),
        itemCount: widget.avatars.length,
        itemBuilder: (context, index) {
          final avatar = widget.avatars[index];
          final isSelected = avatar == _currentSelected;
          return GestureDetector(
            onTap: () {
              setState(() {
                _currentSelected = avatar;
              });
              widget.onAvatarSelected(avatar);
            },
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFFA67C00)
                    : const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(0xFFF6BD00),
                  width: isSelected ? 2.0 : 1.0,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  avatar,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
