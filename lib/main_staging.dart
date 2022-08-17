// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:data_extractor/bootstrap.dart';
import 'package:data_extractor/src/features/app/app.dart';
import 'package:data_extractor/src/injection_container.dart';
import 'package:data_extractor/src/widgets/environment_banner.dart';
import 'package:flutter/material.dart';

void main() {
  sl.registerSingleton<EnvironmentConfig>(
    EnvironmentConfig(
      environment: Environment.staging,
      lightTheme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      bannerConfig: BannerConfig(
        color: Colors.deepPurpleAccent,
        name: 'STAGING',
      ),
    ),
  );

  bootstrap(() => const App());
}
