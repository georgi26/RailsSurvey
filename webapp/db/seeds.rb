# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

survey = Survey.first
unless survey
  Survey.transaction do
    survey = Survey.create(name: "Ще отстрани ли Висшия съдебен съвет главния прокурор Иван Гешев.")
    Answer.create(survey_id: survey.id, text: "Да, в сигнала на Бойко Борисов има достатъчно данни за негови нарушения.")
    Answer.create(survey_id: survey.id, text: "Да, съдебния съвет няма как да си затвори очите.")
    Answer.create(survey_id: survey.id, text: "Да, за да се направят на независими.")
    Answer.create(survey_id: survey.id, text: "Да, за да се изберат наследника му като изпреварят евнтуални промени в самия съвет.")
    Answer.create(survey_id: survey.id, text: "Не няма достатъчно данни, а действията им са политически пиар.")
    Answer.create(survey_id: survey.id, text: "Не членовете на ВСС са зависими и няма да се осмелят да го освободят.")
    Answer.create(survey_id: survey.id, text: "#Кой знае.")
    Answer.create(survey_id: survey.id, text: "Нямам мнение.")
    Answer.create(survey_id: survey.id, text: "Не ме интересува.")
  end
end
