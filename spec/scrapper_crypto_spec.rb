require_relative '../lib/scrapper_crypto'


def crypto_test(coin)
    a=false
    scraper.map{|i| if i.keys==[coin] then a=true end }
    return a
  end

  describe "test if main currency are there" do
    it "should return BTC" do    
      expect(crypto_test("Bitcoin")).to be true
    end
  end

  describe "test if main currency are there" do
    it "should return ETH" do    
      expect(crypto_test("Ethereum")).to be true
    end
  end

  describe "test if enough currency are there" do
    it "should return true" do    
      expect(scraper.count).to be > 2000
    end
  end

  describe "test if main currency are there" do
    it "should return XRP" do    
      expect(crypto_test("XRP")).to be true
    end
  end