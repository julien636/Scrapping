require_relative '../lib/scrapper_mairie'


def mairie_test(coin)
    a=false
    city=get_all_email
    city.map{|i| if i.keys==[coin] then a=true end }
    return a
  end

  describe "test if mail is there" do
    it "should return communication@ville-courdimanche.fr" do    
      expect(mairie_test("communication@ville-courdimanche.fr")).to be true
    end
  end

  describe "test if mail is there" do
    it "should return bonneuil-en-france95@orange.fr" do    
      expect(mairie_test("bonneuil-en-france95@orange.fr")).to be true
    end
  end

  describe "test if mail is there" do
    it "should return true" do    
      expect(get_all_email.count).to be > 50
    end
  end

  describe "test if mail is there" do
    it "should return melody.quesnel@ville-bessancourt.fr" do    
      expect(mairie_test("melody.quesnel@ville-bessancourt.fr")).to be true
    end
  end