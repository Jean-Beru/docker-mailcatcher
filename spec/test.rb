require 'json'
require 'net/http'
require 'net/smtp'

fixtures = File.dirname(__FILE__) + '/fixtures/'
api = Net::HTTP.new('0.0.0.0', 1080)

RSpec.describe 'Mailcatcher' do
  before :all do
    api.delete('/messages')
  end

  it "can receive an email" do
    content = File.open(fixtures + 'mail.txt').read
    Net::SMTP.start('0.0.0.0', 1025) do |smtp|
      smtp.send_message content, 'to@example.com', 'cc@example.com'
    end

    response = JSON.parse(api.get('/messages').body)

    expect(response.count).to eq 1
    expect(response[0]['id']).to eq 1
    expect(response[0]['sender']).to eq '<to@example.com>'
    expect(response[0]['recipients']).to eq ['<cc@example.com>']
    expect(response[0]['subject']).to eq 'test message'
    expect(response[0]['size']).to eq "141"
  end
end
