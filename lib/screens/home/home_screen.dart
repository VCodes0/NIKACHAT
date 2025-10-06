import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpt_markdown/gpt_markdown.dart';
import 'package:nikachat/cubit/search_cubit.dart';
import 'package:nikachat/cubit/search_state.dart';
import 'package:nikachat/screens/widgets/custom_button.dart';
import 'package:nikachat/screens/widgets/custom_text_field.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nikachat')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextField(
              controller: searchController,
              hintText: "What's in Your Mind  ",
              labelText: 'Search',
              obscureText: false,
              prefixIcon: Icon(CupertinoIcons.search),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.amberAccent,
                  child: BlocConsumer<SearchCubit, SearchState>(
                    builder: (_, state) {
                      if (state is SearchLoadingState) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (state is SearchLoadedState) {
                        return GptMarkdown(
                          state.res,
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        );
                      }
                      return Container();
                    },
                    listener: (_, state) {
                      if (state is SearchErrorState) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(state.errorMsg)));
                      }
                    },
                  ),
                ),
              ),
            ),
            CustomButton(
              text: "Click Here",
              onPressed: () {
                if (searchController.text.isNotEmpty) {
                  context.read<SearchCubit>().getSearchResponse(
                    query: searchController.text,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
