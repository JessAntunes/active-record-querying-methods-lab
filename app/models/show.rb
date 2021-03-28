class Show < ActiveRecord::Base

    def self.highest_rating
        show = Show.all.order(rating: :desc).first
        show.rating
    end

    def self.most_popular_show
        rating = Show.highest_rating
        Show.find_by(rating: rating)
    end

    def self.lowest_rating
        show = Show.all.order(:rating).first
        show.rating
    end

    def self.least_popular_show
        rating = Show.lowest_rating
        Show.find_by(rating: rating)
    end

    def self.ratings_sum
        sum = 0
        Show.all.each {|show| sum += show.rating}
        sum
    end

    def self.popular_shows
        Show.all.where("rating > 5")
    end

    def self.shows_by_alphabetical_order
        Show.all.order(:name)
    end
    

end