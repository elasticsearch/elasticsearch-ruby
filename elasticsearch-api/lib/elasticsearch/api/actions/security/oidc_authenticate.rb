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
# Auto generated from build hash cf0d0c8ed43ab23b6d73c430a66aca4e771fce20
# @see https://github.com/elastic/elasticsearch/tree/main/rest-api-spec
#
module Elasticsearch
  module API
    module Security
      module Actions
        # Exchanges an OpenID Connection authentication response message for an Elasticsearch access token and refresh token pair
        #
        # @option arguments [Hash] :headers Custom HTTP headers
        # @option arguments [Hash] :body The OpenID Connect response to authenticate (*Required*)
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/8.7/security-api-oidc-authenticate.html
        #
        def oidc_authenticate(arguments = {})
          raise ArgumentError, "Required argument 'body' missing" unless arguments[:body]

          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body   = arguments.delete(:body)

          method = Elasticsearch::API::HTTP_POST
          path   = "_security/oidc/authenticate"
          params = {}

          Elasticsearch::API::Response.new(
            perform_request(method, path, params, body, headers)
          )
        end
      end
    end
  end
end
