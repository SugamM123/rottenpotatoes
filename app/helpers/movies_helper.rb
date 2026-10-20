module MoviesHelper
  # makes a sortable <th>. clicking the column that's already sorted flips asc/desc
  def sort_header(label, column)
    if @sort == column
      new_direction = @direction == "asc" ? "desc" : "asc"
      arrow = @direction == "asc" ? " ▲" : " ▼"
      css_class = "sorted-#{@direction}"
      aria_sort = @direction == "asc" ? "ascending" : "descending"
    else
      new_direction = "asc"
      arrow = ""
      css_class = nil
      aria_sort = "none"
    end

    tag.th(class: css_class, aria: { sort: aria_sort }) do
      link_to label + arrow, movies_path(sort: column, direction: new_direction)
    end
  end

  def release_date_for(movie)
    movie.release_date&.strftime("%B %-d, %Y")
  end
end
