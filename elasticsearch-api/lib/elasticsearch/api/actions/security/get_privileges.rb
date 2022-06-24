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
# Auto generated from build hash 7faba7ad1bfe9ef9b821e7bca858346ca80e6030
# @see https://github.com/elastic/elasticsearch/tree/main/rest-api-spec
#
module Elasticsearch
  module API
    module Security
      module Actions
        # Retrieves application privileges.
        #
        # @option arguments [String] :application Application name
        # @option arguments [String] :name Privilege name
        # @option arguments [Hash] :headers Custom HTTP headers
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/8.3/security-api-get-privileges.html
        #
        def get_privileges(arguments = {})
          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body = nil

          _application = arguments.delete(:application)

          _name = arguments.delete(:name)

          method = Elasticsearch::API::HTTP_GET
          path   = if _application && _name
                     "_security/privilege/#{Utils.__listify(_application)}/#{Utils.__listify(_name)}"
                   elsif _application
                     "_security/privilege/#{Utils.__listify(_application)}"
                   else
                     "_security/privilege"
                   end
          params = {}

          Elasticsearch::API::Response.new(
            perform_request(method, path, params, body, headers)
          )
        end
      end
    end
  end
end
