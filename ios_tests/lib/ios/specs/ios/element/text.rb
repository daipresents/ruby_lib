# frozen_string_literal: true

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# rubocop:disable Lint/HandleExceptions,Style/RescueStandardError

# rake ios['ios/element/text']
describe 'ios/element/text' do
  def ui_catalog
    'UICatalog'
  end

  def uiview_transitions
    'Transitions'
  end

  def before_first
    screen.must_equal catalog
  end

  t 'before_first' do
    before_first
  end

  t 'first_text' do
    first_text.text.must_equal ui_catalog
  end

  t 'last_text' do
    expected = 'Transitions'

    last_text.text.must_equal expected
    last_text.name.must_equal expected
  end

  t 'text' do
    text('siti').text.must_equal uiview_transitions
    text(1).text.must_equal ui_catalog
    text('siti').name.must_equal uiview_transitions
  end

  t 'texts' do
    exp = ['Controls', 'Various uses of UIControl', 'Various uses of UISegmentedControl']
    texts.length.must_equal 24
    texts('trol').map(&:name).must_equal exp
    texts('uses').length.must_equal 7
  end

  t 'text_exact' do
    # should fail
    set_wait 0
    act = begin
            text_exact 'mos'
          rescue
            # nop
          end
    act.must_be_nil
    set_wait

    # should pass
    text_exact(ui_catalog).text.must_equal ui_catalog
  end

  t 'texts_exact' do
    texts_exact('UICatalog').length.must_equal 1
  end
end
# rubocop:enable Lint/HandleExceptions,Style/RescueStandardError
