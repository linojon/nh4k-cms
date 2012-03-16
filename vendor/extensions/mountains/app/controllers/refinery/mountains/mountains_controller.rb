module Refinery
  module Mountains
    class MountainsController < ::ApplicationController

      before_filter :find_all_mountains
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @mountain in the line below:
        present(@page)
      end

      def show
        @mountain = Mountain.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @mountain in the line below:
        present(@page)
      end

    protected

      def find_all_mountains
        @mountains = Mountain.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/mountains").first
      end

    end
  end
end
