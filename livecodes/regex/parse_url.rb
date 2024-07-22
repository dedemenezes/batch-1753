def parse_url(url)
  url_regex = /^(?<scheme>https?):\/{2}(?<subdomain>w{3})\.(?<domain>\w+)(?<top_level_domain>\.\w{2,})(?<path>[\w\/]*)\??(?<params>[=\w]*)/
  match_data = url.match(url_regex)
  paths = match_data[:path].split('/')
  paths.delete('')

  # p match_data[:params]
  # if match_data[:params].empty?
  #   params_hash = {}
  # else
  #   query_params = match_data[:params].split('=') #=> "search=currywurst" || ["search", "currywurst"]
  #   params_hash = { query_params[0].to_sym => query_params[1] }
  # end

  unless match_data[:params].empty?
    query_params = match_data[:params].split('=') #=> "search=currywurst" || ["search", "currywurst"]
    params_hash = { query_params[0].to_sym => query_params[1] }
  else
    params_hash = {}
  end

  {
    scheme: match_data[:scheme],
    subdomain: match_data[:subdomain],
    domain: match_data[:domain],
    top_level_domain: match_data[:top_level_domain],
    path: paths,
    params: params_hash
  }
end
