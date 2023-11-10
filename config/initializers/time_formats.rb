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
