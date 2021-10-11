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
  module API
    module XPack
      module Actions
        # Retrieves usage information about the installed X-Pack features.
        #
        # @option arguments [Time] :master_timeout Specify timeout for watch write operation
        # @option arguments [Hash] :headers Custom HTTP headers
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/usage-api.html
        #
        def usage(arguments = {})
          headers = arguments.delete(:headers) || {}

          body = nil

          arguments = arguments.clone

          method = Elasticsearch::API::HTTP_GET
          path   = "_xpack/usage"
          params = Utils.process_params(arguments)

          perform_request(method, path, params, body, headers).body
        end
      end
    end
  end
end
