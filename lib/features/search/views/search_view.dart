import 'package:booklyapp/core/utils/service_locator.dart';
import 'package:booklyapp/features/search/data/repos/search_repo_impl.dart';
import 'package:booklyapp/features/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:booklyapp/features/search/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => SearchBooksCubit(getIt.get<SearchRepoImpl>()),
          child: const SearchViewBody(),
        ),
      ),
    );
  }
}
