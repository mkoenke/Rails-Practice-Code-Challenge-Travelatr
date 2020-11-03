class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def sorted_posts
        sort = self.posts.sort_by(&:created_at)
           top_five = sort[0, 5]
           top_five.map do |post|
            post.title
           end
    end 

    def average_age
        unique_bloggers = self.bloggers.uniq
        total = unique_bloggers.inject(0) do |sum, blogger|
            sum + blogger.age
        end
        total/unique_bloggers.length 

        # age_array = unique_bloggers.map do |blogger|
        #     blogger.age
        # end
        # ages_summed = age_array.sum
        # bloggers_count = unqiue_bloggers.count
        # ages_summed / bloggers_count 
    end



end
