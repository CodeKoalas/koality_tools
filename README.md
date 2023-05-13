# Koality Charts
A repository of custom helm charts and Docker images CK uses to deploy applications into K8s clusters.

## Charts
Collection of helm charts used to deploy applications into our clusters. These will typically be site/tech specific like
we have a `laravel` chart that we use to deploy Laravel applications, etc etc. Some assumptions for the charts:
1. [NGINX Ingress Controller](https://kubernetes.github.io/ingress-nginx/) for handling routing and ingresses.
2. [AWS EFS CSI Driver](https://github.com/kubernetes-sigs/aws-efs-csi-driver) for handling using EFS as a CSI (Container Storage Interface) for handling mounting of file systems.
3. [Cert Manager](https://cert-manager.io/docs/) with Let's Encrypt for default SSL cert generation for sites and review apps.
4. [Prometheus](https://prometheus.io/docs/introduction/overview/) for monitering and probes.

### Drupal
This chart is ready for Drupal 7+ deployments. Thankfully most of the structure between the sites remained the same and
we aren't going full piecemeal with things like only mapping `modules` or `themes` or anything like that. So we can just map
in all the directories and files to run the site.

### Laravel
This chart is ready for Laravel 8+ deployments. This chart creates separate deployments for a `cron` container that run the Laravel
cron without needing for it to run inside the actual site pod as well as moving the "Queue Workers" into a `queue worker` deployment. 
It's also ready to deploy an [echo](https://github.com/laravel/echo) server if you require websockets or any real-time data 
functionality. This chart will also deploy a `redis` StatefulSet for use with data-caching and the echo server.

### VueJS
This chart is ready to deploy a basic VueJS app.
TODOS:
[] Add volumes to be mapped into the deployment pods
[] Add ability to create an in-memory database if needed

### Flutter Web
This chart is ready to deploy a basic Flutter Web app.
TODOS:
[] Add volumes to be mapped into the deployment pods
[] Add ability to create an in-memory database if needed


## Docker Images
These images are ready to be used by our apps; whether it's Drupal or Laravel or something else we can easily version and maintain images
with pre-downloaded packages and configured to our liking to help keep the actual site build pipelines lean and fast. As much work as possible
should be put into these images to keep build times fast; aside from very specific use-cases any packages required for a site/app should be added
here instead of being done directly in the project's `Dockerfile`.

### Docker Image build process
On Merge Requests depending on file changes, `/bin/build.sh` is called, which follows this process:
Based on changes in `/docker` and for each one builds an image for `koality-charts/[directory]/[subdirectory if exists]:$CI_COMMIT_SHA`.
On tag events, we will call `/bin/build.sh` but this time since we have `$CI_COMMIT_TAG` then we will grab the `version.txt` file next to the
`Dockerfile` and use that to create a tagged image.

### Drupal
This image is preinstalled with things we require for Drupal itself or our typical list of modules we use/install.

### Init Laravel
This image specifically run `artisan migrate` to ensure migrations always run when a pod restarts.

### Init MySQL
This container image is specifically used for the Laravel/Drupal deployments to initialize a database for review apps/redeploying a site.

### Laravel
This image is preinstalled with things we require for Laravel itself or our typical list of packages we use/install.

### Laravel Echo
This image run the `laravel-echo-server start` command to start up the Echo server.

### Review MySQL
This image is used for our Laravel/Drupal sites to grab a dump of an existing database and import it into the local `mysql` service.
Primarily for Review Apps to grab the database for the staging site and use that for the ephemeral Review App.
