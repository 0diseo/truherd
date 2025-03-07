require 'rails_helper'

RSpec.describe "pens/edit", type: :view do
  let(:pen) {
    Pen.create!(
      name: "MyString"
    )
  }

  before(:each) do
    assign(:pen, pen)
  end

  it "renders the edit pen form" do
    render

    assert_select "form[action=?][method=?]", pen_path(pen), "post" do

      assert_select "input[name=?]", "pen[name]"
    end
  end
end
