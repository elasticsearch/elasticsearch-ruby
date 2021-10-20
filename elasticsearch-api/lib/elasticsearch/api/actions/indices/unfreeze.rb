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
    module Indices
      module Actions
        # Unfreezes an index. When a frozen index is unfrozen, the index goes through the normal recovery process and becomes writeable again.
        #
        # @option arguments [String] :index The name of the index to unfreeze
        # @option arguments [Time] :timeout Explicit operation timeout
        # @option arguments [Time] :master_timeout Specify timeout for connection to master
        # @option arguments [Boolean] :ignore_unavailable Whether specified concrete indices should be ignored when unavailable (missing or closed)
        # @option arguments [Boolean] :allow_no_indices Whether to ignore if a wildcard indices expression resolves into no concrete indices. (This includes `_all` string or when no indices have been specified)
        # @option arguments [String] :expand_wildcards Whether to expand wildcard expression to concrete indices that are open, closed or both. (options: open, closed, hidden, none, all)
        # @option arguments [String] :wait_for_active_shards Sets the number of active shards to wait for before the operation returns.
        # @option arguments [Hash] :headers Custom HTTP headers
        #
        # *Deprecation notice*:
        # Frozen indices are deprecated because they provide no benefit given improvements in heap memory utilization. They will be removed in a future release.
        # Deprecated since version 7.14.0
        #
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/unfreeze-index-api.html
        #
        def unfreeze(arguments = {})
          raise ArgumentError, "Required argument 'index' missing" unless arguments[:index]

          headers = arguments.delete(:headers) || {}

          body = nil

          arguments = arguments.clone

          _index = arguments.delete(:index)

          method = Elasticsearch::API::HTTP_POST
          path   = "#{Utils.__listify(_index)}/_unfreeze"
          params = Utils.process_params(arguments)

          perform_request(method, path, params, body, headers).body
        end
      end
    end
  end
end