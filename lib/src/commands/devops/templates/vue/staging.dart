const vueStagingYaml = '''
global:
  storageClass: efs-sc-retain-www-data

# The deployment object with environment variables to use.
deployment:
  apiVersion: apps/v1
  name: [SITE NAME]-staging
  track: stable
  tier: web
  appEnv: staging
  virtualHost: [SITE NAME].ckstage.site
  letsEncryptHost: [SITE NAME].ckstage.site
  config:
    mountPath: /usr/share/nginx/html/.env
    data:
      BASE_URL: https://[SITE NAME].ckstage.site

# The persistence image; for review apps this allows a DB to be created
# for use with this review.
persistence:
  enabled: true
  name: [SITE NAME]-staging
  databaseName: [DATABASE NAME]
  databaseUser: [SITE NAME]
  databasePassword: pleaseoverwriteme
  replicaCount: 1
  ephemeral:
    enabled: true
    image: 
      repository: registry.codekoalas.com/devops/helm/koality-charts/review-mysql
      tag: 0.0.4
  limits:
    memory: 1000Mi
  requests:
    cpu: 50m
    memory: 500Mi
  volumes:
    - name: data
      mount:
        mountPath: /var/www/html/docroot/assets
        subPath: [SITE NAME]-staging
        # subPath: "/pvc-mount/config.txt"
      claim:
        accessMode: ReadWriteMany
        size: 100Gi
        # If you want to use a custom storage class, you can specify `storageClass`. In this case, you need to create a storage class at first.
        # If `storageClass` is not specified, the behavior will vary per Kubernetes provider.
        # For example, GKE automatically chooses a default storage class and allocate a physical storage.
        # See https://cloud.google.com/kubernetes-engine/docs/concepts/persistent-volumes for more information.
        storageClass: efs-sc-retain-www-data

# The service that is used with the Ingress.
service:
  enabled: true
  type: ClusterIP
  name: service-[SITE NAME]
  url: "https://[SITE NAME].ckstage.site"
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
    nginx.ingress.kubernetes.io/proxy-body-size: 20m

''';