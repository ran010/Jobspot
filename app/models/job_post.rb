class JobPost < ApplicationRecord
  include PgSearch
  belongs_to :recuitor

  has_many :job_educations, dependent: :destroy
  has_many :educations, :through => :job_educations
  accepts_nested_attributes_for :job_educations


  has_many :job_categories, dependent: :destroy
  has_many :categories, :through => :job_categories
  accepts_nested_attributes_for :job_categories

  has_many :apply_jobs, dependent: :destroy

  has_many :job_skills, dependent: :destroy
  has_many :skills, :through => :job_skills
  accepts_nested_attributes_for :job_skills
  scope :ordered_by_created_at, -> { order(created_at: :desc) }

  #
  # pg_search_scope :quick_search,
  #                 against: [:job_title,:location],
  #                 associated_against: {
  #                   skills: [:name],
  #                   categories: [:name]
  #                 }
  def self.fuzzy_search(query)
    query = query.downcase
    query_reg = /#{query.split('').join('.*?')}/
    sorted = []
    self.all.each do |string|
        match = query_reg.match string.job_title.downcase
        sorted << {string: string, rank: match.to_s.length} if match
    end
    sorted.sort_by! {|i| i[:rank] }
    sorted.map{|arr| arr[:string]}
  end
  # def self.fuzzy_search(query)
  #   query_regexp = query.split('').join('.*')
  #   where_clauses = []
  #   %w[job_title location job_type].each do |column|
  #     where_clauses << "#{column} ~* '#{query_regexp}'"
  #   end
  #   where_clauses << "'educations.eduName' ~* '#{query_regexp}'"
  #   where_clauses << "skills.name ~* '#{query_regexp}'"
  #   posts = JobPost.includes(:educations, :skills).where(where_clauses.join(' OR ')).references(:educations, :skills)
  # end
end
