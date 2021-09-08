# ReevooSapience::Rb

[![Build Status](https://travis-ci.org/reevoo/reevoo_sapience-rb.svg?branch=master)](https://travis-ci.org/reevoo/reevoo_sapience-rb)[![Code Climate](https://codeclimate.com/github/reevoo/reevoo_sapience-rb/badges/gpa.svg)](https://codeclimate.com/github/reevoo/reevoo_sapience-rb)[![Test Coverage](https://codeclimate.com/github/reevoo/reevoo_sapience-rb/badges/coverage.svg)](https://codeclimate.com/github/reevoo/reevoo_sapience-rb/coverage)[![Issue Count](https://codeclimate.com/github/reevoo/reevoo_sapience-rb/badges/issue_count.svg)](https://codeclimate.com/github/reevoo/reevoo_sapience-rb)

# Deprecated

We have decided not to use this gem because its basically just a yml file.

It creates a lot of issues when debugging locally - for instance, if using Mark, and wanting to run a pry session inside the sapience gem, we cant do that.

The normal way is to use `bundle config local` - https://rossta.net/blog/how-to-specify-local-ruby-gems-in-your-gemfile.html#-quot-bundle-config-local-quot-to-the-rescue

this does work with gemspecs & nor does specifying a path.

The yml file `lib/default_reevoo_sapience.yml` should be merged into each application when switching from reevoo_sapience to just plain sapience.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'reevoo_sapience'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install reevoo_sapience

## Usage

There is nothing to be done here. The gem contains a reevoo specific override `sapience.yml` with the configuration the Reevoo Ltd. company uses internally. It is used to centralize logging, metrics and exception collection within our organization.

Our configuration can be found in [lib/default_reevoo_sapience.yml](https://github.com/reevoo/reevoo_sapience-rb/blob/master/lib/default_reevoo_sapience.yml).
