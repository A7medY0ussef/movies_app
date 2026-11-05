import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/widgets/custom_snack_bar.dart';
import 'package:movie_app/core/widgets/snack_bar_type.dart';
import 'package:movie_app/modules/layout/profile/data/data_source/profile_remote_data_source.dart';
import 'package:movie_app/modules/movie_details/domain/entities/movie_details_entity.dart';

class HeaderAppBar extends StatefulWidget {
  final MovieDetailsEntity? movie;

  const HeaderAppBar({super.key, this.movie});

  @override
  State<HeaderAppBar> createState() => _HeaderAppBarState();
}

class _HeaderAppBarState extends State<HeaderAppBar> {
  bool _isBookmarked = false;
  bool _isLoading = false;
  final ProfileRemoteDataSource _remoteDataSource = ProfileRemoteDataSource();

  @override
  void initState() {
    super.initState();
    _checkBookmarkStatus();
  }

  Future<void> _checkBookmarkStatus() async {
    if (widget.movie == null) return;
    try {
      final isSaved = await _remoteDataSource.isInWatchlist(widget.movie!.id);
      if (mounted) {
        setState(() {
          _isBookmarked = isSaved;
        });
      }
    } catch (_) {}
  }

  Future<void> _toggleBookmark() async {
    if (widget.movie == null || _isLoading) return;

    setState(() {
      _isLoading = true;
    });

    try {
      String poster = widget.movie!.posterImage;
      if (poster.isEmpty || poster.contains('background.jpg')) {
        poster = widget.movie!.backgroundImage.replaceAll('background.jpg', 'medium-cover.jpg');
      }

      final isSaved = await _remoteDataSource.toggleWatchlist(
        id: widget.movie!.id,
        title: widget.movie!.title,
        rating: widget.movie!.rating,
        imageUrl: poster,
      );

      if (mounted) {
        setState(() {
          _isBookmarked = isSaved;
          _isLoading = false;
        });

        CustomSnackBar.show(
          context,
          message: isSaved
              ? 'Added to Watch List'
              : 'Removed from Watch List',
          type: isSaved ? SnackBarType.success : SnackBarType.info,
        );
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        CustomSnackBar.show(
          context,
          message: e.toString(),
          type: SnackBarType.error,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            color: AppColors.white,
            size: 30,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: _toggleBookmark,
          icon: Icon(
            _isBookmarked ? Icons.bookmark : Icons.bookmark_border,
            color: _isBookmarked ? AppColors.primary : AppColors.white,
            size: 30,
          ),
        ),
      ],
    );
  }
}
