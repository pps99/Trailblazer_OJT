class LogMiddleware

    def initialize(app)
      @app = app
    end

    def call(env)

        puts "LogMiddleware has been hit!!!"

        puts'Do a bunch of cool logic here aboout the request'\

        return [401, {'Content-Type' => 'text/plain'}, ['Unauthorized']]

        status, headers , response = @app.call(env)

        [status,headers,responde]
    end
end

