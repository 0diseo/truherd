require 'rails_helper'

RSpec.describe "pens/index", type: :view do
  before(:each) do
    assign(:pens, [
      Pen.create!(
        name: "Name"
      ),
      Pen.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of pens" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
  end
end
