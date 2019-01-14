# Licensed to Elasticsearch B.V. under one or more contributor
# license agreements. See the NOTICE file distributed with
# this work for additional information regarding copyright
# ownership. Elasticsearch B.V. licenses this file to you under
# the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#	http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

module Elasticsearch
  module API
    module Actions

      # Return information if and how well a document matches a query.
      #
      # The returned information contains a `_score` and its explanation, if the document matches the query.
      #
      # @example Passing the query in the Lucene query syntax as the `:q` URL parameter
      #
      #     client.explain index: 'myindex', type: 'mytype', id: '1', q: 'test'
      #
      # @example Passing the query in the Query DSL as the request `:body`
      #
      #     client.explain index: 'myindex', type: 'mytype', id: '1',
      #                    body: { query: { match: { title: 'test' } } }
      #
      # @option arguments [String] :id The document ID (*Required*)
      # @option arguments [String] :index The name of the index (*Required*)
      # @option arguments [String] :type The type of the document (*Required*)
      # @option arguments [Hash] :body The query definition using the Query DSL (*Required*)
      # @option arguments [Boolean] :analyze_wildcard Specify whether wildcards and prefix queries in the query string
      #                                               query should be analyzed (default: false)
      # @option arguments [String] :analyzer The analyzer for the query string query
      # @option arguments [String] :default_operator The default operator for query string query (AND or OR)
      #                                              (options: AND, OR)
      # @option arguments [String] :df The default field for query string query (default: _all)
      # @option arguments [List] :fields A comma-separated list of fields to return in the response
      # @option arguments [Boolean] :lenient Specify whether format-based query failures
      #                                      (such as providing text to a numeric field) should be ignored
      # @option arguments [Boolean] :lowercase_expanded_terms Specify whether query terms should be lowercased
      # @option arguments [String] :parent The ID of the parent document
      # @option arguments [String] :preference Specify the node or shard the operation should be performed on
      #                                        (default: random)
      # @option arguments [String] :q Query in the Lucene query string syntax
      # @option arguments [String] :routing Specific routing value
      # @option arguments [String] :source The URL-encoded query definition (instead of using the request body)
      # @option arguments [String] :_source Specify whether the _source field should be returned,
      #                                     or a list of fields to return
      # @option arguments [String] :_source_exclude A list of fields to exclude from the returned _source field
      # @option arguments [String] :_source_include A list of fields to extract and return from the _source field
      # @option arguments [List] :stored_fields A comma-separated list of stored fields to return in the response
      #
      # @see http://elasticsearch.org/guide/reference/api/explain/
      #
      def explain(arguments={})
        raise ArgumentError, "Required argument 'index' missing" unless arguments[:index]
        raise ArgumentError, "Required argument 'id' missing"    unless arguments[:id]
        method = HTTP_GET

        if arguments[:type]
          path   = Utils.__pathify Utils.__escape(arguments[:index]),
                                   Utils.__escape(arguments[:type]),
                                   Utils.__escape(arguments[:id]),
                                   '_explain'
        else
          path   = Utils.__pathify Utils.__escape(arguments[:index]),
                                   '_explain',
                                   Utils.__escape(arguments[:id])
        end

        params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)
        body   = arguments[:body]

        params[:fields] = Utils.__listify(params[:fields]) if params[:fields]

        perform_request(method, path, params, body).body
      end

      # Register this action with its valid params when the module is loaded.
      #
      # @since 6.1.1
      ParamsRegistry.register(:explain, [
          :analyze_wildcard,
          :analyzer,
          :default_operator,
          :df,
          :fields,
          :lenient,
          :lowercase_expanded_terms,
          :parent,
          :preference,
          :q,
          :routing,
          :source,
          :_source,
          :_source_includes,
          :_source_excludes,
          :stored_fields ].freeze)
    end
  end
end
