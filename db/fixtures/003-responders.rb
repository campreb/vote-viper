election = Election.find(1)
1.upto(5) do |id|
  Responder.seed do |r|
    r.id = id
    r.email = Faker::Internet.email
    r.name = Faker::Name.name
    r.election = election
  end
end
