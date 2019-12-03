#!/usr/bin/env bash
# Copyright (c) 2019 by Cornel Izbasa. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -euo pipefail

REVISION=master
IMAGE_NAME="iceoryx:${REVISION}"
CONTAINER_NAME=roudi
ICEORYX_BUILD=/iceoryx/build

docker build --build-arg revision="${REVISION}" . -t "${IMAGE_NAME}"
docker run -d --name="${CONTAINER_NAME}" --shm-size 700M "${IMAGE_NAME}" "${ICEORYX_BUILD}/install/prefix/bin/RouDi"
sleep 2
docker exec -d "${CONTAINER_NAME}" "${ICEORYX_BUILD}/iceoryx_examples/icedelivery/ice_sender"
sleep 2
set +e
docker exec "${CONTAINER_NAME}" timeout 20 "${ICEORYX_BUILD}/iceoryx_examples/icedelivery/ice_receiver"
set -e
docker stop "${CONTAINER_NAME}"
docker rm "${CONTAINER_NAME}"
