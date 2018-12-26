module AplusApi
  class Connection
    include HTTParty
    base_uri 'https://attendcoreapi.aplusattendance.com/v1/'

    def get(path, params = {})
      response = self.class.get(self.class.base_uri + "/" + path, query: params, headers: headers)
      puts response.inspect
      puts response.request.inspect
      if response.code == "200"
        JSON.parse(response.body)
      else
        raise "HTTP Response was " + response.code.to_s
      end
    end

    def delete(path, params = {})
      response = self.class.delete(self.class.base_uri + "/" + path, query: params, headers: headers)
    end

    def post(path, data)
      response = self.class.post(self.class.base_uri + "/" + path, body: data.to_json, headers: headers)
      puts response.inspect
      puts response.request.inspect
      return response.code == "200"
    end

    def headers
      # raise "Authentication needed." unless AplusApi::Config.api_key.present?
      { "Authorization" => AplusApi::Config.api_key, "content-type" => "application/json"}
    end

  end
end

HTTParty.post("https://attendcoreapi.aplusattendance.com/v1/student", body: { id: "string2", firstName: "string2", lastName: "string3", udf1: "string4", udf2: "string5", udf3: "string6", udf4: "string7", udf5: "string8", udf6: "string9" }, :headers=>{"Authorization"=>"4fKd_rTT~RLoJ*TfrkqVa6wMQw*Ql4Uq"})
