module Totalizer
  class Factory
    def initialize params={}
      @params = params
    end

    def build metric_type, options={}
      summary = []
      durations.each do |duration|
        summary << self.send("build_#{metric_type}", options.merge(title: "Last #{duration} #{'day'.pluralize(duration)}", start_date: start_date, duration: duration))
      end
      summary
    end

    def durations
      @params[:durations] || [7, 30]
    end

    def start_date
      @params[:start_date] || Date.today.beginning_of_day
    end

    private

    def build_counter options={}
      Metric.new options
    end

    def build_funnel options={}
      metrics = []
      options[:steps].each do |step|
        metrics << Metric.new(step.merge(start_date: options[:start_date], duration: options[:duration]))
      end
      Funnel.new title: options[:title], metrics: metrics
    end
  end
end
