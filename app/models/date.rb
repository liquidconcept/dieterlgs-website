# encoding: utf-8

module Application
  class Date < ActiveRecord::Base
    LABEL = [
      'Cours obligatoires - 6h',
      'Cours obligatoires - 8h',
      'Cours obligatoires - 12h',
      'Préparation - 1h - maîtrise technique',
      'Préparation - 1h - maîtrise de la circulation',
      'Préparation - 2h - maîtrise technique et de la circulation'
    ]

    def to_s
      LABEL[position]
    end
  end
end
