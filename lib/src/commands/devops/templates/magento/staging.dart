const magnetoStagingYaml = '''
global:
  storageClass: "efs-sc"

# The deployment object with environment variables to use.
deployment:
  apiVersion: apps/v1
  name: [SITE NAME]-staging
  track: stable
  tier: web
  appEnv: staging
  magentoHost: [SITE NAME].ckstage.site/
  amqpHost: [SITE NAME]-staging-rabbitmq
  appDebug: true
  extraEnv:
    DEPLOY_MODE: development

# The persistence image; for review apps this allows a DB to be created
# for use with this review.
persistence:
  enabled: true
  name: [SITE NAME]-staging
  databaseName: [DATABASE NAME]
  databaseUser: [SITE NAME]
  databasePassword: pleaseoverwriteme
  replicaCount: 1
  limits:
    cpu: 900m
    memory: 4Gi
  requests:
    cpu: 400m
    memory: 2Gi
  volumes:
    - name: data
      mount:
        mountPath: /var/www/html/pub/media
        subPath: [SITE NAME]-staging
      claim:
        accessMode: ReadWriteMany
        size: 100Gi
        # If you want to use a custom storage class, you can specify `storageClass`. In this case, you need to create a storage class at first.
        # If `storageClass` is not specified, the behavior will vary per Kubernetes provider.
        # For example, GKE automatically chooses a default storage class and allocate a physical storage.
        # See https://cloud.google.com/kubernetes-engine/docs/concepts/persistent-volumes for more information.

hpa:
  minReplicas: 1
  maxReplicas: 1

# The service that is used with the Ingress.
service:
  enabled: true
  type: ClusterIP
  name: service-[SITE NAME]-staging
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
    nginx.ingress.kubernetes.io/proxy-body-size: 200m
    nginx.ingress.kubernetes.io/client-body-buffer-size: 200m
    nginx.ingress.kubernetes.io/proxy-buffers-number: "4"
    nginx.ingress.kubernetes.io/proxy-buffer-size: "256k"
    nginx.ingress.kubernetes.io/proxy-buffering: "on"

rabbitmq:
  fullnameOverride: [SITE NAME]-staging-rabbitmq
  port: 5672

elasticsearch:
  enabled: true

redis:
  enabled: true
  username: default

''';
