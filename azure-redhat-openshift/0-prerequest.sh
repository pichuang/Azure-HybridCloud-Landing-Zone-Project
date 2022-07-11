#!/usr/bin/env bash

# https://docs.microsoft.com/zh-tw/azure/openshift/tutorial-create-cluster

az provider register -n Microsoft.RedHatOpenShift --wait
az provider register -n Microsoft.Compute --wait
az provider register -n Microsoft.Storage --wait
az provider register -n Microsoft.Authorization --wait
