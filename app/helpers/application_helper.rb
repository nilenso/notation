# frozen_string_literal: true

module ApplicationHelper
  def sortable(column)
    direction = column == params[:sort] && params[:direction] == "asc" ? "desc" : "asc"
    link_to "", {sort: column, direction: direction}, {class: "fa fa-sort"}
  end
end
