import 'package:flutter/material.dart';
import 'package:resto_admin/core/themes/extensions/boxshadow_extension.dart';
import 'package:resto_admin/core/themes/extensions/color_extension.dart';
import 'package:resto_admin/core/themes/extensions/space_extension.dart';
import 'package:resto_admin/core/themes/extensions/typography_extension.dart';

final class AppTheme {
  final BuildContext context;

  AppTheme.of(this.context);

  AppColorExtension get colors {
    return Theme.of(context).extension<AppColorExtension>()!;
  }

  AppSpaceExtension get spaces {
    return Theme.of(context).extension<AppSpaceExtension>()!;
  }

  AppTypographyExtension get typography {
    return Theme.of(context).extension<AppTypographyExtension>()!;
  }

  AppBoxShadowExtension get boxShadow {
    return Theme.of(context).extension<AppBoxShadowExtension>()!;
  }
}
