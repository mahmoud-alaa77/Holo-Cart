import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:holo_cart/core/helper/spacing.dart';
import 'package:holo_cart/core/widgets/app_text_field.dart';
import 'package:holo_cart/features/search/ui/widgets/not_match_search_result.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 16.r),
          child: Column(
            children: [
              verticalSpace(24),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 26.sp,
                    ),
                  ),
                  // horizontalSpace(12),
                  Expanded(
                    child: SizedBox(
                      height: 45.h,
                      child: AppTextFormField(
                        labelText: "Search here ...",
                        validator: (value) {},
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: const Icon(Icons.mic),
                      ),
                    ),
                  )
                ],
              ),
              verticalSpace(120),
              const NotMatchSearchResult()
            ],
          ),
        ),
      ),
    );
  }
}
