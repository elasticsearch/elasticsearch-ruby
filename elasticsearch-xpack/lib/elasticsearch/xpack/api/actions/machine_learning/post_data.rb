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

module Elasticsearch
  module XPack
    module API
      module MachineLearning
        module Actions
          # Sends data to an anomaly detection job for analysis.
          #
          # @option arguments [String] :job_id The name of the job receiving the data
          # @option arguments [String] :reset_start Optional parameter to specify the start of the bucket resetting range
          # @option arguments [String] :reset_end Optional parameter to specify the end of the bucket resetting range
          # @option arguments [Hash] :headers Custom HTTP headers
          # @option arguments [Hash] :body The data to process (*Required*)
          #
          # @see https://www.elastic.co/guide/en/elasticsearch/reference/7.16/ml-post-data.html
          #
          def post_data(arguments = {})
            raise ArgumentError, "Required argument 'body' missing" unless arguments[:body]
            raise ArgumentError, "Required argument 'job_id' missing" unless arguments[:job_id]

            headers = arguments.delete(:headers) || {}

            arguments = arguments.clone

            _job_id = arguments.delete(:job_id)

            method = Elasticsearch::API::HTTP_POST
            path   = "_ml/anomaly_detectors/#{Elasticsearch::API::Utils.__listify(_job_id)}/_data"
            params = Elasticsearch::API::Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)

            body = arguments[:body]
            perform_request(method, path, params, body, headers).body
          end

          # Register this action with its valid params when the module is loaded.
          #
          # @since 6.2.0
          ParamsRegistry.register(:post_data, [
            :reset_start,
            :reset_end
          ].freeze)
        end
      end
    end
  end
end
