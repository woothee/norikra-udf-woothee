require 'norikra/udf_spec_helper'

include Norikra::UDFSpecHelper

require 'norikra/udf/woothee'

describe Norikra::UDF::WootheeParseAgent do
  udf_function Norikra::UDF::WootheeParseAgent

  it 'can parse user-agent and returns HashMap instance' do
    r = call(:parseAgent, "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)")
    expect(r['name']).to eql('Googlebot')
    expect(r['category']).to eql('crawler')
  end
end

describe Norikra::UDF::WootheeUDF do
  udf_function Norikra::UDF::WootheeParseAgent
  udf_function Norikra::UDF::WootheeUDF

  it 'provides isPC' do
    pc_agent = "Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Win64; x64; Trident/6.0)"
    expect(call(:isPC, call(:parseAgent, pc_agent))).to be_true

    smartphone_agent = "Mozilla/5.0 (iPhone; CPU iPhone OS 5_0_1 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mobile/9A405 Safari/7534.48.3"
    expect(call(:isPC, call(:parseAgent, smartphone_agent))).to be_false
  end

  it 'provides isSmartPhone' do
    smartphone_agent = "Mozilla/5.0 (iPhone; CPU iPhone OS 5_0_1 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mobile/9A405 Safari/7534.48.3"
    expect(call(:isSmartPhone, call(:parseAgent, smartphone_agent))).to be_true

    mobilephone_agent = "DoCoMo/2.0 SH01A(c100;TB;W24H16)"
    expect(call(:isSmartPhone, call(:parseAgent, mobilephone_agent))).to be_false
  end

  it 'provides isMobilePhone' do
    mobilephone_agent = "DoCoMo/2.0 SH01A(c100;TB;W24H16)"
    expect(call(:isMobilePhone, call(:parseAgent, mobilephone_agent))).to be_true

    appliance_agent = "Mozilla/5.0 (PLAYSTATION 3; 1.00)"
    expect(call(:isMobilePhone, call(:parseAgent, appliance_agent))).to be_false
  end

  it 'provides isAppliance' do
    appliance_agent = "Mozilla/5.0 (PLAYSTATION 3; 1.00)"
    expect(call(:isAppliance, call(:parseAgent, appliance_agent))).to be_true

    misc_agent = "Windows-RSS-Platform/2.0 (MSIE 9.0; Windows NT 6.0)"
    expect(call(:isAppliance, call(:parseAgent, misc_agent))).to be_false
  end

  it 'provides isMisc' do
    misc_agent = "Windows-RSS-Platform/2.0 (MSIE 9.0; Windows NT 6.0)"
    expect(call(:isMisc, call(:parseAgent, misc_agent))).to be_true

    crawler_agent = "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)"
    expect(call(:isMisc, call(:parseAgent, crawler_agent))).to be_false
  end

  it 'provides isCrawler' do
    crawler_agent = "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)"
    expect(call(:isCrawler, call(:parseAgent, crawler_agent))).to be_true

    pc_agent = "Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Win64; x64; Trident/6.0)"
    expect(call(:isCrawler, call(:parseAgent, pc_agent))).to be_false
  end

  it 'provides isIn' do
    pc_agent = "Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Win64; x64; Trident/6.0)"
    agent = call(:parseAgent, pc_agent)
    expect(call(:isIn, agent, ['pc','smartphone','mobilephone','appliance'])).to be_true
    expect(call(:isIn, agent, ['misc','crawler'])).to be_false
  end
end
