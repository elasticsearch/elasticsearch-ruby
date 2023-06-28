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
    module Snapshot
      module Actions
        # Returns information about the status of a snapshot.
        #
        # @option arguments [String] :repository A repository name
        # @option arguments [List] :snapshot A comma-separated list of snapshot names
        # @option arguments [Time] :master_timeout Explicit operation timeout for connection to master node
        # @option arguments [Boolean] :ignore_unavailable Whether to ignore unavailable snapshots, defaults to false which means a SnapshotMissingException is thrown
        # @option arguments [Hash] :headers Custom HTTP headers
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/8.10/modules-snapshots.html
        #
        def status(arguments = {})
          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body = nil

          _repository = arguments.delete(:repository)

          _snapshot = arguments.delete(:snapshot)

          method = Elasticsearch::API::HTTP_GET
          path   = if _repository && _snapshot
                     "_snapshot/#{Utils.__listify(_repository)}/#{Utils.__listify(_snapshot)}/_status"
                   elsif _repository
                     "_snapshot/#{Utils.__listify(_repository)}/_status"
                   else
                     "_snapshot/_status"
                   end
          params = Utils.process_params(arguments)

          if Array(arguments[:ignore]).include?(404)
            Utils.__rescue_from_not_found {
              Elasticsearch::API::Response.new(
                perform_request(method, path, params, body, headers,
                                ["/_snapshot/_status", "/_snapshot/{repository}/_status", "/_snapshot/{repository}/{snapshot}/_status"], 'snapshot.status')
              )
            }
          else
            Elasticsearch::API::Response.new(
              perform_request(method, path, params, body, headers,
                              ["/_snapshot/_status", "/_snapshot/{repository}/_status", "/_snapshot/{repository}/{snapshot}/_status"], 'snapshot.status')
            )
          end
        end
      end
    end
  end
end
