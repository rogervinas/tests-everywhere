[![CI](https://github.com/rogervinas/tests-everywhere/actions/workflows/ruby.yml/badge.svg)](https://github.com/rogervinas/tests-everywhere/actions/workflows/ruby.yml)
![Ruby](https://img.shields.io/badge/Ruby-3.x-blue?labelColor=black)

# Ruby

[Ruby](https://www.ruby-lang.org) testing with [RSpec](https://rspec.info/)

- [Show me the code](#show-me-the-code)
  - [Implementation](#implementation)
  - [Test](#test)
- [Run this project using 🐳 docker](#run-this-project-using--docker)
- [Run this project locally](#run-this-project-locally)

## Show me the code

### Implementation

1. Create `HelloMessage` class in [HelloMessage.rb](lib/HelloMessage.rb):

```ruby
class HelloMessage
  def text
    @text = "Hello World!"
  end
end
```

2. Create `HelloConsole` class in [HelloConsole.rb](lib/HelloConsole.rb):

```ruby
class HelloConsole
  def print(text)
    puts text
  end
end
```

3. Create `HelloApp` class in [HelloApp.rb](lib/HelloApp.rb):

```ruby
class HelloApp
  def initialize(message, console)
    @message = message
    @console = console
  end

  def printHello
    @console.print(@message.text)
  end
end
```

4. Create main function in [Main.rb](Main.rb) that wraps it all together:

```ruby
message = HelloMessage.new
console = HelloConsole.new
app = HelloApp.new message, console
app.printHello
```

### Test

Following [RSpec Core](https://rspec.info/features/3-12/rspec-core/) and [RSpec Mocks](https://rspec.info/features/3-12/rspec-mocks/) guides ...

1. Test `HelloMessage` in [HelloMessage_spec.rb](spec/HelloMessage_spec.rb):

```ruby
RSpec.describe HelloMessage do
  it "should return hello world" do
    message = HelloMessage.new
    expect(message.text).to eq("Hello World!")
  end
end
```

2. Test `HelloApp` in [HelloApp_spec.rb](spec/HelloApp_spec.rb):

```ruby
RSpec.describe HelloApp do
  it "should print hello message" do
    messageText = "Hello Test!"

    # 2.1 Create a mock of HelloMessage
    # that will return "Hello Test!" whenever text is called
    message = instance_double("HelloMessage", :text => messageText)

    # 2.2 Create a mock of HelloConsole
    console = instance_double("HelloConsole")
    # 2.3 Expect print to be called once with "Hello Test!"
    expect(console).to receive(:print).once.with(messageText)

    # 2.4 Create a HelloApp, the one we want to test, passing the mocks
    app = HelloApp.new message, console
    # 2.5 Execute the method we want to test
    app.printHello

    # Expectation 2.3 will be checked once test ends
  end
end
```

3. Test output should look like:

```
HelloApp
  should print hello message

HelloMessage
  should return hello world

Finished in 0.00457 seconds (files took 0.05704 seconds to load)
2 examples, 0 failures
```

## Run this project using 🐳 [docker](https://www.docker.com/)

- Execute `./docker-run.sh`
- Once inside the container:
  - First time only, install dependencies with `bundle install`
  - Test with `rspec -fd`
  - Run with `ruby lib/Main.rb`

## Run this project locally

### Pre-requisites

- Install [Ruby](https://www.ruby-lang.org/en/documentation/installation/) manually or ...
  - Install [renv](https://github.com/rbenv/rbenv#readme) version manager and ..
    - List available versions executing `rbenv install -l`
    - Install **Ruby** executing `rbenv install 3.2.2` and `rbenv global 3.2.2`

### Run locally

- First time only, install dependencies with `bundle install`
- Test with `rspec -fd`
- Run with `ruby lib/Main.rb`

### Create project from scratch

- Just create a [Gemfile](Gemfile)
- Execute `bundle install`
