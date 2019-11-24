class Startup

    attr_reader :name, :founder, :domain

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(name, domain)
        #still a little wacky - returns altered startup twice
        (self.send(:initialize, domain, founder, name))
    end

    def self.all
        @@all
    end 

    def self.find_by_founder(founder)
        @@all.find {|su| su.founder == founder}
    end

    def self.domains
        @@all.map {|su| su.domain}
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def su_funding_rounds
        FundingRound.all.select {|fr| fr.startup == self}
    end

    def num_funding_rounds
        su_funding_rounds.length
    end 

    def total_funds
        (su_funding_rounds.map {|su| su.investment}).sum
    end

    def investors
        (su_funding_rounds.map {|su| su.venture_capitalist}).uniq
    end

    def big_investors
        (investors.select {|investors| investors.total_worth >= 1000000000}).uniq
    end 

end