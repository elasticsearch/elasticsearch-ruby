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
#
# Auto generated from build hash f284cc16f4d4b4289bc679aa1529bb504190fe80
# @see https://github.com/elastic/elasticsearch/tree/main/rest-api-spec
#
module Elasticsearch
  module API
    module Shutdown
      module Actions
        # Adds a node to be shut down. Designed for indirect use by ECE/ESS and ECK. Direct use is not supported.
        #
        # @option arguments [String] :node_id The node id of node to be shut down
        # @option arguments [Hash] :headers Custom HTTP headers
        # @option arguments [Hash] :body The shutdown type definition to register (*Required*)
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/current
        #
        def put_node(arguments = {})
          raise ArgumentError, "Required argument 'body' missing" unless arguments[:body]
          raise ArgumentError, "Required argument 'node_id' missing" unless arguments[:node_id]

          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}
          request_opts = { :endpoint => "shutdown.put_node" }

          defined_params = ["node_id"].inject({}) do |set_variables, variable|
            set_variables[variable] = arguments[variable] if arguments.key?(variable)
            set_variables
          end
          request_opts[:defined_params] = defined_params unless defined_params.empty?

          body = arguments.delete(:body)

          _node_id = arguments.delete(:node_id)

          method = Elasticsearch::API::HTTP_PUT
          path   = "_nodes/#{Utils.__listify(_node_id)}/shutdown"
          params = {}

          Elasticsearch::API::Response.new(
            perform_request(method, path, params, body, headers, request_opts)
          )
        end
      end
    end
  end
end
