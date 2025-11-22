import 'package:ecommerce_app/features/more_details/widgets/filter_panel.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class MoreDetailsScreen extends StatelessWidget {
  const MoreDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [DescriptionAppBar(), FilterPanel()]);
  }
}
