const drupalStagingYaml = '''
global:
  storageClass: "efs-sc"

# The deployment object with environment variables to use.
deployment:
  apiVersion: apps/v1
  name: [SITE NAME]-staging
  track: stable
  tier: web
  appEnv: staging
  virtualHost: [SITE NAME].ckstage.site
  letsEncryptHost: [SITE NAME].ckstage.site
  appUrl: "https://[SITE NAME].ckstage.site"
  extraEnv:
    SITE_ENV: stage

# The persistence image; for review apps this allows a DB to be created
# for use with this review.
persistence:
  enabled: true
  name: [SITE NAME]
  databaseName: [DATABASE NAME]
  databaseUser: [SITE NAME]
  databasePassword: pleaseoverwriteme
  replicaCount: 1
  limits:
    memory: 1000Mi
  requests:
    cpu: 50m
    memory: 550Mi
  volumes:
    - name: data
      mount:
        mountPath: /var/www/html/docroot/sites/default/files
        subPath: [SITE NAME]-staging
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
  name: service-[SITE NAME]
  extraHosts:
    - "[SITE NAME].ckstage.site"

# Set hostname for cert generation.
ingress:
  hostname: [SITE NAME].ckstage.site
  annotations:
    nginx.ingress.kubernetes.io/affinity: "cookie"
    nginx.ingress.kubernetes.io/affinity-mode: "persistent"
    nginx.ingress.kubernetes.io/session-cookie-domain: ".[SITE NAME].ckstage.site"
    nginx.ingress.kubernetes.io/session-cookie-max-age: "172800"
    nginx.ingress.kubernetes.io/proxy-body-size: 100m
    nginx.ingress.kubernetes.io/client-body-buffer-size: 100m

cron:
  enabled: true
  image:
    repository: [CONTAINER PATH]/cron
    tag: latest

''';
