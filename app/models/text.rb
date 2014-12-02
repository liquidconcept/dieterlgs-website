# encoding: utf-8

module Application
  class Text < ActiveRecord::Base
    LABEL = ['Texte de promotion']

    default_scope :order => 'position ASC'

    def to_s
      LABEL[position]
    end
  end
end
