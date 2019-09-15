class RootController < ApplicationController
  def top
    @makers = Maker.all
  end
end
