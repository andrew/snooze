require 'rubygems'
require 'bundler/setup'
require 'eventmachine'
require 'em-http-request'
require 'remailer'

EM.run do
  @sites = ENV['SNOOZE_SITES'].split(',')

  def done
    @progress ||= 0
    @progress += 1
    EM.stop if @progress == @sites.length
  end
  
  def email(site, error)
    return unless ENV['SNOOZE_EMAIL']
    email = EM::Protocols::SmtpClient.send(
      :domain     =>"heroku.com",
      :host       =>'smtp.sendgrid.net',
      :port       =>587, 
      :starttls   =>true,
      :user_name  => ENV['SENDGRID_USERNAME'],
      :password   => ENV['SENDGRID_PASSWORD'],
      :from       =>"snooze@herokuapp.com",
      :to         => ENV['SNOOZE_EMAIL'],
      :header     => {"Subject" => "Snooze: #{site} failed to wake up"},
      :body       => "The site #{site} failed to wake up with the following error: #{error}
                      \nYou might want to look into it.")
  end

  @sites.each do |site|
    http = EM::HttpRequest.new(site).get :connect_timeout => 60

    http.errback do |e|
      email(site)
      done
    end
    http.callback do
      p site
      done
    end
  end
end