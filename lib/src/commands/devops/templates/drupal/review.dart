const drupalReviewYaml = '''
global:
  storageClass: "efs-sc-retain"

# The deployment object with environment variables to use.
deployment:
  apiVersion: apps/v1
  name: [SITE NAME]-review
  track: stable
  tier: web
  appEnv: review
  virtualHost: [SITE NAME]-review.ckstage.site
  letsEncryptHost: [SITE NAME]-review.ckstage.site
  appUrl: "https://[SITE NAME]-review.ckstage.site"
  extraEnv:
    SITE_ENV: stage

# The persistence image; for review apps this allows a DB to be created
# for use with this review.
persistence:
  enabled: true
  name: [SITE NAME]-review
  databaseName: [DATABASE NAME]
  databaseUser: [SITE NAME]
  databasePassword: pleaseoverwriteme
  replicaCount: 1
  ephemeral:
    enabled: true
    image:
      repository: registry.codekoalas.com/devops/helm/koality-charts
      tag: review-mysql
  limits:
    cpu: 300m
    memory: 1000Mi
  requests:
    cpu: 150m
    memory: 500Mi
  volumes:
    - name: data
      mount:
        mountPath: /var/www/html/sites/default/files
        subPath: [SITE NAME]-review
        # subPath: "/pvc-mount/config.txt"
      claim:
        accessMode: ReadWriteMany
        size: 100Gi
        # If you want to use a custom storage class, you can specify `storageClass`. In this case, you need to create a storage class at first.
        # If `storageClass` is not specified, the behavior will vary per Kubernetes provider.
        # For example, GKE automatically chooses a default storage class and allocate a physical storage.
        # See https://cloud.google.com/kubernetes-engine/docs/concepts/persistent-volumes for more information.

# The service that is used with the Ingress.
service:
  enabled: true
  type: ClusterIP
  name: service-[SITE NAME]-review

# Set hostname for cert generation.
ingress:
  hostname: [SITE NAME]-review.ckstage.site
  annotations:
    nginx.ingress.kubernetes.io/affinity: "cookie"
    nginx.ingress.kubernetes.io/session-cookie-domain: ".[SITE NAME]-review.ckstage.site"
    nginx.ingress.kubernetes.io/session-cookie-max-age: "172800"
    nginx.ingress.kubernetes.io/proxy-body-size: 20m
    nginx.ingress.kubernetes.io/client-body-buffer-size: 20m

redis:
  enabled: false

cron:
  enabled: true
  image:
    repository: registry.codekoalas.com/sites/[SITE NAME]/cron
    # Overridden in Gitlab through the CI/CD variable HELM_EXTRA_UPGRADE_ARGS
    # tag: latest

aws:
  s3:
    enabled: true
    createNew: false
    bucket: [SITE NAME]-staging
    url: ""
    usePathStyleEndpoints: false
''';
