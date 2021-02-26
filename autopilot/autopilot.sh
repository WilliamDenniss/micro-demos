#!/bin/bash

# Copyright 2021 Google LLC
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     https://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

. $(dirname ${BASH_SOURCE})/../util.sh
clear
sleep 2

desc "Authenticate kubectl"
run "gcloud container clusters get-credentials autopilot-demo --region us-west1 --project gke-autopilot-demo"

desc "Clone the GKE sample repository"
run "git clone https://github.com/GoogleCloudPlatform/kubernetes-engine-samples"
run "cd kubernetes-engine-samples/guestbook"
cd kubernetes-engine-samples/guestbook

desc "Apply Kubernetes configuration"
run "kubectl apply -f ."

desc "Watch rollout"
run "watch -t kubectl get pods"

desc "Discover IP Address"
run "kubectl get svc"
