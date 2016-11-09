# Logstash Plugin

This is a plugin for [Logstash](https://github.com/elasticsearch/logstash).

It is fully free and fully open source. The license is Apache 2.0, meaning you are pretty much free to use it however you want in whatever way.

## Documentation

The logstash-filter-memorize filter will look for fields from an event and record the last value
of them.  If any are not present, their last value will be added to the
event.  This is useful if you want to use data from a previous event
on future events (for example a time field or an id field).  This differs
frome the multiline filter where you are combining multiple lines to
create a single event.

## Example
```ruby
	if [message] =~ /Header:/ {
		grok {
			match => [ "message", "Header: %{WORD:headerField}" ]
		}
	}
        # either save the datetime or add it based on last value
        memorize {
           field => 'headerField'
           default => 'NOTFOUND'
        }
	# get rid of the header event since we don't want to do anything with it
	if [message] =~ /Header:/) {
		drop {}
	}

	# headerField is now present in the event
	#... other filters here ...
```
