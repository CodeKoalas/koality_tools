#! /bin/bash

## This script should handle creating the docker images and then pushing into the container
## registry. It should utilize some known Gitlab Environment Variables to decide the tags
## and commit SHA's to use for tagging the images.

## This script should be called from the root of the project directory. It should verify we
## have the proper environment variables set, and then call the docker build and push commands.
## We will loop over the directories inside "/docker" and for each one we will build an image for
## $CI_REGISTRY_IMAGE/${directory}:$CI_COMMIT_SHA and $CI_REGISTRY_IMAGE/${directory}:latest
## If $CI_COMMIT_TAG exists then we should use that instead of $CI_COMMIT_SHA.

## Let's begin.
if [ -z "$CI_REGISTRY_IMAGE" ]; then
  echo "CI_REGISTRY_IMAGE is not set. Please set this variable to the name of your container registry."
  exit 1
fi

if [ -z "$CI_COMMIT_SHA" ]; then
  echo "CI_COMMIT_SHA is not set. Please set this variable to the commit SHA of the current build."
  exit 1
fi

## We have the required variables, let's build and push the images.
for directory in ./docker/*/; do
  ## Get the name of the directory.
  directory=${directory%*/}
  directory=${directory##*/}

  ## If there are subdirectories we need to look for Dockerfiles in them and if so we will also build
  ## and tag images.
  for subdirectory in ./docker/$directory/*/; do
    ## Make sure we have a Dockerfile, otherwise skip.
    if [ ! -f ./docker/$directory/$subdirectory/Dockerfile ]; then
      continue
    fi
    ## Get the name of the subdirectory.
    subdirectory=${subdirectory%*/}
    subdirectory=${subdirectory##*/}

    ## Load the version.txt file to get the version.
    version=$(cat ./docker/$directory/$subdirectory/version.txt)

    ## Build the image.
    docker build -t $CI_REGISTRY_IMAGE/$directory/$subdirectory:$CI_COMMIT_SHA -f ./docker/$directory/$subdirectory/Dockerfile ./docker/$directory/$subdirectory

    ## Push the image for latest purposes.
    docker push $CI_REGISTRY_IMAGE/$directory/$subdirectory:$CI_COMMIT_SHA

    ## If we have a branch name environment variable, let's tag the image and push it.
    if [ -n "$CI_COMMIT_BRANCH" ]; then
      docker tag $CI_REGISTRY_IMAGE/$directory/$subdirectory:$CI_COMMIT_SHA $CI_REGISTRY_IMAGE/$directory/$subdirectory:$CI_COMMIT_BRANCH -f ./docker/$directory/$subdirectory/Dockerfile ./docker/$directory/$subdirectory
      docker push $CI_REGISTRY_IMAGE/$directory/$subdirectory:$CI_COMMIT_BRANCH
    fi

    ## If we have a tag, let's tag the image and push it.
    if [ -n "$CI_COMMIT_TAG" ]; then
      docker tag $CI_REGISTRY_IMAGE/$directory/$subdirectory:$CI_COMMIT_SHA $CI_REGISTRY_IMAGE/$directory/$subdirectory:$version -f ./docker/$directory/$subdirectory/Dockerfile ./docker/$directory/$subdirectory
      docker push $CI_REGISTRY_IMAGE/$directory/$subdirectory:$version
    fi
  done

  ## Now check if we have a Dockerfile in this directory, if not we skip.
  if [ ! -f ./docker/$directory/Dockerfile ]; then
    continue
  fi

  ## Get the version from the version.txt file.
  version=$(cat ./docker/$directory/version.txt)

  ## Build the image.
  docker build -t $CI_REGISTRY_IMAGE/$directory:$CI_COMMIT_SHA -t $CI_REGISTRY_IMAGE/$directory:latest -f ./docker/$directory/Dockerfile ./docker/$directory

  ## Push the image.
  docker push $CI_REGISTRY_IMAGE/$directory:$CI_COMMIT_SHA

    ## If we have a branch name environment variable, let's tag the image and push it.
  if [ -n "$CI_COMMIT_BRANCH" ]; then
    docker tag $CI_REGISTRY_IMAGE/$directory:$CI_COMMIT_SHA $CI_REGISTRY_IMAGE/$directory:$CI_COMMIT_BRANCH
    docker push $CI_REGISTRY_IMAGE/$directory:$CI_COMMIT_BRANCH
  fi

    ## If we have a tag, let's tag the image and push it.
  if [ -n "$CI_COMMIT_TAG" ]; then
    docker tag $CI_REGISTRY_IMAGE/$directory:$CI_COMMIT_SHA $CI_REGISTRY_IMAGE/$directory:$version
    docker push $CI_REGISTRY_IMAGE/$directory:$version
  fi
done