#!/bin/bash

while true; do
    # host test.infra.vadim-website.ru
    yc certificate-manager certificate get --name kube-infra
    sleep 600  # Sleep for 300 seconds (5 minutes)
done
