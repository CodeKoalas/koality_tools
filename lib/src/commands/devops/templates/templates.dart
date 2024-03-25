import 'package:koality_tools/src/commands/devops/templates/drupal/review.dart';
import 'package:koality_tools/src/commands/devops/templates/drupal/staging.dart';
import 'package:koality_tools/src/commands/devops/templates/laravel/review.dart';
import 'package:koality_tools/src/commands/devops/templates/laravel/staging.dart';
import 'package:koality_tools/src/commands/devops/templates/magento/review.dart';
import 'package:koality_tools/src/commands/devops/templates/magento/staging.dart';

const templateYamlFiles = <String, Map<String, String>>{
  'drupal': {
    'review': drupalReviewYaml,
    'staging': drupalStagingYaml,
  },
  'laravel': {
    'review': laravelReviewYaml,
    'staging': laravelStagingYaml,
  },
  'magento': {
    'review': magentoReviewYaml,
    'staging': magentoStagingYaml,
  },
  'wordpress': {},
};
