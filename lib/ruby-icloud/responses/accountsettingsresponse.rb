module Cloud
  class AccountSettingsResponse < PlistResponse
    def process client
      client.tokens.merge! @content[:tokens]
      client.account_info.merge! @content[:appleAccountInfo]
      features = {}
      @content[:"com.apple.mobileme"].reject {|key,val| key == :availableFeatures }.each do |key, value|
        newkey = key.to_s.sub('com.apple.Dataclass.', '').to_sym
        features[newkey] = value.merge({dataclassname: key.to_s})
      end
      client.features.merge! features
    end
  end
end