# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
  module API
    module Indices
      module Actions

        # Return information about shard recovery for one or more indices
        #
        # @example Get recovery information for a single index
        #
        #     client.indices.recovery index: 'foo'
        #
        # @example Get detailed recovery information for multiple indices
        #
        #     client.indices.recovery index: ['foo', 'bar'], detailed: true
        #
        # @example Get recovery information for all indices
        #
        #     client.indices.recovery
        #
        # @option arguments [List] :index A comma-separated list of index names; use `_all` or empty string to perform the operation on all indices
        # @option arguments [Boolean] :detailed Whether to display detailed information about shard recovery
        # @option arguments [Boolean] :active_only Display only those recoveries that are currently on-going
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-recovery.html
        #
        def recovery(arguments={})
          method = HTTP_GET
          path   = Utils.__pathify Utils.__listify(arguments[:index]), '_recovery'
          params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)
          body   = nil

          perform_request(method, path, params, body).body
        end

        # Register this action with its valid params when the module is loaded.
        #
        # @since 6.1.1
        ParamsRegistry.register(:recovery, [
            :detailed,
            :active_only  ].freeze)
      end
    end
  end
end
