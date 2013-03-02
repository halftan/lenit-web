module ProvidersHelper
  def show_or_hide_links provider
    links = "<td>#{link_to "Show", provider}</td>" if can? :read, Provider
    if can? :manage, Provider and user_signed_in?
      links += "<td>#{link_to "Edit", edit_user_provider_path(current_user, provider)}</td>"
      links += "<td>#{link_to "Destroy", [current_user, provider], :confirm => 'Are you sure?', :method => :delete}</td>"
    end
    links
  end
end
