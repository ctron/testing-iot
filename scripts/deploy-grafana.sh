#!/usr/bin/env bash

###############################################################################
# Copyright (c) 2017 Red Hat Inc and others
#
# All rights reserved. This program and the accompanying materials
# are made available under the terms of the Eclipse Public License v1.0
# which accompanies this distribution, and is available at
# http://www.eclipse.org/legal/epl-v10.html
#
###############################################################################

set -e

# source commons
. "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/common.sh"

openshift_ping

openshift_create_new_project "$GRAFANA_PROJECT_NAME"

#oc new-app \
# -n "$GRAFANA_PROJECT_NAME" \
# -f https://raw.githubusercontent.com/hawkular/hawkular-grafana-datasource/v1.0.8/docker/openshift/openshift-template-ephemeral.yaml

oc new-app \
 -n "$GRAFANA_PROJECT_NAME" \
-f https://raw.githubusercontent.com/hawkular/hawkular-grafana-datasource/master/docker/openshift/openshift-template-ephemeral.yaml


oc status -n "$GRAFANA_PROJECT_NAME"

$SCRIPT_BASE/grafana-datasources.sh
