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

require 'spec_helper'

describe Elasticsearch::DSL::Search::Filters::GeoDistanceRange do

  describe '#to_hash' do

    let(:search) do
      described_class.new
    end

    it 'can be converted to a hash' do
      expect(search.to_hash).to eq(geo_distance_range: {})
    end
  end

  context 'when options methods are called' do

    let(:search) do
      described_class.new(:foo)
    end

    describe '#lat' do

      before do
        search.lat('bar')
      end

      it 'applies the option' do
        expect(search.to_hash[:geo_distance_range][:foo][:lat]).to eq('bar')
      end
    end

    describe '#lon' do

      before do
        search.lon('bar')
      end

      it 'applies the option' do
        expect(search.to_hash[:geo_distance_range][:foo][:lon]).to eq('bar')
      end
    end
  end

  describe '#initialize' do

    context 'when a block is provided' do

      let(:search) do
        described_class.new do
          lat 40
          lon -70
        end
      end

      it 'executes the block' do
        expect(search.to_hash).to eq(geo_distance_range: { lat: 40, lon: -70 })
      end

      context 'when options are also provided' do

        let(:search) do
          described_class.new :foo, from: '10km', to: '20km' do
            lat 40
            lon -70
          end
        end

        it 'executes the block' do
          expect(search.to_hash).to eq(geo_distance_range: { foo: { lat: 40, lon: -70 }, from: '10km', to: '20km' })
        end
      end
    end

    context 'when options are provided' do

      let(:search) do
        described_class.new(from: '10km', to: '20km', foo: { lat: 40, lon: -70 })
      end

      it 'executes the block' do
        expect(search.to_hash).to eq(geo_distance_range: { foo: { lat: 40, lon: -70 }, from: '10km', to: '20km' })
      end
    end
  end
end