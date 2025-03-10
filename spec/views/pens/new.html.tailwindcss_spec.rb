require 'rails_helper'

RSpec.describe "pens/new", type: :view do
  before(:each) do
    assign(:pen, Pen.new(
      name: "MyString"
    ))
  end

  it "renders new pen form" do
    render

    assert_select "form[action=?][method=?]", pens_path, "post" do

      assert_select "input[name=?]", "pen[name]"
    end
  end
end
