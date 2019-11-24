require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

vc1 = VentureCapitalist.new("Anthony", 1000000000)
vc2 = VentureCapitalist.new("Victor", 90000000)
vc3 = VentureCapitalist.new("Ryan", 3000000000)
vc4 = VentureCapitalist.new("Mark", 800000000)

su1 = Startup.new("S&S Barbell", "Jordan Berke", "sns.com")
su2 = Startup.new("Power Plates", "Gaby Nunez", "powerplates.com")
su3 = Startup.new("Wag 'n Wash'", "John Doe", "wagnwash.com")

fr1 = FundingRound.new(su1, vc1, "Series B", 900000)
fr2 = FundingRound.new(su2, vc3, "Series A", 100000)
fr3 = FundingRound.new(su3, vc4, "Pre-Seed", 50000)
fr4 = FundingRound.new(su1, vc3, "Series C", 300000)
fr5 = FundingRound.new(su3, vc4, "Series A", 700000)


binding.pry
#leave this here to ensure binding.pry isn't the last line