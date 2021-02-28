#!/bin/bash

# need to check for required variables
if [[ -z "${MODE}" ]]; then
  echo "MODE is not present in environment"
  exit 1
fi
if [[ -z "${STATE_BUCKET}" ]]; then
  echo "STATE_BUCKET is not present in environment"
  exit 1
fi
if [[ -z "${STATE_KEY}" ]]; then
  echo "STATE_KEY is not present in environment"
  exit 1
fi
if [[ -z "${AWS_REGION}" ]]; then
  echo "AWS_REGION is not present in environment"
  exit 1
fi
if [[ -z "${VERSION}" ]]; then
  echo "VERSION is not present in environment"
  exit 1
fi
if [[ -z "${VPC_ID}" ]]; then
  echo "VPC_ID is not present in environment"
  exit 1
fi
if [[ -z "${TASK_SUBNETS}" ]]; then
  echo "TASK_SUBNETS is not present in environment"
  exit 1
fi
if [[ -z "${INSTANCE_SUBNETS}" ]]; then
  echo "INSTANCE_SUBNETS is not present in environment"
  exit 1
fi
if [[ -z "${DESKTOP_ID}" ]]; then
  echo "DESKTOP_ID is not present in environment"
  exit 1
fi
if [[ -z "${AMI_ID}" ]]; then
  echo "AMI_ID is not present in environment"
  exit 1
fi
if [[ -z "${MACHINE_USERNAME}" ]]; then
  echo "MACHINE_USERNAME is not present in environment"
  exit 1
fi
if [[ -z "${INSTANCE_TYPE}" ]]; then
  echo "INSTANCE_TYPE is not present in environment"
  exit 1
fi
if [[ -z "${SCREEN_GEOMETRY}" ]]; then
  echo "SCREEN_GEOMETRY is not present in environment"
  exit 1
fi
if [[ -z "${MACHINE_DEF_ID}" ]]; then
  echo "MACHINE_DEF_ID is not present in environment"
  exit 1
fi
if [[ -z "${NAMESPACE_ID}" ]]; then
  echo "NAMESPACE_ID is not present in environment"
  exit 1
fi
if [[ -z "${SECURITY_GROUP_ID}" ]]; then
  echo "SECURITY_GROUP_ID is not present in environment"
  exit 1
fi
if [[ -z "${B64_USER_DATA}" ]]; then
  echo "B64_USER_DATA is not present in environment"
  exit 1
fi
if [[ -z "${ENV_KEY}" ]]; then
  echo "ENV_KEY is not present in environment"
  exit 1
fi

# now update main.tf-template with these values
envsubst '${STATE_BUCKET} ${STATE_KEY} ${AWS_REGION} ${VERSION} ${VPC_ID} ${TASK_SUBNETS} ${INSTANCE_SUBNETS} ${DESKTOP_ID} ${AMI_ID} ${MACHINE_USERNAME} ${INSTANCE_TYPE} ${SCREEN_GEOMETRY} ${MACHINE_DEF_ID} ${NAMESPACE_ID} ${SECURITY_GROUP_ID} ${B64_USER_DATA} ${ENV_KEY}' < main.tf-template > main-${DESKTOP_ID}.tf

# check what we were asked to do
case ${MODE} in

  apply)
    terraform init
    terraform apply -no-color -auto-approve
    ;;

  destroy)
    terraform init
    terraform destroy -no-color -auto-approve
    ;;

esac
