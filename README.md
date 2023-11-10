![Simplify Time and Date presentation | Rails Quick Tips](https://f001.backblazeb2.com/file/webcrunch/quicktips/rails-quick-tips%20%20-%2009%20-%20Simplify%20Time%20and%20Date%20presentation.jpg)

# Simplify Time and Date presentation | Rails Quick Tips

Ruby and Rails provide convenient built-in Time and Date formats that allow developers to work efficiently. While these default formats serve most applications well, there are instances when customizing time and date presentation becomes necessary.

I find the standard approach to formatting dates and times in Ruby to be cumbersome, requiring memorizing various directives and using intricate method names.

In this article, I’ll explore how to simplify and streamline time and date formatting in Rails, saving you time and headaches.

### The traditional approach using `strftime` in Ruby

```ruby
Time.new(2023, 1, 1, 1).strftime('%I:%M:%S %p')  # => "01:00:00 AM"
Time.new(2023, 1).strftime('%B')  # => "January"
```

With Ruby you get some built in help when rendering Time and Date formats. Pass the directives you need to the `strftime` method and you're golden. The arguments are a string type but get manipulated based on your preference and directives passed.

[Learn more about the `strftime` method](https://ruby-doc.org/3.2.2/strftime_formatting_rdoc.html)

## Simplify with pre-initialized time and date formats

When introducing Rails to Ruby, we are met with databases and servers. Resourceful Data (Models) you save on tables comes stock with timestamps. These include the columns `created_at` and `updated_at`, which are great built-ins.

Saving this data as datetime types comes automatically but displaying and presenting such data is up to the application and developer. Enter Date and Time formatting.

I prefer to configure these upfront so you have a toolkit ready to rock and roll as you build out views and other components inside your application. That extends down to the configuration of the app on boot.

In most of my apps, I create a new initializer. You can name it whatever you prefer. These files get auto-loaded when the rails app first boots.

Below, I’ve extended the defaults for `:short` and `:long` and added another custom time format called `:nice`

```ruby
# config/initializers/time_formats.rb

# Define custom date formats
Date::DATE_FORMATS[:short] = '%b %d, %Y'
# Jan 01, 2023
Date::DATE_FORMATS[:long] = '%A, %B %d, %Y'
# Sunday, January 01, 2023

# Define custom time formats
Time::DATE_FORMATS[:short] = '%b %d, %Y %I:%M %p'
# Jan 01, 2023 03:30 PM
Time::DATE_FORMATS[:long] = '%A, %B %d, %Y at %I:%M %p'
# Sunday, January 01, 2023 at 03:30 PM

Time::DATE_FORMATS[:nice] = '%b %d, %Y at %I:%M %p'
# Jan 01, 2023 at 03:30 PM
```

After rebooting your app you can go make use of these pretty much anywhere. For an easy example I scaffolded a `Post` resource.

```ruby
rails g scaffold Post title body:text
```

I made a new post to save some dummy data and then went back to the post partial to add some dates and times to the mix.

```ruby
<!-- app/views/posts/_post.html.erb -->

  <div id="<%= dom_id post %>">
  <p>
    <strong>Title:</strong>
    <%= post.title %>
  </p>

  <p>
    <strong>Body:</strong>
    <%= post.body %>
  </p>

  <p>
    <strong>Created on </strong>
    <%= post.created_at.to_formatted_s(:nice) %>
  </p>

  <p>
    <strong>Last update: </strong>
    <%= post.updated_at.to_formatted_s(:nice) %>
  </p>

</div>
```

To format the timestamps, pass in the new format name we created, and viola, fancy-looking dates and times!

If you’re anything like me this is way easier to remember and less cumbersome than the `strftime` approach.

I hope this quick tip was helpful! See you on the next.

## More goods

- [View the full Quick tips collection](https://web-crunch.com/collections/rails-quick-tips)
- [Basecamp’s local_time library](https://github.com/basecamp/local_time) - Rails engine for cache-friendly, client-side local time
- [Rails API - DateTime Object](https://api.rubyonrails.org/classes/DateTime.html)
- [Rails API - Time Zone](https://api.rubyonrails.org/classes/ActiveSupport/TimeZone.html)

### Shameless love

- **New to Rails**? Hit the ground running with my course [Hello Rails](https://hellorails.io)–A modern course designed to help you start using and understanding Ruby on Rails fast.
- **Need help with design?** Check out [Rails UI](https://railsui.com) or hire me directly with [Rails UI custom](https://railsui.com/custom).
