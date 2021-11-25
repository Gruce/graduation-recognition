class MaterialSearchDelegate extends PlatformSearchDelegate {
  @override
  Widget buildScaffold(Widget body, BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: buildLeading(context),
        title: TextField(
          controller: queryTextController,
          focusNode: focusNode,
          textInputAction: TextInputAction.search,
          onSubmitted: (String _) {
            showResults(context);
          },
          decoration: InputDecoration(hintText: searchFieldLabel),
        ),
        actions: buildActions(context),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: body,
      ),
    );
  }
}