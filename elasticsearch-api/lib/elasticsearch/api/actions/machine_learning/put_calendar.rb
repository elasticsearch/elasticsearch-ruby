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
    module MachineLearning
      module Actions
        # Instantiates a calendar.
        #
        # @option arguments [String] :calendar_id The ID of the calendar to create
        # @option arguments [Hash] :headers Custom HTTP headers
        # @option arguments [Hash] :body The calendar details
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/8.7/ml-put-calendar.html
        #
        def put_calendar(arguments = {})
          raise ArgumentError, "Required argument 'calendar_id' missing" unless arguments[:calendar_id]

          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body = arguments.delete(:body)

          _calendar_id = arguments.delete(:calendar_id)

          method = Elasticsearch::API::HTTP_PUT
          path   = "_ml/calendars/#{Utils.__listify(_calendar_id)}"
          params = {}

          Elasticsearch::API::Response.new(
            perform_request(method, path, params, body, headers)
          )
        end
      end
    end
  end
end
