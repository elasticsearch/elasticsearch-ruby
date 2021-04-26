# Licensed to Elasticsearch B.V. under one or more contributor
# license agreements. See the NOTICE file distributed with
# this work for additional information regarding copyright
# ownership. Elasticsearch B.V. licenses this file to you under
# the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

require_relative '../lib/benchmarks'

Benchmarks.register \
  action: 'get',
  category: 'core',
  warmups: 100,
  repetitions: 10_000,
  setup: Proc.new { |runner|
    runner.runner_client.indices.delete(index: 'test-bench-get', ignore: 404)
    runner.runner_client.index index: 'test-bench-get', id: '1', body: { title: 'Test' }
    runner.runner_client.cluster.health(wait_for_status: 'yellow')
    runner.runner_client.indices.refresh index: 'test-bench-get'
  },
  measure: Proc.new { |n, runner|
    response = runner.runner_client.get index: 'test-bench-get', id: '1'
    raise RuntimeError.new("Incorrect data: #{response}") unless response["_source"]["title"] == "Test"
  }
