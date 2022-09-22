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
# Auto generated from build hash c462e504756a92dcafba3fbf944152babda8999f
# @see https://github.com/elastic/elasticsearch/tree/main/rest-api-spec
#
module Elasticsearch
  module API
    module MachineLearning
      module Actions
        # Previews that will be analyzed given a data frame analytics config.
        #
        # @option arguments [String] :id The ID of the data frame analytics to preview
        # @option arguments [Hash] :headers Custom HTTP headers
        # @option arguments [Hash] :body The data frame analytics config to preview
        #
        # @see http://www.elastic.co/guide/en/elasticsearch/reference/8.5/preview-dfanalytics.html
        #
        def preview_data_frame_analytics(arguments = {})
          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body = arguments.delete(:body)

          _id = arguments.delete(:id)

          method = if body
                     Elasticsearch::API::HTTP_POST
                   else
                     Elasticsearch::API::HTTP_GET
                   end

          path   = if _id
                     "_ml/data_frame/analytics/#{Utils.__listify(_id)}/_preview"
                   else
                     "_ml/data_frame/analytics/_preview"
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
