# Totalizer - Calculate important metrics in your Rails application.

Provides tools to Ruby on Rails developers to create calculations for
acquisition, activation, engagement, retention and churn.

## Installation

Add this line to your application's Gemfile:

    gem 'totalizer'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install totalizer

## Usage

Totalizer provides tools to Ruby on Rails developers to create calculations for
metrics such as acquisition, activation, engagement, retention and churn.

### Metric

All calculations use one or more Metric objects. To create a Metric just use this in your Rails application:

```
Totalizer::Metric.new({ title: 'New Users', model: User })
```

This will return a Metric object with the following properties:

```
{ title: 'New Users', value: 10, previous_value: 5, change: 5, change_label: "+5" }
```

You can pass the following options into the Metric:
+ `model` (required): The Rails model class that Totalizer will query.
+ `start_date`: When to start measuring your records. Default is `Date.today.beginning_of_day`.
+ `duration`: Duration (in days) to measure your records. Default is `7`. Must be an integer.
+ `filter`: Write a custom query to filter to determine which records to use in
  calculation. For example to find all users who created a public response you could
pass in: `filter: "is_public = true"`.
+ `map`: Default is `id`. Decide which field to map unique records on. For
  example, to find unique users who did a response you could pass in: `map:
'user_id'`.

### Factory

The Totalizer Factory makes it easy to create summary's of your important metrics.

To create a Factory just use this in your Rails application:

```
Totalizer::Factory.new
```

You can pass the following options into the Factory:
+ `durations`: An array for the durations to create metrics for. Default is `[7, 30]`.
+ `start_date`: When to start measuring your records. Default is `Date.today.beginning_of_day`.

#### Counter

The counter factory will create a metric for each duration in your Factory from your Factory start date.

To build a counter Factory just use this in your Rails application:

```
@factory = Totalizer::Factory.new
@metrics = @factory.build :counter, model: User
```

This will return an array of Metric objects with the following properties:

```
[{ title: 'Last 7 days', value: 10, previous_value: 5, change: 5, change_label: "+5" }, { title: 'Last 30 days', value: 100, previous_value: 110, change: -10, change_label: "-10" }]
```

When you build a counter Factory you can pass all the same parameters available when you create a metric.

## Contributing

1. Fork it ( https://github.com/micdijkstra/totalizer/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Licence

The MIT License (MIT)

Copyright (c) 2014 Michael Dijkstra

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
