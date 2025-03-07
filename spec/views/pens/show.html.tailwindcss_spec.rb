require 'rails_helper'

RSpec.describe "pens/show", type: :view do
  before(:each) do
    assign(:pen, Pen.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
