# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

require 'spec_helper'

describe 'client#render_search_template' do
  context 'when no id is specified' do
    let(:expected_args) do
      [
        'GET',
        '_render/template',
        {},
        { foo: 'bar' }
      ]
    end

    it 'performs the request' do
      expect(client_double.render_search_template(body: { foo: 'bar' })).to eq({})
    end
  end

  context 'when id is specified' do
    let(:expected_args) do
      [
        'GET',
        '_render/template/foo',
        {},
        { foo: 'bar' }
      ]
    end

    it 'performs the request' do
      expect(client_double.render_search_template(id: 'foo', body: { foo: 'bar' })).to eq({})
    end
  end
end
