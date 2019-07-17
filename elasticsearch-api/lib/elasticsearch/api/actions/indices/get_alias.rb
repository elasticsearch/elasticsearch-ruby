# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
  module API
    module Indices
      module Actions

        # Get information about a specific alias.
        #
        # @example Return all indices an alias points to
        #
        #     client.indices.get_alias name: '2013'
        #
        # @example Return all indices matching a wildcard pattern an alias points to
        #
        #     client.indices.get_alias index: 'log*', name: '2013'
        #
        # @option arguments [List] :index A comma-separated list of index names to filter aliases
        # @option arguments [List] :name A comma-separated list of alias names to return
        # @option arguments [Boolean] :ignore_unavailable Whether specified concrete indices should be ignored when unavailable (missing or closed)
        # @option arguments [Boolean] :allow_no_indices Whether to ignore if a wildcard indices expression resolves into no concrete indices. (This includes `_all` string or when no indices have been specified)
        # @option arguments [String] :expand_wildcards Whether to expand wildcard expression to concrete indices that are open, closed or both. (options: open, closed, none, all)
        # @option arguments [Boolean] :local Return local information, do not retrieve the state from master node (default: false)
        #
        # @see https://www.elastic.co/guide/reference/api/admin-indices-aliases/
        #
        def get_alias(arguments={})
          method = HTTP_GET
          path   = Utils.__pathify Utils.__listify(arguments[:index]), '_alias', Utils.__escape(arguments[:name])

          params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)
          body   = nil

          perform_request(method, path, params, body).body
        end

        # Register this action with its valid params when the module is loaded.
        #
        # @since 6.1.1
        ParamsRegistry.register(:get_alias, [
            :ignore_unavailable,
            :allow_no_indices,
            :expand_wildcards,
            :local ].freeze)
      end
    end
  end
end
