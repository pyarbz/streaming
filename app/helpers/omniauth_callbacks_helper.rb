module OmniauthCallbacksHelper
  GITHUB_MEMBER_LIST_URL = 'https://api.github.com/orgs/pyarbz/members'
  def self.fetch_list(urls)
    httpClient = HTTPClient.new
    begin
      # get request
      data = httpClient.get_content(urls)
      # return JSON.parse data
      return data
    rescue HTTPClient::BadResponseError => e
    rescue HTTPClient::TimeoutError => e
    end
  end

  def self.github_member_list()
    loginName = []
    hashData = JSON.parse(fetch_list(GITHUB_MEMBER_LIST_URL))
    hashData.each do |item|
      loginName.push(item['login'])
    end
    return loginName
  end

  def self.github_oauth_user(github_API_json)
    hashData = JSON.parse(github_API_json)
    return hashData['extra']['raw_info']['login']
  end

end
