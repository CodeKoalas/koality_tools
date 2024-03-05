// Constants.
const kGitlabApiGenerateVariableFillableNames = [
  'AUTO_DEVOPS_CHART',
  'HELM_RELEASE_NAME',
  'HELM_UPGRADE_EXTRA_ARGS',
  'HELM_UPGRADE_VALUES_FILE',
  'KUBE_CONTEXT',
  'KUBE_INGRESS_BASE_DOMAIN',
];

const kGitlabApiGenerateVariableDefaultValues = {
  'AUTO_DEVOPS_COMMON_NAME': 'false',
  'AUTO_DEVOPS_DEPLOY_DEBUG': 'true',
  'KUBE_NAMESPACE': 'gitlab-managed-apps',
  'TRACE': 'true',
};

const kGitlabApiGenerateVariableFillableNamesDefaults = {
  'HELM_RELEASE_NAME': 'app-name',
  'HELM_UPGRADE_VALUES_FILE': 'autodevops/staging.yaml',
  'HELM_UPGRADE_EXTRA_ARGS': r'--set persistence.databasePassword=$DATABASE_PASSWORD',
  'KUBE_INGRESS_BASE_DOMAIN': 'example.com',
  'KUBE_CONTEXT': 'path/to/kubeconfig.yaml',
};

const kGitlabApiGenerateVariableFillableNamesLaravel = [
  'FCM_SERVER_KEY',
  'FIREBASE_CONFIG_PATH',
];

const kGitlabApiGenerateVariableFillableNamesMagento = [
  'MAGENTO_ADMIN_PASSWORD',
];

/// A function for returning some opinionated default variable names for Gitlab CI/CD variables that we use with
/// Gitlab's Auto DevOps feature.
///
/// Some of these use very specific things like value files location, helm chart for installation. These can easily
/// be overridden in the command, but these defaults keep the flow easy for Code Koalas as we can just accept the
/// defaults 90% of the time.
String gitlabGenerateDefaultVariableValue({
  required String key,
  required String siteName,
  required String siteType,
  required String environment,
}) {
  return switch (key) {
    'AUTO_DEVOPS_CHART' => 'koality-charts/$siteType',
    'HELM_RELEASE_NAME' => getDefaultHelmReleaseName(siteName: siteName, siteType: siteType, environment: environment),
    'HELM_UPGRADE_EXTRA_ARGS' => getDefaultHelmUpgradeExtraArgs(siteType: siteType, environment: environment),
    'HELM_UPGRADE_VALUES_FILE' => 'autodevops/$environment.yaml',
    'KUBE_CONTEXT' => 'sites/aws-terraform:gitlab-agent-stage',
    'KUBE_INGRESS_BASE_DOMAIN' => 'ckstage.site',
    _ => '',
  };
}

// A simple function for returning some default helm release name for each site type that we deal with.
String getDefaultHelmReleaseName({required String siteName, required String siteType, required String environment}) {
  return switch (siteType) {
    'review' => r'$CI_ENVIRONMENT_SLUG-$CI_PROJECT_ID',
    _ => '$siteName-$siteType-$environment',
  };
}

// A simple function for returning some default extra args to pass to the helm upgrade command for each site
// type that we deal with.
String getDefaultHelmUpgradeExtraArgs({required String siteType, required String environment}) {
  return switch (siteType) {
    'drupal' => getDrupalHelmUpgradeExtraArgs(environment: environment),
    'laravel' => getLaravelHelmUpgradeExtraArgs(environment: environment),
    'magento' => getMagentoHelmUpgradeExtraArgs(environment: environment),
    _ => '',
  };
}

// Gets some Drupal default extra args to pass to the helm upgrade command with Gitlab's Auto DevOps feature.
String getDrupalHelmUpgradeExtraArgs({required String environment}) {
  return switch (environment) {
    'review' => r'''
--set cron.image.repository=$CI_REGISTRY_IMAGE/$CI_COMMIT_REF_SLUG/cron
--set cron.image.tag=$CI_COMMIT_SHA
--set deployment.letsEncryptHost=$CI_PROJECT_ID-$CI_ENVIRONMENT_SLUG.$KUBE_INGRESS_BASE_DOMAIN  
--set deployment.name=$CI_PROJECT_ID-$CI_ENVIRONMENT_SLUG 
--set deployment.virtualHost=$CI_PROJECT_ID-$CI_ENVIRONMENT_SLUG.$KUBE_INGRESS_BASE_DOMAIN  
--set ingress.hostname=$CI_PROJECT_ID-$CI_ENVIRONMENT_SLUG.$KUBE_INGRESS_BASE_DOMAIN 
--set ingress.annotations.nginx\.ingress\.kubernetes\.io/session-cookie-domain=$CI_PROJECT_ID-$CI_ENVIRONMENT_SLUG.$KUBE_INGRESS_BASE_DOMAIN 
--set persistence.databasePassword=$DATABASE_PASSWORD 
--set persistence.name=$CI_PROJECT_ID-$CI_ENVIRONMENT_SLUG 
--set persistence.volumes[0].name=$CI_PROJECT_ID-$CI_ENVIRONMENT_SLUG-data 
--set persistence.volumes[0].mount.subPath=$CI_PROJECT_ID-$CI_ENVIRONMENT_SLUG
''',
    'staging' => r'''
--set persistence.databasePassword=$DATABASE_PASSWORD
''',
    _ => '',
  };
}

// Get some Laravel default extra args to pass to the helm upgrade command with Gitlab's Auto DevOps feature.
String getLaravelHelmUpgradeExtraArgs({required String environment}) {
  return switch (environment) {
    'review' => r'''
--set deployment.appKey=$APP_KEY 
--set persistence.databasePassword=$DATABASE_PASSWORD 
--set redis.password=$REDIS_PASSWORD 
--set deployment.fcmServerKey=$FCM_SERVER_KEY 
--set deployment.jwtSecret=$JWT_SECRET 
--set service.name=service-$CI_PROJECT_ID-$CI_ENVIRONMENT_SLUG 
--set deployment.name=$CI_PROJECT_ID-$CI_ENVIRONMENT_SLUG 
--set persistence.name=$CI_PROJECT_ID-$CI_ENVIRONMENT_SLUG 
--set ingress.hostname=$CI_PROJECT_ID-$CI_ENVIRONMENT_SLUG.$KUBE_INGRESS_BASE_DOMAIN 
--set ingress.annotations.nginx\.ingress\.kubernetes\.io/session-cookie-domain=$CI_PROJECT_ID-$CI_ENVIRONMENT_SLUG.$KUBE_INGRESS_BASE_DOMAIN 
--set persistence.volumes[0].name=$CI_PROJECT_ID-$CI_ENVIRONMENT_SLUG-data 
--set persistence.volumes[0].mount.subPath=$CI_PROJECT_ID-$CI_ENVIRONMENT_SLUG 
--set deployment.virtualHost=$CI_PROJECT_ID-$CI_ENVIRONMENT_SLUG.$KUBE_INGRESS_BASE_DOMAIN 
--set deployment.letsEncryptHost=$CI_PROJECT_ID-$CI_ENVIRONMENT_SLUG.$KUBE_INGRESS_BASE_DOMAIN 
--set deployment.appUrl=https://$CI_PROJECT_ID-$CI_ENVIRONMENT_SLUG.$KUBE_INGRESS_BASE_DOMAIN
--set deployment.configMaps.google-credentials.mountPath=/etc/firebase
--set-file deployment.configMaps.google-credentials.data.google-credentials\.json=$FIREBASE_CONFIG_PATH
--set echo.image.repository=$CI_REGISTRY_IMAGE/$CI_COMMIT_REF_SLUG/echo
--set echo.image.tag=$CI_COMMIT_SHA
--set cron.image.repository=$CI_REGISTRY_IMAGE/$CI_COMMIT_REF_SLUG/cron
--set cron.image.tag=$CI_COMMIT_SHA
''',
    'staging' => r'''
--set deployment.appKey=$APP_KEY 
--set persistence.databasePassword=$DATABASE_PASSWORD 
--set redis.password=$REDIS_PASSWORD 
--set deployment.fcmServerKey=$FCM_SERVER_KEY 
--set deployment.jwtSecret=$JWT_SECRET
--set deployment.configMaps.google-credentials.mountPath=/etc/firebase
--set-file deployment.configMaps.google-credentials.data.google-credentials\.json=$FIREBASE_CONFIG_PATH
''',
    _ => '',
  };
}

// Get some Magento default extra args to pass to the helm upgrade command with Gitlab's Auto DevOps feature.
String getMagentoHelmUpgradeExtraArgs({required String environment}) {
  return switch (environment) {
    'review' => r'''
--set service.name=service-$CI_PROJECT_ID-$CI_ENVIRONMENT_SLUG 
--set deployment.magentoPassword=$MAGENTO_ADMIN_PASSWORD 
--set deployment.magentoHost=$CI_PROJECT_ID-$CI_ENVIRONMENT_SLUG.$KUBE_INGRESS_BASE_DOMAIN 
--set deployment.name=$CI_PROJECT_ID-$CI_ENVIRONMENT_SLUG 
--set deployment.amqpHost=$CI_ENVIRONMENT_SLUG-$CI_PROJECT_ID-rabbitmq 
--set persistence.name=$CI_PROJECT_ID-$CI_ENVIRONMENT_SLUG 
--set redis.password=$REDIS_PASSWORD 
--set rabbitmq.fullnameOverride=$CI_ENVIRONMENT_SLUG-$CI_PROJECT_ID-rabbitmq 
--set ingress.hostname=$CI_PROJECT_ID-$CI_ENVIRONMENT_SLUG.$KUBE_INGRESS_BASE_DOMAIN 
--set ingress.annotations.nginx\.ingress\.kubernetes\.io/session-cookie-domain=$CI_PROJECT_ID-$CI_ENVIRONMENT_SLUG.$KUBE_INGRESS_BASE_DOMAIN 
--set persistence.volumes[0].name=$CI_PROJECT_ID-$CI_ENVIRONMENT_SLUG-data 
--set persistence.volumes[0].mount.subPath=$CI_PROJECT_ID-$CI_ENVIRONMENT_SLUG 
''',
    'staging' => r'''
--set deployment.magentoPassword=$MAGENTO_ADMIN_PASSWORD  
--set redis.password=$REDIS_PASSWORD 
''',
    _ => '',
  };
}
