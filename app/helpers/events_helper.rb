module EventsHelper

  def snippet(name)
    snippet_body = ""
    snippet = @event.snippets.find_by_name(name)
    snippet_body = snippet.body if snippet
    snippet_body
  end

end
