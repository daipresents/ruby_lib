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

# XCUIElementTypeButton methods
module Appium
  module Ios
    module Xcuitest
      module Element
        # XCUIElementTypeButton = 'XCUIElementTypeButton'

        # @return [String] Class name for button
        def button_class
          ::Appium::Ios::XCUIELEMENT_TYPE_BUTTON
        end

        # Find the first UIAButton|XCUIElementTypeButton that contains value or by index.
        # @param value [String, Integer] the value to exactly match.
        # If int then the UIAButton|XCUIElementTypeButton at that index is returned.
        # @return [UIA_BUTTON|XCUIELEMENT_TYPE_BUTTON]
        def button(value)
          # return button at index.
          return ele_index button_class, value if value.is_a? Numeric

          raise_error_if_no_element buttons(value).first
        end

        # Find all UIAButtons|XCUIElementTypeButtons containing value.
        # If value is omitted, all UIAButtons|XCUIElementTypeButtons are returned.
        # @param value [String] the value to search for
        # @return [Array<UIA_BUTTON|XCUIELEMENT_TYPE_BUTTON>]
        def buttons(value = false)
          return tags button_class unless value

          elements = find_eles_by_predicate_include(class_name: button_class, value: value)
          select_visible_elements elements
        end

        # Find the first UIAButton|XCUIElementTypeButton.
        # @return [UIA_BUTTON|XCUIELEMENT_TYPE_BUTTON]
        def first_button
          first_ele button_class
        end

        # TODO: add documentation regarding previous element.
        #       Previous UIAElement is differ from UIAButton|XCUIElementTypeButton. So, the results are different.
        # Find the last UIAButton|XCUIElementTypeButton.
        # @return [UIA_BUTTON|XCUIELEMENT_TYPE_BUTTON]
        def last_button
          last_ele button_class
        end

        # Find the first UIAButton|XCUIElementTypeButton that exactly matches value.
        # @param value [String] the value to match exactly
        # @return [UIA_BUTTON|XCUIELEMENT_TYPE_BUTTON]
        def button_exact(value)
          raise_error_if_no_element buttons_exact(value).first
        end

        # Find all UIAButtons|XCUIElementTypeButtons that exactly match value.
        # @param value [String] the value to match exactly
        # @return [Array<UIA_BUTTON|XCUIELEMENT_TYPE_BUTTON>]
        def buttons_exact(value)
          elements = find_eles_by_predicate(class_name: button_class, value: value)
          select_visible_elements elements
        end
      end # moudule button
    end # module Xcuitest
  end # module Ios
end # module Appium
