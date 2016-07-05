# russian_workdays

[![Build Status](https://travis-ci.org/heckfy/russian_workdays.svg?branch=master)](https://travis-ci.org/heckfy/russian_workdays)

Производственный календарь РФ

## Установка
Выполняем в терминале:

	gem install russian_workdays
	
и подгружаем:

```ruby
require 'russian_workdays'
```

## Использование

Получить массив с выходными днями в 2014 году

```ruby
RussianWorkdays.holidays(2014)
```

Получить массив с короткими днями в 2014 году

```ruby
RussianWorkdays.shorts(2014)
```

Получить массив с рабочими днями в 2014 году

```ruby
RussianWorkdays.works(2014)
```

Является ли дата выходным днем?

```ruby
RussianWorkdays.holiday?(Date.new 2014, 10, 5)
```

Является ли дата коротким днем?

```ruby
RussianWorkdays.short?(Date.new 2014, 10, 5)
```

Является ли дата рабочим днем?

```ruby
RussianWorkdays.work?(Date.new 2014, 10, 5)
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/russian_workdays/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
