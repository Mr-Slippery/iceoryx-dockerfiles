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

FROM ubuntu:bionic
ARG revision

RUN apt update && apt install -y \
        cmake \
        libacl1-dev \
        libncurses5-dev \
        pkg-config \
	git

RUN git clone -b $revision https://github.com/eclipse/iceoryx.git \
        && cd iceoryx \
        && ./tools/iceoryx_build_test.sh
