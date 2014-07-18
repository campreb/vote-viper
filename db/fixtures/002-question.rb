campaign = Campaign.find(1)

Question.seed do |q|
  q.id = 1
  q.campaign_id = campaign.id
  q.title = "National President"
  q.sort_order = 1
end

("A".."E").each do |opt|
  Option.seed :question_id, :name do  |o|
    o.question_id = 1
    o.name = "Option #{opt}"
  end
end
