class VentureCapitalist

    attr_reader :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        @@all.select {|vc| vc.total_worth >= 1000000000}
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end 

    def funding_rounds
        FundingRound.all.select {|fr| fr.venture_capitalist == self}
    end 

    def portfolio
        (funding_rounds.map {|fr| fr.startup.name}).uniq.join(", ")
    end

    def biggest_investment
        (funding_rounds.map {|fr| fr.investment}).max
    end 

    def invested(domain)
        
        new_array = funding_rounds.select {|fr| fr.startup.domain == domain}
        (new_array.map {|fr| fr.investment}).sum
    end 

end
