# encoding: utf-8

module Application
  class Price < ActiveRecord::Base
    LABEL = [
      'inscription et assurance',
      'Leçon de 50 min.',
      'Examen de pratique',
      '6h',
      '8h',
      '12h',
      'Préparation à l’examen, remise à niveau et perfectionnements'
    ]

    default_scope :order => 'position ASC'

    def to_s
      LABEL[position]
    end
  end
end
