class TestDetailSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :questions

  def questions
    object.questions.map{|question| QuestionSerializer.new(question)}
  end
end
