class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :label, :description, :options

  def options
    object.options.map{|option| OptionSerializer.new(option)}
  end
end
