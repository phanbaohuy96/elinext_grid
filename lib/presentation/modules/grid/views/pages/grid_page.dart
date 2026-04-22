import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/grid_layout.dart';
import '../../../../../l10n/localization_ext.dart';
import '../../bloc/grid_bloc.dart';
import '../../bloc/grid_event.dart';
import '../../bloc/grid_state.dart';
import '../widgets/page_indicator.dart';
import '../widgets/paginated_grid.dart';

class GridPage extends StatefulWidget {
  const GridPage({super.key});

  @override
  State<GridPage> createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> {
  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _animateToPage(int page) {
    // Defer until after the BlocBuilder rebuild so the PageView's
    // scroll extent reflects the new page count.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_pageController.hasClients) {
        return;
      }
      _pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOut,
      );
    });
  }

  void _onAdded(BuildContext context, GridState state) {
    if (state.images.isEmpty) {
      return;
    }
    final lastPage = (state.images.length - 1) ~/ GridLayout.itemsPerPage;
    _animateToPage(lastPage);
  }

  void _onReloaded(BuildContext context, GridState state) => _animateToPage(0);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<GridBloc>();
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle),
        actions: [
          IconButton(
            tooltip: l10n.actionAddImage,
            icon: const Icon(Icons.add),
            onPressed: () => bloc.add(const GridEvent.addImageRequested()),
          ),
          TextButton(
            onPressed: () => bloc.add(const GridEvent.reloadAllRequested()),
            child: Text(l10n.actionReloadAll),
          ),
        ],
      ),
      body: SafeArea(
        child: MultiBlocListener(
          listeners: [
            BlocListener<GridBloc, GridState>(
              listenWhen: (prev, next) =>
                  next.images.length == prev.images.length + 1,
              listener: _onAdded,
            ),
            BlocListener<GridBloc, GridState>(
              listenWhen: (prev, next) =>
                  next.reloadGeneration != prev.reloadGeneration,
              listener: _onReloaded,
            ),
          ],
          child: BlocBuilder<GridBloc, GridState>(
            builder: (context, state) {
              final pageCount = state.images.isEmpty
                  ? 0
                  : (state.images.length + GridLayout.itemsPerPage - 1) ~/
                        GridLayout.itemsPerPage;
              return Column(
                children: [
                  Expanded(
                    child: PaginatedGrid(
                      images: state.images,
                      controller: _pageController,
                    ),
                  ),
                  if (pageCount > 1)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: PageIndicator(
                        controller: _pageController,
                        pageCount: pageCount,
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
