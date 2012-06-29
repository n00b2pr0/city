class Article < ActiveRecord::Base
  attr_accessible :author, :body, :footer, :notes, :path, :status, :tags, :title, :site_id, :layout_id, :redis_hash

  # callbacks
  before_save :generate_redis_hash
  after_save :create_render

  # relationships
  belongs_to :site
  belongs_to :layout
  has_many :renders, :as => :renderable


  # timestamp publishing
  # filter :range, published_at: {lte: Time.zone.now}

  private
  def generate_redis_hash
    self.redis_hash = rand(36**10).to_s(36)
  end

  def create_render
    self.renders.first.destroy rescue nil
    article = self.body
    # matches = article.scan(/{{\s*include\s*[^{}]+\s*}}/)
    # if matches.length > 0
    #   matches.each do |match|
    #     include_title = match.scan(/{{\s*include\s*(.*?)\s*}}/)[0][0].to_s
    #     include = Include.where(title: include_title, site_id: self.site_id).first
    #     article = include ? article.sub(match, include.body) : article.sub(match, "No include found for #{include_title}")
    #   end
    # end
    $redis.set(self.redis_hash, article)
  end
end
